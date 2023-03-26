class TouchTapEvent {
  String? action;
  String? context;
  String? device;
  String? event;
  Payload? payload;

  TouchTapEvent({this.action, this.context, this.device, this.event, this.payload});

  TouchTapEvent.fromJson(Map<String, dynamic> json) {
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
  String? controller;
  Coordinates? coordinates;
  bool? hold;
  dynamic settings;
  List<int>? tapPos;

  Payload({this.controller, this.coordinates, this.hold, this.settings, this.tapPos});

  Payload.fromJson(Map<String, dynamic> json) {
    controller = json['controller'];
    coordinates = json['coordinates'] != null ? new Coordinates.fromJson(json['coordinates']) : null;
    hold = json['hold'];
    settings = json['settings'] != null ? new Settings.fromJson(json['settings']) : null;
    tapPos = json['tapPos'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['controller'] = this.controller;
    if (this.coordinates != null) {
      data['coordinates'] = this.coordinates!.toJson();
    }
    data['hold'] = this.hold;
    if (this.settings != null) {
      data['settings'] = this.settings!.toJson();
    }
    data['tapPos'] = this.tapPos;
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
