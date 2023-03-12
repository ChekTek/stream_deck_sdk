abstract class EventManager {
  static final _listeners = new Map<String, Function>();

  static void on(String event, Function(dynamic event) callback) {
    _listeners.addAll({event: callback});
  }

  static void emit(String event, dynamic data) {
    if (_listeners.containsKey(event)) {
      _listeners[event]!(data);
    }
  }

  static void remove(String event) {
    if (_listeners.containsKey(event)) {
      _listeners.remove(event);
    }
  }
}
