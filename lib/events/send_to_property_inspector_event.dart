class SendToPropertyInspectorEvent {
  String? action;
  String? context;
  String? event;
  dynamic payload;

  SendToPropertyInspectorEvent({this.action, this.context, this.event, this.payload});

  SendToPropertyInspectorEvent.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    context = json['context'];
    event = json['event'];
    payload = json['payload'];
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
