import 'package:stream_deck_sdk/events/event.dart';

class SendToPropertyInspector extends ContextEvent {
  dynamic payload;

  SendToPropertyInspector.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    context = json['context'];
    event = json['event'];
    payload = json['payload'];
  }
}
