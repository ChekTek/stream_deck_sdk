class DeviceDidConnectEvent {
  String? device;
  DeviceInfo? deviceInfo;
  String? event;

  DeviceDidConnectEvent({this.device, this.deviceInfo, this.event});

  DeviceDidConnectEvent.fromJson(Map<String, dynamic> json) {
    device = json['device'];
    deviceInfo = json['deviceInfo'] != null ? new DeviceInfo.fromJson(json['deviceInfo']) : null;
    event = json['event'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['device'] = this.device;
    if (this.deviceInfo != null) {
      data['deviceInfo'] = this.deviceInfo!.toJson();
    }
    data['event'] = this.event;
    return data;
  }
}

class DeviceInfo {
  String? name;
  Size? size;
  int? type;

  DeviceInfo({this.name, this.size, this.type});

  DeviceInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    size = json['size'] != null ? new Size.fromJson(json['size']) : null;
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.size != null) {
      data['size'] = this.size!.toJson();
    }
    data['type'] = this.type;
    return data;
  }
}

class Size {
  int? columns;
  int? rows;

  Size({this.columns, this.rows});

  Size.fromJson(Map<String, dynamic> json) {
    columns = json['columns'];
    rows = json['rows'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['columns'] = this.columns;
    data['rows'] = this.rows;
    return data;
  }
}
