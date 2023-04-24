/// An event manager to register and call callback functions
abstract class EventManager {
  static final _listeners = Map<String, Function>();

  /// Register a callback function for an event
  static void on<T>(String event, Function(T event) callback) {
    _listeners.addAll({event: callback});
  }

  /// Emit an event
  static void emit<T>(String event, T data) {
    if (_listeners.containsKey(event)) {
      _listeners[event]!(data);
    }
  }

  /// Remove a callback function for an event
  static void remove(String event) {
    if (_listeners.containsKey(event)) {
      _listeners.remove(event);
    }
  }
}
