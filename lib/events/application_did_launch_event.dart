import 'event.dart';

class ApplicationDidLaunch extends Event {
  late _Payload payload;

  ApplicationDidLaunch.fromJson(Map<String, dynamic> json) {
    event = json['event'];
    payload = _Payload.fromJson(json['payload']);
  }
}

class _Payload {
  late String application;

  _Payload.fromJson(Map<String, dynamic> json) {
    application = json['application'];
  }
}
