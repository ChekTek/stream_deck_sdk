import 'event.dart';

/// Fires when the `sendToPropertyInspector` API is called
class SendToPropertyInspector extends ContextEvent {
  dynamic payload;

  SendToPropertyInspector.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    context = json['context'];
    event = json['event'];
    payload = json['payload'];
  }
}
