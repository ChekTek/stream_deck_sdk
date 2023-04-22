abstract class Event {
  late String event;
}

abstract class ContextEvent extends Event {
  late String action;
  late String context;
}

abstract class DeviceEvent extends ContextEvent {
  late String device;
}

abstract class ContextPayload {
  late String controller;
  late Coordinates coordinates;
  late dynamic settings;
}

class Coordinates {
  late int column;
  late int row;

  Coordinates.fromJson(Map<String, dynamic> json) {
    column = json['column'];
    row = json['row'];
  }
}
