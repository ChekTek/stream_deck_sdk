import 'package:stream_deck_sdk/events/event.dart';

class DeviceDidDisconnect extends Event {
  late String device;

  DeviceDidDisconnect.fromJson(Map<String, dynamic> json) {
    device = json['device'];
    event = json['event'];
  }
}
