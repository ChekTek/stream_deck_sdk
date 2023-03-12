import 'event_manager.dart';
import 'events.dart';

enum LogLevel { debug, log, warn, error }

abstract class Logger {
  static LogLevel logLevel = LogLevel.log;

  static _send(String message) {
    EventManager.emit(EventsSent.logMessage, message);
  }

  static debug(String message) {
    if (logLevel.index >= LogLevel.debug.index) {
      _send('DEBUG: ${message}');
      print('DEBUG: ${message}');
    }
  }

  static log(String message) {
    if (logLevel.index >= LogLevel.log.index) {
      _send(message);
    }
  }

  static warn(String message) {
    if (logLevel.index >= LogLevel.warn.index) {
      _send('WARN: ${message}');
    }
  }

  static error(String message) {
    if (logLevel.index >= LogLevel.error.index) {
      _send('ERROR: ${message}');
      print('ERROR: ${message}');
    }
  }
}
