class Event {
  String? action;
  String? context;
  String? device;
  String? event;
  Payload? payload;
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

class Payload {
  Coordinates? coordinates;
  bool? isInMultiAction;
  Map? settings;

  Payload({this.coordinates, this.isInMultiAction, this.settings});

  Payload.fromJson(Map<String, dynamic> json) {
    coordinates = json['coordinates'] != null ? new Coordinates.fromJson(json['coordinates']) : null;
    isInMultiAction = json['isInMultiAction'];
    settings = json['settings'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.coordinates != null) {
      data['coordinates'] = this.coordinates!.toJson();
    }

    data['isInMultiAction'] = this.isInMultiAction;
    data['settings'] = this.settings;

    return data;
  }
}
