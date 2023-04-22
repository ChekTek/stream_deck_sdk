import 'events/dial_down.dart';
import 'events/dial_rotate.dart';
import 'events/dial_up.dart';
import 'events/key_down.dart';
import 'events/key_up.dart';
import 'events/property_inspector_did_appear.dart';
import 'events/property_inspector_did_disappear.dart';
import 'events/send_to_plugin.dart';
import 'events/title_parameters_did_change.dart';
import 'events/touch_tap.dart';
import 'events/will_appear.dart';
import 'events/will_disappear.dart';

import 'event_manager.dart';
import 'events.dart';
import 'events/did_receive_settings.dart';

/// A Stream Deck plugin action, where you can register callback functions for different events
class Action {
  final String _uuid;

  Action(this._uuid);

  /// Listen for custom events
  void on(String event, Function(dynamic event) callback) {
    EventManager.on(event, callback);
  }

  /// Emit custom events
  void emit(String event, dynamic data) {
    EventManager.emit(event, data);
  }

  /// Write to a log file
  void logMessage(String message) {
    EventManager.emit(EventsSent.logMessage, message);
  }

  /// Registers a callback function for the didReceiveSettings event, which fires when calling getSettings
  void onDidReceiveSettings(Function(DidReceiveSettings event) callback) {
    EventManager.on<DidReceiveSettings>(
        '${this._uuid}.${EventsReceived.didReceiveSettings}', callback);
  }

  /// Registers a callback function for the keyDown event, which fires when pressing a key down
  void onKeyDown(Function(KeyDown event) callback) {
    EventManager.on<KeyDown>(
        '${this._uuid}.${EventsReceived.keyDown}', callback);
  }

  /// Registers a callback function for the keyUp event, which fires when releasing a key
  void onKeyUp(Function(KeyUp event) callback) {
    EventManager.on<KeyUp>('${this._uuid}.${EventsReceived.keyUp}', callback);
  }

  /// Registers a callback function for the willAppear event, which fires when an action appears on the canvas
  void onWillAppear(Function(WillAppear event) callback) {
    EventManager.on<WillAppear>(
        '${this._uuid}.${EventsReceived.willAppear}', callback);
  }

  /// Registers a callback function for the willDisappear event, which fires when an action disappears on the canvas
  void onWillDisappear(Function(WillDisappear event) callback) {
    EventManager.on<WillDisappear>(
        '${this._uuid}.${EventsReceived.willDisappear}', callback);
  }

  /// Registers a callback function for the titleParametersDidChange event, which fires when a user changes the key title
  void onTitleParametersDidChange(
      Function(TitleParametersDidChange event) callback) {
    EventManager.on<TitleParametersDidChange>(
        '${this._uuid}.${EventsReceived.titleParametersDidChange}', callback);
  }

  /// Registers a callback function for the propertyInspectorDidAppear event, which fires when the property inspector is displayed
  void onPropertyInspectorDidAppear(
      Function(PropertyInspectorDidAppear event) callback) {
    EventManager.on<PropertyInspectorDidAppear>(
        '${this._uuid}.${EventsReceived.propertyInspectorDidAppear}', callback);
  }

  /// Registers a callback function for the propertyInspectorDidDisappear event, which fires when the property inspector is closed
  void onPropertyInspectorDidDisappear(
      Function(PropertyInspectorDidDisappear event) callback) {
    EventManager.on<PropertyInspectorDidDisappear>(
        '${this._uuid}.${EventsReceived.propertyInspectorDidDisappear}',
        callback);
  }

  /// Registers a callback function for the sendToPlugin event, which fires when the property inspector uses the sendToPlugin api
  void onSendToPlugin(Function(SendToPlugin event) callback) {
    EventManager.on<SendToPlugin>(
        '${this._uuid}.${EventsReceived.sendToPlugin}', callback);
  }

  /// Registers a callback function for the onDialRotate event, which fires when a SD+ dial was rotated
  void onDialRotate(Function(DialRotate event) callback) {
    EventManager.on<DialRotate>(
        '${this._uuid}.${EventsReceived.dialRotate}', callback);
  }

  /// Registers a callback function for the dialDown event, which fires when a SD+ dial was pressed
  void onDialDown(Function(DialDown event) callback) {
    EventManager.on<DialDown>(
        '${this._uuid}.${EventsReceived.dialDown}', callback);
  }

  /// Registers a callback function for the dialUp event, which fires when a pressed SD+ dial was released
  void onDialUp(Function(DialUp event) callback) {
    EventManager.on<DialUp>('${this._uuid}.${EventsReceived.dialUp}', callback);
  }

  /// Registers a callback function for the touchTap event, which fires when a SD+ touch panel was touched quickly
  void onTouchTap(Function(TouchTap event) callback) {
    EventManager.on<TouchTap>(
        '${this._uuid}.${EventsReceived.touchTap}', callback);
  }
}
