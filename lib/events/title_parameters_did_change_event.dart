class TitleParametersDidChangeEvent {
  String? action;
  String? context;
  String? device;
  String? event;
  Payload? payload;

  TitleParametersDidChangeEvent({this.action, this.context, this.device, this.event, this.payload});

  TitleParametersDidChangeEvent.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    context = json['context'];
    device = json['device'];
    event = json['event'];
    payload = json['payload'] != null ? new Payload.fromJson(json['payload']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action;
    data['context'] = this.context;
    data['device'] = this.device;
    data['event'] = this.event;
    if (this.payload != null) {
      data['payload'] = this.payload!.toJson();
    }
    return data;
  }
}

class Payload {
  Coordinates? coordinates;
  dynamic settings;
  int? state;
  String? title;
  TitleParameters? titleParameters;

  Payload({this.coordinates, this.settings, this.state, this.title, this.titleParameters});

  Payload.fromJson(Map<String, dynamic> json) {
    coordinates = json['coordinates'] != null ? new Coordinates.fromJson(json['coordinates']) : null;
    settings = json['settings'] != null ? new Settings.fromJson(json['settings']) : null;
    state = json['state'];
    title = json['title'];
    titleParameters = json['titleParameters'] != null ? new TitleParameters.fromJson(json['titleParameters']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.coordinates != null) {
      data['coordinates'] = this.coordinates!.toJson();
    }
    if (this.settings != null) {
      data['settings'] = this.settings!.toJson();
    }
    data['state'] = this.state;
    data['title'] = this.title;
    if (this.titleParameters != null) {
      data['titleParameters'] = this.titleParameters!.toJson();
    }
    return data;
  }
}

class Coordinates {
  int? column;
  int? row;

  Coordinates({this.column, this.row});

  Coordinates.fromJson(Map<String, dynamic> json) {
    column = json['column'];
    row = json['row'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['column'] = this.column;
    data['row'] = this.row;
    return data;
  }
}

class Settings {
  String? skill;

  Settings({this.skill});

  Settings.fromJson(Map<String, dynamic> json) {
    skill = json['skill'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['skill'] = this.skill;
    return data;
  }
}

class TitleParameters {
  String? fontFamily;
  int? fontSize;
  String? fontStyle;
  bool? fontUnderline;
  bool? showTitle;
  String? titleAlignment;
  String? titleColor;

  TitleParameters(
      {this.fontFamily,
      this.fontSize,
      this.fontStyle,
      this.fontUnderline,
      this.showTitle,
      this.titleAlignment,
      this.titleColor});

  TitleParameters.fromJson(Map<String, dynamic> json) {
    fontFamily = json['fontFamily'];
    fontSize = json['fontSize'];
    fontStyle = json['fontStyle'];
    fontUnderline = json['fontUnderline'];
    showTitle = json['showTitle'];
    titleAlignment = json['titleAlignment'];
    titleColor = json['titleColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fontFamily'] = this.fontFamily;
    data['fontSize'] = this.fontSize;
    data['fontStyle'] = this.fontStyle;
    data['fontUnderline'] = this.fontUnderline;
    data['showTitle'] = this.showTitle;
    data['titleAlignment'] = this.titleAlignment;
    data['titleColor'] = this.titleColor;
    return data;
  }
}
