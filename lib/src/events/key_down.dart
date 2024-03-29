import 'event.dart';

/// Fires when a key is pressed down
class KeyDown extends DeviceEvent {
  late _Payload payload;

  KeyDown.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    context = json['context'];
    device = json['device'];
    event = json['event'];
    payload = _Payload.fromJson(json['payload']);
  }
}

class _Payload extends ContextPayload {
  int? state;
  late bool isInMultiAction;

  _Payload.fromJson(Map<String, dynamic> json) {
    coordinates = Coordinates.fromJson(json['coordinates']);
    isInMultiAction = json['isInMultiAction'];
    state = json['state'];
    settings = json['settings'];
  }
}
