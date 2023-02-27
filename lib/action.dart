import 'event_manager.dart';
import 'events.dart';

class Action {
  final String _uuid;

  Action(this._uuid);

  void on(String event, Function(Map event) callback) {
    EventManager.on(event, callback);
  }

  void emit(String event, dynamic data) {
    EventManager.emit(event, data);
  }

  void onDidReceiveSettings(Function(Map event) callback) {
    this.on('${this._uuid}.${EventsReceived.didReceiveSettings}', callback);
  }

  void onKeyDown(Function(Map event) callback) {
    this.on('${this._uuid}.${EventsReceived.keyDown}', callback);
  }

  void onKeyUp(Function(Map event) callback) {
    this.on('${this._uuid}.${EventsReceived.keyUp}', callback);
  }

  void onWillAppear(Function(Map event) callback) {
    this.on('${this._uuid}.${EventsReceived.willAppear}', callback);
  }

  void onWillDisappear(Function(Map event) callback) {
    this.on('${this._uuid}.${EventsReceived.willDisappear}', callback);
  }

  void onTitleParametersDidChange(Function(Map event) callback) {
    this.on('${this._uuid}.${EventsReceived.titleParametersDidChange}', callback);
  }

  void onPropertyInspectorDidAppear(Function(Map event) callback) {
    this.on('${this._uuid}.${EventsReceived.propertyInspectorDidAppear}', callback);
  }

  void onPropertyInspectorDidDisappear(Function(Map event) callback) {
    this.on('${this._uuid}.${EventsReceived.propertyInspectorDidDisappear}', callback);
  }

  void onSendToPlugin(Function(Map event) callback) {
    this.on('${this._uuid}.${EventsReceived.sendToPlugin}', callback);
  }

  void onDialRotate(Function(Map event) callback) {
    this.on('${this._uuid}.${EventsReceived.dialRotate}', callback);
  }

  void onDialPress(Function(Map event) callback) {
    this.on('${this._uuid}.${EventsReceived.dialPress}', callback);
  }

  void onTouchTap(Function(Map event) callback) {
    this.on('${this._uuid}.${EventsReceived.touchTap}', callback);
  }
}
