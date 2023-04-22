import 'event.dart';

class TouchTap extends DeviceEvent {
  late _Payload payload;

  TouchTap.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    context = json['context'];
    device = json['device'];
    event = json['event'];
    payload = _Payload.fromJson(json['payload']);
  }
}

class _Payload extends ContextPayload {
  late bool? hold;
  late List<int>? tapPos;

  _Payload.fromJson(Map<String, dynamic> json) {
    controller = json['controller'];
    coordinates = Coordinates.fromJson(json['coordinates']);
    hold = json['hold'];
    settings = json['settings'];
    tapPos = json['tapPos'].cast<int>();
  }
}
