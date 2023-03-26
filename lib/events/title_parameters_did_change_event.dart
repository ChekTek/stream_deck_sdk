import 'package:stream_deck_sdk/events/event.dart';

class TitleParametersDidChangeEvent extends DeviceEvent {
  late _Payload payload;

  TitleParametersDidChangeEvent.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    context = json['context'];
    device = json['device'];
    event = json['event'];
    payload = _Payload.fromJson(json['payload']);
  }
}

class _Payload extends ContextPayload {
  late int state;
  late String title;
  late TitleParameters titleParameters;

  _Payload.fromJson(Map<String, dynamic> json) {
    coordinates = Coordinates.fromJson(json['coordinates']);
    settings = json['settings'];
    state = json['state'];
    title = json['title'];
    titleParameters = TitleParameters.fromJson(json['titleParameters']);
  }
}

class TitleParameters {
  late String fontFamily;
  late int fontSize;
  late String fontStyle;
  late bool fontUnderline;
  late bool showTitle;
  late String titleAlignment;
  late String titleColor;

  TitleParameters.fromJson(Map<String, dynamic> json) {
    fontFamily = json['fontFamily'];
    fontSize = json['fontSize'];
    fontStyle = json['fontStyle'];
    fontUnderline = json['fontUnderline'];
    showTitle = json['showTitle'];
    titleAlignment = json['titleAlignment'];
    titleColor = json['titleColor'];
  }
}
