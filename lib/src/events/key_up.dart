import 'event.dart';

class KeyUp extends DeviceEvent {
  _Payload? payload;

  KeyUp.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    context = json['context'];
    device = json['device'];
    event = json['event'];
    payload =
        json['payload'] != null ? _Payload.fromJson(json['payload']) : null;
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
