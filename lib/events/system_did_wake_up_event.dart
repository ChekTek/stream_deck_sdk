class SystemDidWakeUpEvent {
  String? event;

  SystemDidWakeUpEvent({this.event});

  SystemDidWakeUpEvent.fromJson(Map<String, dynamic> json) {
    event = json['event'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event'] = this.event;
    return data;
  }
}
