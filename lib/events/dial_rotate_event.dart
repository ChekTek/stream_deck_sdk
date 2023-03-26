import 'package:stream_deck_sdk/events/event.dart';

class DialRotate extends DeviceEvent {
  late _Payload payload;

  DialRotate.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    context = json['context'];
    device = json['device'];
    event = json['event'];
    payload = _Payload.fromJson(json['payload']);
  }
}

class _Payload extends ContextPayload {
  late bool pressed;
  late int ticks;

  _Payload.fromJson(Map<String, dynamic> json) {
    controller = json['controller'];
    coordinates = Coordinates.fromJson(json['coordinates']);
    pressed = json['pressed'];
    settings = json['settings'];
    ticks = json['ticks'];
  }
}
