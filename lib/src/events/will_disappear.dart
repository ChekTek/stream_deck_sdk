import 'event.dart';

class WillDisappear extends DeviceEvent {
  late _Payload payload;

  WillDisappear.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    context = json['context'];
    device = json['device'];
    event = json['event'];
    payload = _Payload.fromJson(json['payload']);
  }
}

class _Payload extends ContextPayload {
  late bool isInMultiAction;

  _Payload.fromJson(Map<String, dynamic> json) {
    controller = json['controller'];
    coordinates = Coordinates.fromJson(json['coordinates']);
    isInMultiAction = json['isInMultiAction'];
    settings = json['settings'];
  }
}
