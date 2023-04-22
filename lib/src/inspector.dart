import 'api.dart';
import 'events.dart';
import 'event_manager.dart';

/// The Inspector class is used to communicate with the Stream Deck software.
class Inspector extends API {
  ///Registers a callback function for when Stream Deck sends data to the property inspector
  void onSendToPropertyInspector(Function(dynamic event) callback) {
    EventManager.on(EventsReceived.sendToPropertyInspector, callback);
  }

  /// Send payload from the property inspector to the plugin
  void sendToPlugin(String context, dynamic payload) {
    this.send(context, EventsSent.sendToPlugin, payload);
  }

  /// Save the actions's persistent data.
  void setSettings(dynamic payload) {
    this.send(this.uuid as String, EventsSent.setSettings, payload);
  }

  /// Request the actions's persistent data. StreamDeck does not return the data, but trigger the actions's didReceiveSettings event
  void getSettings() {
    this.send(this.uuid as String, EventsSent.getSettings);
  }
}
