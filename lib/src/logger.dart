import 'dart:convert';
import 'dart:io';

import 'event_manager.dart';
import 'events.dart';

/// The log levels
enum LogLevel { debug, log, warn, error }

/// A simple logger that writes to a file and a websocket if provided
abstract class Logger {
  static LogLevel logLevel = LogLevel.log;
  static WebSocket? websocket;

  static _send(String message) {
    EventManager.emit(EventsSent.logMessage, message);
    if (websocket != null) {
      websocket!.add(message);
    }
  }

  /// Write to a log file and websocket if provided
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

  /// Write to a log file and websocket if provided
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

  /// Write to a log file and websocket if provided
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

  /// Write to a log file and websocket if provided
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
