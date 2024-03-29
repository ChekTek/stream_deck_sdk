import 'dart:convert';
import 'dart:io';
import 'events/application_did_launch.dart';
import 'events/application_did_terminate.dart';
import 'events/device_did_connect.dart';
import 'events/device_did_disconnect.dart';
import 'events/dial_down.dart';
import 'events/dial_rotate.dart';
import 'events/dial_up.dart';
import 'events/did_receive_global_settings.dart';
import 'events/key_down.dart';
import 'events/key_up.dart';
import 'events/property_inspector_did_appear.dart';
import 'events/property_inspector_did_disappear.dart';
import 'events/send_to_plugin.dart';
import 'events/send_to_property_inspector.dart';
import 'events/system_did_wake_up.dart';
import 'events/title_parameters_did_change.dart';
import 'events/touch_tap.dart';
import 'events/will_appear.dart';
import 'events/will_disappear.dart';
import 'event_manager.dart';
import 'events.dart';
import 'events/did_receive_settings.dart';
import 'plugin_arguments.dart';

/// API class containing all required code to establish a connection with the Stream Deck Software
abstract class API {
  int? _port;
  String? uuid;
  Info? _info;
  WebSocket? _websocket;

  /// Connect to the Stream Deck Software
  Future<void> connect(PluginArguments arguments) async {
    this._port = arguments.port;
    this.uuid = arguments.pluginUuid;
    this._info = arguments.info;

    if (_websocket != null) {
      this._websocket!.close();
      this._websocket = null;
    }

    this._websocket = await WebSocket.connect('ws://127.0.0.1:$_port');

    this
        ._websocket!
        .add(jsonEncode({"uuid": this.uuid, "event": "registerPlugin"}));

    EventManager.on<String>(EventsSent.logMessage, (message) {
      this.logMessage(message);
    });

    EventManager.emit(EventsReceived.connected, {
      "uuid": this.uuid,
      "info": this._info,
    });

    this._websocket!.listen(
      (socketEvent) {
        var data = jsonDecode(socketEvent);
        if (data != null) {
          var action = data['action'];
          var event = data['event'];
          var message = action != null ? '${action}.${event}' : event;

          if (message != null) {
            switch (event) {
              case EventsReceived.didReceiveSettings:
                EventManager.emit<DidReceiveSettings>(
                    message, DidReceiveSettings.fromJson(data));
                break;
              case EventsReceived.didReceiveGlobalSettings:
                EventManager.emit<DidReceiveGlobalSettings>(
                    message, DidReceiveGlobalSettings.fromJson(data));
                break;
              case EventsReceived.keyDown:
                EventManager.emit<KeyDown>(message, KeyDown.fromJson(data));
                break;
              case EventsReceived.keyUp:
                EventManager.emit<KeyUp>(message, KeyUp.fromJson(data));
                break;
              case EventsReceived.touchTap:
                EventManager.emit<TouchTap>(message, TouchTap.fromJson(data));
                break;
              case EventsReceived.dialDown:
                EventManager.emit<DialDown>(message, DialDown.fromJson(data));
                break;
              case EventsReceived.dialUp:
                EventManager.emit<DialUp>(message, DialUp.fromJson(data));
                break;
              case EventsReceived.dialRotate:
                EventManager.emit<DialRotate>(
                    message, DialRotate.fromJson(data));
                break;
              case EventsReceived.willAppear:
                EventManager.emit<WillAppear>(
                    message, WillAppear.fromJson(data));
                break;
              case EventsReceived.willDisappear:
                EventManager.emit<WillDisappear>(
                    message, WillDisappear.fromJson(data));
                break;
              case EventsReceived.titleParametersDidChange:
                EventManager.emit<TitleParametersDidChange>(
                    message, TitleParametersDidChange.fromJson(data));
                break;
              case EventsReceived.deviceDidConnect:
                EventManager.emit<DeviceDidConnect>(
                    message, DeviceDidConnect.fromJson(data));
                break;
              case EventsReceived.deviceDidDisconnect:
                EventManager.emit<DeviceDidDisconnect>(
                    message, DeviceDidDisconnect.fromJson(data));
                break;
              case EventsReceived.applicationDidLaunch:
                EventManager.emit<ApplicationDidLaunch>(
                    message, ApplicationDidLaunch.fromJson(data));
                break;
              case EventsReceived.applicationDidTerminate:
                EventManager.emit<ApplicationDidTerminate>(
                    message, ApplicationDidTerminate.fromJson(data));
                break;
              case EventsReceived.systemDidWakeUp:
                EventManager.emit<SystemDidWakeUp>(
                    message, SystemDidWakeUp.fromJson(data));
                break;
              case EventsReceived.propertyInspectorDidAppear:
                EventManager.emit<PropertyInspectorDidAppear>(
                    message, PropertyInspectorDidAppear.fromJson(data));
                break;
              case EventsReceived.propertyInspectorDidDisappear:
                EventManager.emit<PropertyInspectorDidDisappear>(
                    message, PropertyInspectorDidDisappear.fromJson(data));
                break;
              case EventsReceived.sendToPlugin:
                EventManager.emit<SendToPlugin>(
                    message, SendToPlugin.fromJson(data));
                break;
              case EventsReceived.sendToPropertyInspector:
                EventManager.emit<SendToPropertyInspector>(
                    message, SendToPropertyInspector.fromJson(data));
                break;
              default:
                EventManager.emit(message, data);
            }
          }
        }
      },
      onDone: () {
        exit(1);
      },
    );
  }

  /// Send a message to the Stream Deck Software
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

  /// Write a message to the log file
  void logMessage(String message) {
    this.send(this.uuid!, EventsSent.logMessage, {
      "message": message,
    });
  }

  /// Securely save the plugin's persistent data
  void setGlobalSettings(dynamic payload) {
    this.send(this.uuid!, EventsSent.setGlobalSettings, payload);
  }

  /// Request the plugin's persistent data. StreamDeck does not return the data, but trigger the plugin/property inspectors didReceiveGlobalSettings event
  void getGlobalSettings() {
    this.send(this.uuid!, EventsSent.getGlobalSettings, null);
  }

  /// Opens a URL in the default web browser
  void openUrl(String url) {
    this.send(this.uuid!, EventsSent.openUrl, {
      "url": url,
    });
  }

  /// Registers a callback function for when Stream Deck is connected
  void onConnected(Function(dynamic event) callback) {
    EventManager.on(EventsReceived.connected, callback);
  }

  /// Registers a callback function for the didReceiveGlobalSettings event, which fires when calling getGlobalSettings
  void onDidReceiveGlobalSettings(Function(dynamic event) callback) {
    EventManager.on(EventsReceived.didReceiveGlobalSettings, callback);
  }

  /// Registers a callback function for the didReceiveSettings event, which fires when calling getSettings
  void onDidReceiveSettings(String action, Function(dynamic event) callback) {
    EventManager.on(action + EventsReceived.didReceiveSettings, callback);
  }
}
