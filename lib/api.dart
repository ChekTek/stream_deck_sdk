import 'dart:convert';
import 'dart:io';

import 'event_manager.dart';
import 'events.dart';
import 'logger.dart';
import 'plugin_arguments.dart';

abstract class API {
  int? _port;
  String? uuid;
  Info? _info;
  WebSocket? _websocket;

  void on(String event, Function(Map event) callback) {
    EventManager.on(event, callback);
  }

  void emit(String event, Map data) {
    EventManager.emit(event, data);
  }

  Future<void> connect(PluginArguments arguments) async {
    await Logger.connect();
    this._port = arguments.port;
    this.uuid = arguments.pluginUuid;
    this._info = arguments.info;

    if (_websocket != null) {
      this._websocket?.close();
      this._websocket = null;
    }

    this._websocket = await WebSocket.connect('ws://127.0.0.1:$_port');

    this._websocket!.add(jsonEncode({"uuid": this.uuid, "event": "registerPlugin"}));

    this.emit(EventsReceived.connected, {
      "uuid": this.uuid,
      "info": this._info,
    });

    this._websocket!.listen((socketEvent) {
      var data = jsonDecode(socketEvent);
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

  void onConnected(Function(Map event) callback) {
    this.on(EventsReceived.connected, callback);
  }

  void onDidReceiveGlobalSettings(Function(Map event) callback) {
    this.on(EventsReceived.didReceiveGlobalSettings, callback);
  }

  void onDidReceiveSettings(String action, Function(Map event) callback) {
    this.on(action + EventsReceived.didReceiveSettings, callback);
  }
}
