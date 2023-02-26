import 'api.dart';
import 'events.dart';

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

  void onDeviceDidConnect(Function callback) {
    this.on(EventsReceived.deviceDidConnect, callback);
  }

  void onDeviceDidDisconnect(Function callback) {
    this.on(EventsReceived.deviceDidDisconnect, callback);
  }

  void onApplicationDidLaunch(Function callback) {
    this.on(EventsReceived.applicationDidLaunch, callback);
  }

  void onApplicationDidTerminate(Function callback) {
    this.on(EventsReceived.applicationDidTerminate, callback);
  }

  void onSystemDidWakeUp(Function callback) {
    this.on(EventsReceived.systemDidWakeUp, callback);
  }

  void switchToProfile(String context, String device, String profile) {
    this.send(context, EventsSent.switchToProfile, {
      'device': device,
      'profile': profile,
    });
  }
}
