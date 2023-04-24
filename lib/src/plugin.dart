import 'api.dart';
import 'event_manager.dart';
import 'events.dart';
import 'events/application_did_launch.dart';
import 'events/application_did_terminate.dart';
import 'events/device_did_connect.dart';
import 'events/device_did_disconnect.dart';
import 'events/system_did_wake_up.dart';

/// @class StreamDeck
/// StreamDeck object containing all required code to establish
/// communication with SD-Software and the Property Inspector
class Plugin extends API {
  /// Display alert triangle on actions key
  void showAlert(String context) {
    this.send(context, EventsSent.showAlert);
  }

  /// Display ok check mark on actions key
  void showOk(String context) {
    this.send(context, EventsSent.showOk);
  }

  /// Save the actions's persistent data.
  void setSettings(String context, dynamic payload) {
    this.send(context, EventsSent.setSettings, payload);
  }

  /// Request the actions's persistent data. StreamDeck does not return the data, but trigger the actions's didReceiveSettings event
  void getSettings(String context) {
    this.send(context, EventsSent.getSettings);
  }

  /// Set the state of the actions
  void setState(String context, int state) {
    this.send(context, EventsSent.setState, {'state': state});
  }

  /// Set the title of the action's key
  void setTitle(String context, String title, {int target = 0}) {
    this.send(context, EventsSent.setTitle, {'title': title, 'target': target});
  }

  /// Clear the title of the action's key
  void clearTitle(String context) {
    this.send(context, EventsSent.setTitle, '');
  }

  /// Send payload to property inspector
  void sendToPropertyInspector(String context, dynamic payload) {
    this.send(context, EventsSent.sendToPropertyInspector, payload);
  }

  /// Set the actions key image
  void setImage(String context, String image, {int target = 0, int state = 0}) {
    this.send(context, EventsSent.setImage,
        {'image': image, 'target': target, 'state': state});
  }

  /// Set the properties of the layout on the Stream Deck + touch display
  void setFeedback(String context, dynamic feedback) {
    this.send(context, EventsSent.setFeedback, feedback);
  }

  /// Set the active layout by ID or path for the Stream Deck + touch display
  void setFeedbackLayout(String context, String layout) {
    this.send(context, EventsSent.setFeedbackLayout, {'layout': layout});
  }

  /// Registers a callback function for the deviceDidConnect event, which fires when a device is plugged in
  void onDeviceDidConnect(Function(DeviceDidConnect event) callback) {
    EventManager.on<DeviceDidConnect>(
        EventsReceived.deviceDidConnect, callback);
  }

  /// Registers a callback function for the deviceDidDisconnect event, which fires when a device is unplugged
  void onDeviceDidDisconnect(Function(DeviceDidDisconnect event) callback) {
    EventManager.on<DeviceDidDisconnect>(
        EventsReceived.deviceDidDisconnect, callback);
  }

  /// Registers a callback function for the applicationDidLaunch event, which fires when the application starts
  void onApplicationDidLaunch(Function(ApplicationDidLaunch event) callback) {
    EventManager.on<ApplicationDidLaunch>(
        EventsReceived.applicationDidLaunch, callback);
  }

  /// Registers a callback function for the applicationDidTerminate event, which fires when the application exits
  void onApplicationDidTerminate(
      Function(ApplicationDidTerminate event) callback) {
    EventManager.on<ApplicationDidTerminate>(
        EventsReceived.applicationDidTerminate, callback);
  }

  /// Registers a callback function for the systemDidWakeUp event, which fires when the computer wakes
  void onSystemDidWakeUp(Function(SystemDidWakeUp event) callback) {
    EventManager.on<SystemDidWakeUp>(EventsReceived.systemDidWakeUp, callback);
  }

  /// Switches to a readonly profile or returns to previous profile
  void switchToProfile(String context, String device, String profile) {
    this.send(context, EventsSent.switchToProfile, {
      'device': device,
      'profile': profile,
    });
  }
}
