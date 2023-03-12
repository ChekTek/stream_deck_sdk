import 'event_manager.dart';
import 'events.dart';
import 'events/did_receive_settings_event.dart';

class Action {
  final String _uuid;

  Action(this._uuid);

  void on(String event, Function(dynamic event) callback) {
    EventManager.on(event, callback);
  }

  void emit(String event, dynamic data) {
    EventManager.emit(event, data);
  }

  void logMessage(String message) {
    EventManager.emit(EventsSent.logMessage, message);
  }

  void onDidReceiveSettings(Function(DidReceiveSettingsEvent event) callback) {
    EventManager.on<DidReceiveSettingsEvent>('${this._uuid}.${EventsReceived.didReceiveSettings}', callback);
  }

  void onKeyDown(Function(dynamic event) callback) {
    EventManager.on('${this._uuid}.${EventsReceived.keyDown}', callback);
  }

  void onKeyUp(Function(dynamic event) callback) {
    EventManager.on('${this._uuid}.${EventsReceived.keyUp}', callback);
  }

  void onWillAppear(Function(dynamic event) callback) {
    EventManager.on('${this._uuid}.${EventsReceived.willAppear}', callback);
  }

  void onWillDisappear(Function(dynamic event) callback) {
    EventManager.on('${this._uuid}.${EventsReceived.willDisappear}', callback);
  }

  void onTitleParametersDidChange(Function(dynamic event) callback) {
    EventManager.on('${this._uuid}.${EventsReceived.titleParametersDidChange}', callback);
  }

  void onPropertyInspectorDidAppear(Function(dynamic event) callback) {
    EventManager.on('${this._uuid}.${EventsReceived.propertyInspectorDidAppear}', callback);
  }

  void onPropertyInspectorDidDisappear(Function(dynamic event) callback) {
    EventManager.on('${this._uuid}.${EventsReceived.propertyInspectorDidDisappear}', callback);
  }

  void onSendToPlugin(Function(dynamic event) callback) {
    EventManager.on('${this._uuid}.${EventsReceived.sendToPlugin}', callback);
  }

  void onDialRotate(Function(dynamic event) callback) {
    EventManager.on('${this._uuid}.${EventsReceived.dialRotate}', callback);
  }

  void onDialPress(Function(dynamic event) callback) {
    EventManager.on('${this._uuid}.${EventsReceived.dialPress}', callback);
  }

  void onTouchTap(Function(dynamic event) callback) {
    EventManager.on('${this._uuid}.${EventsReceived.touchTap}', callback);
  }
}
