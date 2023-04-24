import 'event.dart';

/// Fires when the dial is released
class DialUp extends DeviceEvent {
  late _Payload payload;

  DialUp.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    context = json['context'];
    device = json['device'];
    event = json['event'];
    payload = _Payload.fromJson(json['payload']);
  }
}

class _Payload extends ContextPayload {
  _Payload.fromJson(Map<String, dynamic> json) {
    controller = json['controller'];
    coordinates = Coordinates.fromJson(json['coordinates']);
    settings = json['settings'];
  }
}
