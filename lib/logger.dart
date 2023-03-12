import 'dart:convert';

import 'event_manager.dart';
import 'events.dart';

enum LogLevel { debug, log, warn, error }

abstract class Logger {
  static LogLevel logLevel = LogLevel.log;

  static _send(String message) {
    EventManager.emit(EventsSent.logMessage, message);
  }

  static debug(dynamic message) {
    if (logLevel.index <= LogLevel.debug.index) {
      final String debugMessage = 'DEBUG: ${jsonEncode(message)}';
      _send(debugMessage);
      print(debugMessage);
    }
  }

  static log(dynamic message) {
    if (logLevel.index <= LogLevel.log.index) {
      _send(jsonEncode(message));
    }
  }

  static warn(dynamic message) {
    if (logLevel.index <= LogLevel.warn.index) {
      _send('WARN: ${jsonEncode(message)}');
    }
  }

  static error(dynamic message) {
    if (logLevel.index <= LogLevel.error.index) {
      final String errorMessage = 'ERROR: ${jsonEncode(message)}';
      _send(errorMessage);
      print(errorMessage);
    }
  }
}
