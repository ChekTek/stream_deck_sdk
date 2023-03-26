import 'package:stream_deck_sdk/events/event.dart';

class SendToPluginEvent extends ContextEvent {
  dynamic payload;

  SendToPluginEvent.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    context = json['context'];
    event = json['event'];
    payload = json['payload'];
  }
}
