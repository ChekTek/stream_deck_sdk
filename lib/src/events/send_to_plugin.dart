import 'event.dart';

/// Fires when the `sendToPlugin` API is called
class SendToPlugin extends ContextEvent {
  dynamic payload;

  SendToPlugin.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    context = json['context'];
    event = json['event'];
    payload = json['payload'];
  }
}
