import 'api.dart';
import 'event_manager.dart';
import 'events.dart';
import 'events/application_did_launch.dart';
import 'events/application_did_terminate.dart';
import 'events/device_did_connect.dart';
import 'events/device_did_disconnect.dart';
import 'events/system_did_wake_up.dart';

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
    this.send(context, EventsSent.setState, {'state': state});
  }

  void setTitle(String context, String title, {int target = 0}) {
    this.send(context, EventsSent.setTitle, {'title': title, 'target': target});
  }

  void clearTitle(String context) {
    this.send(context, EventsSent.setTitle, '');
  }

  void sendToPropertyInspector(String context, dynamic payload) {
    this.send(context, EventsSent.sendToPropertyInspector, payload);
  }

  void setImage(String context, String image, {int target = 0, int state = 0}) {
    this.send(context, EventsSent.setImage,
        {'image': image, 'target': target, 'state': state});
  }

  void setFeedback(String context, String feedback) {
    this.send(context, EventsSent.setFeedback, feedback);
  }

  void setFeedbackLayout(String context, String layout) {
    this.send(context, EventsSent.setFeedbackLayout, layout);
  }

  void onDeviceDidConnect(Function(DeviceDidConnect event) callback) {
    EventManager.on<DeviceDidConnect>(
        EventsReceived.deviceDidConnect, callback);
  }

  void onDeviceDidDisconnect(Function(DeviceDidDisconnect event) callback) {
    EventManager.on<DeviceDidDisconnect>(
        EventsReceived.deviceDidDisconnect, callback);
  }

  void onApplicationDidLaunch(Function(ApplicationDidLaunch event) callback) {
    EventManager.on<ApplicationDidLaunch>(
        EventsReceived.applicationDidLaunch, callback);
  }

  void onApplicationDidTerminate(
      Function(ApplicationDidTerminate event) callback) {
    EventManager.on<ApplicationDidTerminate>(
        EventsReceived.applicationDidTerminate, callback);
  }

  void onSystemDidWakeUp(Function(SystemDidWakeUp event) callback) {
    EventManager.on<SystemDidWakeUp>(EventsReceived.systemDidWakeUp, callback);
  }

  void switchToProfile(String context, String device, String profile) {
    this.send(context, EventsSent.switchToProfile, {
      'device': device,
      'profile': profile,
    });
  }
}
