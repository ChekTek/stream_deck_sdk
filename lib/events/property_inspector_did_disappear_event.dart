import 'event.dart';

class PropertyInspectorDidDisappearEvent extends DeviceEvent {
  PropertyInspectorDidDisappearEvent.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    context = json['context'];
    device = json['device'];
    event = json['event'];
  }
}
