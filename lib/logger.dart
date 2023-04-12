import 'dart:convert';
import 'dart:io';

import 'event_manager.dart';
import 'events.dart';

enum LogLevel { debug, log, warn, error }

abstract class Logger {
  static LogLevel logLevel = LogLevel.log;
  static WebSocket? websocket;

  static _send(String message) {
    EventManager.emit(EventsSent.logMessage, message);
    if (websocket != null) {
      websocket!.add(message);
    }
  }

  static debug(dynamic message) {
    if (logLevel.index <= LogLevel.debug.index) {
      final String debugMessage = 'DEBUG: ${jsonEncode(message)}';
      _send(debugMessage);
      print(debugMessage);
    }
  }

  static info(dynamic message) {
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
