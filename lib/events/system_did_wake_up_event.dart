import 'package:stream_deck_sdk/events/event.dart';

class SystemDidWakeUpEvent extends Event {
  SystemDidWakeUpEvent.fromJson(Map<String, dynamic> json) {
    event = json['event'];
  }
}
