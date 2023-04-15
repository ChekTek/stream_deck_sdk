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
      String debugMessage;
      try {
        debugMessage = 'DEBUG: ${jsonEncode(message)}';
      } catch (e) {
        debugMessage = 'DEBUG: ${message.toString()}';
      }
      _send(debugMessage);
    }
  }

  static info(dynamic message) {
    if (logLevel.index <= LogLevel.log.index) {
      String infoMessage;
      try {
        infoMessage = 'INFO: ${jsonEncode(message)}';
      } catch (e) {
        infoMessage = 'INFO: ${message.toString()}';
      }
      _send(infoMessage);
    }
  }

  static warn(dynamic message) {
    if (logLevel.index <= LogLevel.warn.index) {
      String warnMessage;
      try {
        warnMessage = 'WARN: ${jsonEncode(message)}';
      } catch (e) {
        warnMessage = 'WARN: ${message.toString()}';
      }
      _send(warnMessage);
    }
  }

  static error(dynamic message) {
    if (logLevel.index <= LogLevel.error.index) {
      String errorMessage;
      try {
        errorMessage = 'ERROR: ${jsonEncode(message)}';
      } catch (e) {
        errorMessage = 'ERROR: ${message.toString()}';
      }
      _send(errorMessage);
      print(errorMessage);
    }
  }
}
