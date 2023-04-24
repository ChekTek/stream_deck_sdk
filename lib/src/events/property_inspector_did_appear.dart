import 'event.dart';

/// Fires when the Property Inspector is opened in the Stream Deck app
class PropertyInspectorDidAppear extends DeviceEvent {
  PropertyInspectorDidAppear.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    context = json['context'];
    device = json['device'];
    event = json['event'];
  }
}
