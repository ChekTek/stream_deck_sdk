import 'event.dart';

class PropertyInspectorDidDisappear extends DeviceEvent {
  PropertyInspectorDidDisappear.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    context = json['context'];
    device = json['device'];
    event = json['event'];
  }
}
