class DidReceiveGlobalSettingsEvent {
  String? event;
  Payload? payload;

  DidReceiveGlobalSettingsEvent({this.event, this.payload});

  DidReceiveGlobalSettingsEvent.fromJson(Map<String, dynamic> json) {
    event = json['event'];
    payload = json['payload'] != null ? new Payload.fromJson(json['payload']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event'] = this.event;
    if (this.payload != null) {
      data['payload'] = this.payload!.toJson();
    }
    return data;
  }
}

class Payload {
  dynamic settings;

  Payload({this.settings});

  Payload.fromJson(Map<String, dynamic> json) {
    settings = json['settings'] != null ? new Settings.fromJson(json['settings']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.settings != null) {
      data['settings'] = this.settings!.toJson();
    }
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
