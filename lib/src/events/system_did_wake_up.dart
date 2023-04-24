import 'event.dart';

/// Fires when the computer wakes up from sleep mode
class SystemDidWakeUp extends Event {
  SystemDidWakeUp.fromJson(Map<String, dynamic> json) {
    event = json['event'];
  }
}
