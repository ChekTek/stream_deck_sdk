import 'dart:convert';
import 'dart:io';

import 'event_manager.dart';
import 'events.dart';

abstract class API {
  late String? _port;
  late String? uuid;
  late String? _messageType;
  late String? _actionInfo;
  late String? _appInfo;
  late WebSocket? _websocket;
  late dynamic? appInfo;
  late dynamic? _data;

  void on(String event, Function callback) {
    EventManager.on(event, callback);
  }

  void emit(String event, dynamic data) {
    EventManager.emit(event, data);
  }

  void connect(String port, String uuid, String messageType, String appInfoString, String actionString) async {
    this._port = port;
    this.uuid = uuid;
    this._messageType = messageType;
    this._actionInfo = actionString; // TODO: type this
    this._appInfo = appInfoString; // TODO: type this
    // TODO: add language from app info

    if (this._websocket != null) {
      this._websocket?.close();
      this._websocket = null;
    }

    this._websocket = await WebSocket.connect('ws://localhost:$_port');

    this.send(this.uuid as String, _messageType as String);

    this.emit(EventsReceived.connected, {
      "uuid": this.uuid,
      "actionInfo": this._actionInfo,
      "appInfo": this._appInfo,
      "messageType": this._messageType,
    });

    this._websocket?.listen((socketEvent) {
      var data = socketEvent?.data != null ? jsonDecode(socketEvent.data) : null;
      if (data != null) {
        var action = data['action'];
        var event = data['event'];
        var message = action != null ? '${action}.${event}' : event;

        if (message != null) {
          this.emit(message, data);
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
    this.send(this.uuid as String, EventsSent.logMessage, {
      "message": message,
    });
  }

  void setGlobalSettings(dynamic payload) {
    this.send(this.uuid as String, EventsSent.setGlobalSettings, payload);
  }

  void getGlobalSettings() {
    this.send(this.uuid as String, EventsSent.getGlobalSettings, null);
  }

  void openUrl(String url) {
    this.send(this.uuid as String, EventsSent.openUrl, {
      "url": url,
    });
  }

  void onConnected(Function callback) {
    this.on(EventsReceived.connected, callback);
  }

  void onDidReceiveGlobalSettings(Function callback) {
    this.on(EventsReceived.didReceiveGlobalSettings, callback);
  }

  void onDidReceiveSettings(String action, Function callback) {
    this.on(action + EventsReceived.didReceiveSettings, callback);
  }
}
