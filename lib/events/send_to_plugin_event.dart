class SendToPluginEvent {
  String? action;
  String? context;
  String? event;
  Payload? payload;

  SendToPluginEvent({this.action, this.context, this.event, this.payload});

  SendToPluginEvent.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    context = json['context'];
    event = json['event'];
    payload = json['payload'] != null ? new Payload.fromJson(json['payload']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action;
    data['context'] = this.context;
    data['event'] = this.event;
    if (this.payload != null) {
      data['payload'] = this.payload!.toJson();
    }
    return data;
  }
}

class Payload {
  String? skill;

  Payload({this.skill});

  Payload.fromJson(Map<String, dynamic> json) {
    skill = json['skill'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['skill'] = this.skill;
    return data;
  }
}
