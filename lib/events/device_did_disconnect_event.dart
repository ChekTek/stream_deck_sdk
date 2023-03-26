class DeviceDidDisconnectEvent {
  String? device;
  String? event;

  DeviceDidDisconnectEvent({this.device, this.event});

  DeviceDidDisconnectEvent.fromJson(Map<String, dynamic> json) {
    device = json['device'];
    event = json['event'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['device'] = this.device;
    data['event'] = this.event;
    return data;
  }
}
