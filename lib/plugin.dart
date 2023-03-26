import 'package:stream_deck_sdk/events/application_did_launch_event.dart';
import 'package:stream_deck_sdk/events/application_did_terminate_event.dart';
import 'package:stream_deck_sdk/events/device_did_connect_event.dart';
import 'package:stream_deck_sdk/events/device_did_disconnect_event.dart';
import 'package:stream_deck_sdk/events/system_did_wake_up_event.dart';

import 'api.dart';
import 'events.dart';
import 'event_manager.dart';

class Plugin extends API {
  void showAlert(String context) {
    this.send(context, EventsSent.showAlert);
  }

  void showOk(String context) {
    this.send(context, EventsSent.showOk);
  }

  void setSettings(String context, dynamic payload) {
    this.send(context, EventsSent.setSettings, payload);
  }

  void getSettings(String context) {
    this.send(context, EventsSent.getSettings);
  }

  void setState(String context, int state) {
    this.send(context, EventsSent.setState, state);
  }

  void setTitle(String context, String title) {
    this.send(context, EventsSent.setTitle, title);
  }

  void clearTitle(String context) {
    this.send(context, EventsSent.setTitle, '');
  }

  void sendToPropertyInspector(String context, dynamic payload) {
    this.send(context, EventsSent.sendToPropertyInspector, payload);
  }

  void setImage(String context, String image) {
    this.send(context, EventsSent.setImage, image);
  }

  void setFeedback(String context, String feedback) {
    this.send(context, EventsSent.setFeedback, feedback);
  }

  void setFeedbackLayout(String context, String layout) {
    this.send(context, EventsSent.setFeedbackLayout, layout);
  }

  void onDeviceDidConnect(Function(DeviceDidConnect event) callback) {
    EventManager.on<DeviceDidConnect>(EventsReceived.deviceDidConnect, callback);
  }

  void onDeviceDidDisconnect(Function(DeviceDidDisconnect event) callback) {
    EventManager.on<DeviceDidDisconnect>(EventsReceived.deviceDidDisconnect, callback);
  }

  void onApplicationDidLaunch(Function(ApplicationDidLaunch event) callback) {
    EventManager.on<ApplicationDidLaunch>(EventsReceived.applicationDidLaunch, callback);
  }

  void onApplicationDidTerminate(Function(ApplicationDidTerminate event) callback) {
    EventManager.on<ApplicationDidTerminate>(EventsReceived.applicationDidTerminate, callback);
  }

  void onSystemDidWakeUp(Function(SystemDidWakeUpEvent event) callback) {
    EventManager.on<SystemDidWakeUpEvent>(EventsReceived.systemDidWakeUp, callback);
  }

  void switchToProfile(String context, String device, String profile) {
    this.send(context, EventsSent.switchToProfile, {
      'device': device,
      'profile': profile,
    });
  }
}
