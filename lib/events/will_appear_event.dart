class WillAppearEvent {
  String? action;
  String? context;
  String? device;
  String? event;
  Payload? payload;

  WillAppearEvent({this.action, this.context, this.device, this.event, this.payload});

  WillAppearEvent.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    context = json['context'];
    device = json['device'];
    event = json['event'];
    payload = json['payload'] != null ? Payload.fromJson(json['payload']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
  bool? isInMultiAction;
  dynamic settings;

  Payload({this.controller, this.coordinates, this.isInMultiAction, this.settings});

  Payload.fromJson(Map<String, dynamic> json) {
    controller = json['controller'];
    coordinates = json['coordinates'] != null ? Coordinates.fromJson(json['coordinates']) : null;
    isInMultiAction = json['isInMultiAction'];
    settings = json['settings'] != null ? Settings.fromJson(json['settings']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['controller'] = this.controller;
    if (this.coordinates != null) {
      data['coordinates'] = this.coordinates!.toJson();
    }
    data['isInMultiAction'] = this.isInMultiAction;
    if (this.settings != null) {
      data['settings'] = this.settings!.toJson();
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
    final Map<String, dynamic> data = Map<String, dynamic>();
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['skill'] = this.skill;
    return data;
  }
}