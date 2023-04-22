import 'event.dart';

class DidReceiveSettings extends DeviceEvent {
  late _Payload payload;

  DidReceiveSettings.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    context = json['context'];
    device = json['device'];
    event = json['event'];
    payload = _Payload.fromJson(json['payload']);
  }
}

class _Payload extends ContextPayload {
  int? state;
  bool? isInMultiAction;

  _Payload.fromJson(Map<String, dynamic> json) {
    coordinates = Coordinates.fromJson(json['coordinates']);
    isInMultiAction = json['isInMultiAction'];
    state = json['state'];
    settings = json['settings'];
  }
}
