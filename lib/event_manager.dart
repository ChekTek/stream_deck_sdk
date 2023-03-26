abstract class EventManager {
  static final _listeners = Map<String, Function>();

  static void on<T>(String event, Function(T event) callback) {
    _listeners.addAll({event: callback});
  }

  static void emit<T>(String event, T data) {
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
