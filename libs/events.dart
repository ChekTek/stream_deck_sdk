abstract class EventsReceived {
  static final String connected = 'connected';
  static final String didReceiveGlobalSettings = 'didReceiveGlobalSettings';
  static final String didReceiveSettings = 'didReceiveSettings';
  static final String deviceDidConnect = 'deviceDidConnect';
  static final String deviceDidDisconnect = 'deviceDidDisconnect';
  static final String applicationDidLaunch = 'applicationDidLaunch';
  static final String applicationDidTerminate = 'applicationDidTerminate';
  static final String systemDidWakeUp = 'systemDidWakeUp';
  static final String sendToPropertyInspector = 'sendToPropertyInspector';
  static final String keyDown = 'keyDown';
  static final String keyUp = 'keyUp';
  static final String willAppear = 'willAppear';
  static final String willDisappear = 'willDisappear';
  static final String titleParametersDidChange = 'titleParametersDidChange';
  static final String propertyInspectorDidAppear = 'propertyInspectorDidAppear';
  static final String propertyInspectorDidDisappear = 'propertyInspectorDidDisappear';
  static final String sendToPlugin = 'sendToPlugin';
  static final String dialRotate = 'dialRotate';
  static final String dialPress = 'dialPress';
  static final String touchTap = 'touchTap';
}

abstract class EventsSent {
  static final String getGlobalSettings = 'getGlobalSettings';
  static final String getSettings = 'getSettings';
  static final String setGlobalSettings = 'setGlobalSettings';
  static final String setSettings = 'setSettings';
  static final String setTitle = 'setTitle';
  static final String showOk = 'showOk';
  static final String showAlert = 'showAlert';
  static final String switchToProfile = 'switchToProfile';
  static final String openUrl = 'openUrl';
  static final String logMessage = 'logMessage';
  static final String sendToPropertyInspector = 'sendToPropertyInspector';
  static final String setState = 'setState';
  static final String setImage = 'setImage';
  static final String setFeedback = 'setFeedback';
  static final String setFeedbackLayout = 'setFeedbackLayout';
  static final String sendToPlugin = 'sendToPlugin';
}
