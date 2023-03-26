import 'package:stream_deck_sdk/events/event.dart';

class SystemDidWakeUp extends Event {
  SystemDidWakeUp.fromJson(Map<String, dynamic> json) {
    event = json['event'];
  }
}
