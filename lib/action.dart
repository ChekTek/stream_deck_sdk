import 'package:stream_deck_sdk/events/dial_down.dart';
import 'package:stream_deck_sdk/events/dial_rotate.dart';
import 'package:stream_deck_sdk/events/dial_up.dart';
import 'package:stream_deck_sdk/events/key_down.dart';
import 'package:stream_deck_sdk/events/key_up.dart';
import 'package:stream_deck_sdk/events/property_inspector_did_appear.dart';
import 'package:stream_deck_sdk/events/property_inspector_did_disappear.dart';
import 'package:stream_deck_sdk/events/send_to_plugin.dart';
import 'package:stream_deck_sdk/events/title_parameters_did_change.dart';
import 'package:stream_deck_sdk/events/touch_tap.dart';
import 'package:stream_deck_sdk/events/will_appear.dart';
import 'package:stream_deck_sdk/events/will_disappear.dart';

import 'event_manager.dart';
import 'events.dart';
import 'events/did_receive_settings.dart';

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

  void onDidReceiveSettings(Function(DidReceiveSettings event) callback) {
    EventManager.on<DidReceiveSettings>('${this._uuid}.${EventsReceived.didReceiveSettings}', callback);
  }

  void onKeyDown(Function(KeyDown event) callback) {
    EventManager.on<KeyDown>('${this._uuid}.${EventsReceived.keyDown}', callback);
  }

  void onKeyUp(Function(KeyUp event) callback) {
    EventManager.on<KeyUp>('${this._uuid}.${EventsReceived.keyUp}', callback);
  }

  void onWillAppear(Function(WillAppear event) callback) {
    EventManager.on<WillAppear>('${this._uuid}.${EventsReceived.willAppear}', callback);
  }

  void onWillDisappear(Function(WillDisappear event) callback) {
    EventManager.on<WillDisappear>('${this._uuid}.${EventsReceived.willDisappear}', callback);
  }

  void onTitleParametersDidChange(Function(TitleParametersDidChange event) callback) {
    EventManager.on<TitleParametersDidChange>(
        '${this._uuid}.${EventsReceived.titleParametersDidChange}', callback);
  }

  void onPropertyInspectorDidAppear(Function(PropertyInspectorDidAppear event) callback) {
    EventManager.on<PropertyInspectorDidAppear>(
        '${this._uuid}.${EventsReceived.propertyInspectorDidAppear}', callback);
  }

  void onPropertyInspectorDidDisappear(Function(PropertyInspectorDidDisappear event) callback) {
    EventManager.on<PropertyInspectorDidDisappear>(
        '${this._uuid}.${EventsReceived.propertyInspectorDidDisappear}', callback);
  }

  void onSendToPlugin(Function(SendToPlugin event) callback) {
    EventManager.on<SendToPlugin>('${this._uuid}.${EventsReceived.sendToPlugin}', callback);
  }

  void onDialRotate(Function(DialRotate event) callback) {
    EventManager.on<DialRotate>('${this._uuid}.${EventsReceived.dialRotate}', callback);
  }

  void onDialDown(Function(DialDown event) callback) {
    EventManager.on<DialDown>('${this._uuid}.${EventsReceived.dialDown}', callback);
  }

  void onDialUp(Function(DialUp event) callback) {
    EventManager.on<DialUp>('${this._uuid}.${EventsReceived.dialUp}', callback);
  }

  void onTouchTap(Function(TouchTap event) callback) {
    EventManager.on<TouchTap>('${this._uuid}.${EventsReceived.touchTap}', callback);
  }
}
