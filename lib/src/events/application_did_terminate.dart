import 'event.dart';

/// Fires when an application registed in the plugin's manifest is closed
class ApplicationDidTerminate extends Event {
  late _Payload payload;

  ApplicationDidTerminate.fromJson(Map<String, dynamic> json) {
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
