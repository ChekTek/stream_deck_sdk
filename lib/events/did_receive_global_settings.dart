import 'package:stream_deck_sdk/events/event.dart';

class DidReceiveGlobalSettings extends Event {
  late _Payload payload;

  DidReceiveGlobalSettings.fromJson(Map<String, dynamic> json) {
    event = json['event'];
    payload = _Payload.fromJson(json['payload']);
  }
}

class _Payload {
  dynamic settings;

  _Payload.fromJson(Map<String, dynamic> json) {
    settings = json['settings'];
  }
}
