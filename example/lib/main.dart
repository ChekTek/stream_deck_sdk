import 'dart:async';

import 'package:stream_deck_sdk/stream_deck_sdk.dart';

Future<void> main(List<String> arguments) async {
  await runZonedGuarded(
    () {
      final Plugin plugin = Plugin();
      final Action myAction = Action('com.chektek.example_plugin.my_action');

      plugin.onConnected((event) {
        Logger.info('Connected');
      });

      myAction.onKeyUp((event) {
        Logger.info('Key up!');
      });

      plugin.connect(PluginArguments.fromExecutableArgumentsList(arguments));
    },
    (error, stack) => Logger.error('ERROR: $error $stack'),
  );
}
