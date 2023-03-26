import 'package:stream_deck_sdk/events/event.dart';

class DeviceDidConnect extends Event {
  late String device;
  late _DeviceInfo deviceInfo;
  DeviceDidConnect.fromJson(Map<String, dynamic> json) {
    device = json['device'];
    deviceInfo = _DeviceInfo.fromJson(json['deviceInfo']);
    event = json['event'];
  }
}

class _DeviceInfo {
  late String name;
  late _Size size;
  late int type;

  _DeviceInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    size = _Size.fromJson(json['size']);
    type = json['type'];
  }
}

class _Size {
  late int columns;
  late int rows;

  _Size.fromJson(Map<String, dynamic> json) {
    columns = json['columns'];
    rows = json['rows'];
  }
}
