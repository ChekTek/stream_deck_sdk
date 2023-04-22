import 'event.dart';

class SystemDidWakeUp extends Event {
  SystemDidWakeUp.fromJson(Map<String, dynamic> json) {
    event = json['event'];
  }
}
