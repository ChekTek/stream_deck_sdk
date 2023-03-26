class PropertyInspectorDidAppearEvent {
  String? action;
  String? context;
  String? device;
  String? event;

  PropertyInspectorDidAppearEvent({this.action, this.context, this.device, this.event});

  PropertyInspectorDidAppearEvent.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    context = json['context'];
    device = json['device'];
    event = json['event'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action;
    data['context'] = this.context;
    data['device'] = this.device;
    data['event'] = this.event;
    return data;
  }
}
