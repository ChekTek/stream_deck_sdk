import 'event.dart';

/// Fires when a Stream Deck device is disconnected from the computer
class DeviceDidDisconnect extends Event {
  late String device;

  DeviceDidDisconnect.fromJson(Map<String, dynamic> json) {
    device = json['device'];
    event = json['event'];
  }
}
