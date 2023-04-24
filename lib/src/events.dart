/// Events that can be recieved from Stream Deck
abstract class EventsReceived {
  static const String connected = 'connected';
  static const String didReceiveGlobalSettings = 'didReceiveGlobalSettings';
  static const String didReceiveSettings = 'didReceiveSettings';
  static const String deviceDidConnect = 'deviceDidConnect';
  static const String deviceDidDisconnect = 'deviceDidDisconnect';
  static const String applicationDidLaunch = 'applicationDidLaunch';
  static const String applicationDidTerminate = 'applicationDidTerminate';
  static const String systemDidWakeUp = 'systemDidWakeUp';
  static const String sendToPropertyInspector = 'sendToPropertyInspector';
  static const String keyDown = 'keyDown';
  static const String keyUp = 'keyUp';
  static const String willAppear = 'willAppear';
  static const String willDisappear = 'willDisappear';
  static const String titleParametersDidChange = 'titleParametersDidChange';
  static const String propertyInspectorDidAppear = 'propertyInspectorDidAppear';
  static const String propertyInspectorDidDisappear =
      'propertyInspectorDidDisappear';
  static const String sendToPlugin = 'sendToPlugin';
  static const String dialRotate = 'dialRotate';
  static const String dialDown = 'dialDown';
  static const String dialUp = 'dialUp';
  static const String touchTap = 'touchTap';
}

/// Events that can be sent to Stream Deck
abstract class EventsSent {
  static const String getGlobalSettings = 'getGlobalSettings';
  static const String getSettings = 'getSettings';
  static const String setGlobalSettings = 'setGlobalSettings';
  static const String setSettings = 'setSettings';
  static const String setTitle = 'setTitle';
  static const String showOk = 'showOk';
  static const String showAlert = 'showAlert';
  static const String switchToProfile = 'switchToProfile';
  static const String openUrl = 'openUrl';
  static const String logMessage = 'logMessage';
  static const String sendToPropertyInspector = 'sendToPropertyInspector';
  static const String setState = 'setState';
  static const String setImage = 'setImage';
  static const String setFeedback = 'setFeedback';
  static const String setFeedbackLayout = 'setFeedbackLayout';
  static const String sendToPlugin = 'sendToPlugin';
}
