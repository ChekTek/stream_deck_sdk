class ApplicationDidTerminateEvent {
  String? event;
  Payload? payload;

  ApplicationDidTerminateEvent({this.event, this.payload});

  ApplicationDidTerminateEvent.fromJson(Map<String, dynamic> json) {
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
  String? application;

  Payload({this.application});

  Payload.fromJson(Map<String, dynamic> json) {
    application = json['application'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['application'] = this.application;
    return data;
  }
}
