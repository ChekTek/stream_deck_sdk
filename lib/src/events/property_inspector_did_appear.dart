import 'event.dart';

class PropertyInspectorDidAppear extends DeviceEvent {
  PropertyInspectorDidAppear.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    context = json['context'];
    device = json['device'];
    event = json['event'];
  }
}
