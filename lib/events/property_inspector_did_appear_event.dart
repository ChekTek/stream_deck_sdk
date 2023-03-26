import 'event.dart';

class PropertyInspectorDidAppearEvent extends DeviceEvent {
  PropertyInspectorDidAppearEvent.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    context = json['context'];
    device = json['device'];
    event = json['event'];
  }
}
