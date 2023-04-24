import 'event.dart';

/// Fires when the key or dial action appears
class WillAppear extends DeviceEvent {
  late _Payload payload;

  WillAppear.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    context = json['context'];
    device = json['device'];
    event = json['event'];
    payload = _Payload.fromJson(json['payload']);
  }
}

class _Payload extends ContextPayload {
  late bool? isInMultiAction;

  _Payload.fromJson(Map<String, dynamic> json) {
    controller = json['controller'];
    coordinates = Coordinates.fromJson(json['coordinates']);
    isInMultiAction = json['isInMultiAction'];
    settings = json['settings'];
  }
}
