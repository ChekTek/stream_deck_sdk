/// An event
abstract class Event {
  late String event;
}

/// An event that includes a key context
abstract class ContextEvent extends Event {
  late String action;
  late String context;
}

/// An event that includes a device and key context
abstract class DeviceEvent extends ContextEvent {
  late String device;
}

/// They payload for a `ContextEvent`
abstract class ContextPayload {
  late String controller;
  late Coordinates coordinates;
  late dynamic settings;
}

/// The coordinates of a key or dial
class Coordinates {
  late int column;
  late int row;

  Coordinates.fromJson(Map<String, dynamic> json) {
    column = json['column'];
    row = json['row'];
  }
}
