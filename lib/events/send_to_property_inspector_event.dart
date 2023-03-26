import 'package:stream_deck_sdk/events/event.dart';

class SendToPropertyInspectorEvent extends ContextEvent {
  dynamic payload;

  SendToPropertyInspectorEvent.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    context = json['context'];
    event = json['event'];
    payload = json['payload'];
  }
}
