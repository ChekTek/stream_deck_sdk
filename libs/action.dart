import 'event_manager.dart';
import 'events.dart';

class Action {
  final String _uuid;

  Action(this._uuid);

  void on(String event, Function fn) {
    EventManager.on(event, fn);
  }

  void emit(String event, dynamic data) {
    EventManager.emit(event, data);
  }

  void onDidReceiveSettings(Function callback) {
    this.on('${this._uuid}.${EventsReceived.didReceiveSettings}', callback);
  }

  void onKeyDown(Function callback) {
    this.on('${this._uuid}.${EventsReceived.keyDown}', callback);
  }

  void onKeyUp(Function callback) {
    this.on('${this._uuid}.${EventsReceived.keyUp}', callback);
  }

  void onWillAppear(Function callback) {
    this.on('${this._uuid}.${EventsReceived.willAppear}', callback);
  }

  void onWillDisappear(Function callback) {
    this.on('${this._uuid}.${EventsReceived.willDisappear}', callback);
  }

  void onTitleParametersDidChange(Function callback) {
    this.on('${this._uuid}.${EventsReceived.titleParametersDidChange}', callback);
  }

  void onPropertyInspectorDidAppear(Function callback) {
    this.on('${this._uuid}.${EventsReceived.propertyInspectorDidAppear}', callback);
  }

  void onPropertyInspectorDidDisappear(Function callback) {
    this.on('${this._uuid}.${EventsReceived.propertyInspectorDidDisappear}', callback);
  }

  void onSendToPlugin(Function callback) {
    this.on('${this._uuid}.${EventsReceived.sendToPlugin}', callback);
  }

  void onDialRotate(Function callback) {
    this.on('${this._uuid}.${EventsReceived.dialRotate}', callback);
  }

  void onDialPress(Function callback) {
    this.on('${this._uuid}.${EventsReceived.dialPress}', callback);
  }

  void onTouchTap(Function callback) {
    this.on('${this._uuid}.${EventsReceived.touchTap}', callback);
  }
}
