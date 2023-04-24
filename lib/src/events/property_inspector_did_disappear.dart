import 'event.dart';

/// Fires when the Property Inspector is closed in the Stream Deck app
class PropertyInspectorDidDisappear extends DeviceEvent {
  PropertyInspectorDidDisappear.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    context = json['context'];
    device = json['device'];
    event = json['event'];
  }
}
