import 'dart:convert';
import 'dart:io';

import 'package:stream_deck_sdk/events/application_did_launch_event.dart';
import 'package:stream_deck_sdk/events/device_did_connect_event.dart';
import 'package:stream_deck_sdk/events/device_did_disconnect_event.dart';
import 'package:stream_deck_sdk/events/dial_down_event.dart';
import 'package:stream_deck_sdk/events/dial_rotate_event.dart';
import 'package:stream_deck_sdk/events/dial_up_event.dart';
import 'package:stream_deck_sdk/events/did_receive_global_settings_event.dart';
import 'package:stream_deck_sdk/events/key_down_event.dart';
import 'package:stream_deck_sdk/events/key_up_event.dart';
import 'package:stream_deck_sdk/events/property_inspector_did_appear_event.dart';
import 'package:stream_deck_sdk/events/property_inspector_did_disappear_event.dart';
import 'package:stream_deck_sdk/events/send_to_plugin_event.dart';
import 'package:stream_deck_sdk/events/send_to_property_inspector_event.dart';
import 'package:stream_deck_sdk/events/system_did_wake_up_event.dart';
import 'package:stream_deck_sdk/events/title_parameters_did_change_event.dart';
import 'package:stream_deck_sdk/events/touch_tap_event.dart';
import 'package:stream_deck_sdk/events/will_appear_event.dart';
import 'package:stream_deck_sdk/events/will_disappear_event.dart';

import 'event_manager.dart';
import 'events.dart';
import 'plugin_arguments.dart';
import 'logger.dart';
import 'events/did_receive_settings_event.dart';

abstract class API {
  int? _port;
  String? uuid;
  Info? _info;
  WebSocket? _websocket;

  Future<void> connect(PluginArguments arguments) async {
    this._port = arguments.port;
    this.uuid = arguments.pluginUuid;
    this._info = arguments.info;

    if (_websocket != null) {
      this._websocket?.close();
      this._websocket = null;
    }

    this._websocket = await WebSocket.connect('ws://127.0.0.1:$_port');

    this._websocket!.add(jsonEncode({"uuid": this.uuid, "event": "registerPlugin"}));

    EventManager.on(EventsSent.logMessage, (message) {
      this.logMessage(message as String);
    });

    EventManager.emit(EventsReceived.connected, {
      "uuid": this.uuid,
      "info": this._info,
    });

    this._websocket!.listen((socketEvent) {
      var data = jsonDecode(socketEvent);
      Logger.debug(data);
      if (data != null) {
        var action = data['action'];
        var event = data['event'];
        var message = action != null ? '${action}.${event}' : event;

        if (message != null) {
          switch (event) {
            case EventsReceived.didReceiveSettings:
              EventManager.emit<DidReceiveSettings>(message, DidReceiveSettings.fromJson(data));
              break;
            case EventsReceived.didReceiveGlobalSettings:
              EventManager.emit<DidReceiveGlobalSettings>(message, DidReceiveGlobalSettings.fromJson(data));
              break;
            case EventsReceived.keyDown:
              EventManager.emit<KeyDown>(message, KeyDown.fromJson(data));
              break;
            case EventsReceived.keyUp:
              EventManager.emit<KeyUp>(message, KeyUp.fromJson(data));
              break;
            case EventsReceived.touchTap:
              EventManager.emit<TouchTapEvent>(message, TouchTapEvent.fromJson(data));
              break;
            case EventsReceived.dialDown:
              EventManager.emit<DialDown>(message, DialDown.fromJson(data));
              break;
            case EventsReceived.dialUp:
              EventManager.emit<DialUp>(message, DialUp.fromJson(data));
              break;
            case EventsReceived.dialRotate:
              EventManager.emit<DialRotate>(message, DialRotate.fromJson(data));
              break;
            case EventsReceived.willAppear:
              EventManager.emit<WillAppearEvent>(message, WillAppearEvent.fromJson(data));
              break;
            case EventsReceived.willDisappear:
              EventManager.emit<WillDisappearEvent>(message, WillDisappearEvent.fromJson(data));
              break;
            case EventsReceived.titleParametersDidChange:
              EventManager.emit<TitleParametersDidChangeEvent>(message, TitleParametersDidChangeEvent.fromJson(data));
              break;
            case EventsReceived.deviceDidConnect:
              EventManager.emit<DeviceDidConnect>(message, DeviceDidConnect.fromJson(data));
              break;
            case EventsReceived.deviceDidDisconnect:
              EventManager.emit<DeviceDidDisconnect>(message, DeviceDidDisconnect.fromJson(data));
              break;
            case EventsReceived.applicationDidLaunch:
              EventManager.emit<ApplicationDidLaunch>(message, ApplicationDidLaunch.fromJson(data));
              break;
            case EventsReceived.systemDidWakeUp:
              EventManager.emit<SystemDidWakeUpEvent>(message, SystemDidWakeUpEvent.fromJson(data));
              break;
            case EventsReceived.propertyInspectorDidAppear:
              EventManager.emit<PropertyInspectorDidAppearEvent>(
                  message, PropertyInspectorDidAppearEvent.fromJson(data));
              break;
            case EventsReceived.propertyInspectorDidDisappear:
              EventManager.emit<PropertyInspectorDidDisappearEvent>(
                  message, PropertyInspectorDidDisappearEvent.fromJson(data));
              break;
            case EventsReceived.sendToPlugin:
              EventManager.emit<SendToPluginEvent>(message, SendToPluginEvent.fromJson(data));
              break;
            case EventsReceived.sendToPropertyInspector:
              EventManager.emit<SendToPropertyInspectorEvent>(message, SendToPropertyInspectorEvent.fromJson(data));
              break;
            default:
              EventManager.emit(message, data);
          }
        }
      }
    });
  }

  void send(String context, String event, [dynamic payload]) {
    if (_websocket == null) {
      throw Exception('WebSocket is not connected');
    }

    var message = jsonEncode({
      "context": context,
      "event": event,
      "payload": payload,
    });

    this._websocket?.add(message);
  }

  void logMessage(String message) {
    this.send(this.uuid!, EventsSent.logMessage, {
      "message": message,
    });
  }

  void setGlobalSettings(dynamic payload) {
    this.send(this.uuid!, EventsSent.setGlobalSettings, payload);
  }

  void getGlobalSettings() {
    this.send(this.uuid!, EventsSent.getGlobalSettings, null);
  }

  void openUrl(String url) {
    this.send(this.uuid!, EventsSent.openUrl, {
      "url": url,
    });
  }

  void onConnected(Function(dynamic event) callback) {
    EventManager.on(EventsReceived.connected, callback);
  }

  void onDidReceiveGlobalSettings(Function(dynamic event) callback) {
    EventManager.on(EventsReceived.didReceiveGlobalSettings, callback);
  }

  void onDidReceiveSettings(String action, Function(dynamic event) callback) {
    EventManager.on(action + EventsReceived.didReceiveSettings, callback);
  }
}
