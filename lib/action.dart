import 'package:stream_deck_sdk/events/dial_down_event.dart';
import 'package:stream_deck_sdk/events/dial_rotate_event.dart';
import 'package:stream_deck_sdk/events/dial_up_event.dart';
import 'package:stream_deck_sdk/events/key_down_event.dart';
import 'package:stream_deck_sdk/events/key_up_event.dart';
import 'package:stream_deck_sdk/events/property_inspector_did_appear_event.dart';
import 'package:stream_deck_sdk/events/property_inspector_did_disappear_event.dart';
import 'package:stream_deck_sdk/events/send_to_plugin_event.dart';
import 'package:stream_deck_sdk/events/title_parameters_did_change_event.dart';
import 'package:stream_deck_sdk/events/touch_tap_event.dart';
import 'package:stream_deck_sdk/events/will_appear_event.dart';
import 'package:stream_deck_sdk/events/will_disappear_event.dart';

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

  void onKeyDown(Function(KeyDownEvent event) callback) {
    EventManager.on<KeyDownEvent>('${this._uuid}.${EventsReceived.keyDown}', callback);
  }

  void onKeyUp(Function(KeyUpEvent event) callback) {
    EventManager.on<KeyUpEvent>('${this._uuid}.${EventsReceived.keyUp}', callback);
  }

  void onWillAppear(Function(WillAppearEvent event) callback) {
    EventManager.on<WillAppearEvent>('${this._uuid}.${EventsReceived.willAppear}', callback);
  }

  void onWillDisappear(Function(WillDisappearEvent event) callback) {
    EventManager.on<WillDisappearEvent>('${this._uuid}.${EventsReceived.willDisappear}', callback);
  }

  void onTitleParametersDidChange(Function(TitleParametersDidChangeEvent event) callback) {
    EventManager.on<TitleParametersDidChangeEvent>(
        '${this._uuid}.${EventsReceived.titleParametersDidChange}', callback);
  }

  void onPropertyInspectorDidAppear(Function(PropertyInspectorDidAppearEvent event) callback) {
    EventManager.on<PropertyInspectorDidAppearEvent>(
        '${this._uuid}.${EventsReceived.propertyInspectorDidAppear}', callback);
  }

  void onPropertyInspectorDidDisappear(Function(PropertyInspectorDidDisappearEvent event) callback) {
    EventManager.on<PropertyInspectorDidDisappearEvent>(
        '${this._uuid}.${EventsReceived.propertyInspectorDidDisappear}', callback);
  }

  void onSendToPlugin(Function(SendToPluginEvent event) callback) {
    EventManager.on<SendToPluginEvent>('${this._uuid}.${EventsReceived.sendToPlugin}', callback);
  }

  void onDialRotate(Function(DialRotateEvent event) callback) {
    EventManager.on<DialRotateEvent>('${this._uuid}.${EventsReceived.dialRotate}', callback);
  }

  void onDialDown(Function(DialDownEvent event) callback) {
    EventManager.on<DialDownEvent>('${this._uuid}.${EventsReceived.dialDown}', callback);
  }

  void onDialUp(Function(DialUpEvent event) callback) {
    EventManager.on<DialUpEvent>('${this._uuid}.${EventsReceived.dialDown}', callback);
  }

  void onTouchTap(Function(TouchTapEvent event) callback) {
    EventManager.on<TouchTapEvent>('${this._uuid}.${EventsReceived.touchTap}', callback);
  }
}
