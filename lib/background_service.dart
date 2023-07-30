import 'dart:ui';

import 'package:flutter_isolate/flutter_isolate.dart';
import 'package:flutter_sound/flutter_sound.dart';

initService() {
  FlutterIsolate.spawn(someFunction, "hello world");
}

@pragma('vm:entry-point')
void someFunction(String arg) {
  try {
    // Ensure that the plugin is initialized
    print("Starting background function");
    FlutterSoundPlayer player = FlutterSoundPlayer();
    player.openPlayer();
    player.startPlayer(fromURI: 'https://file-examples.com/wp-content/storage/2017/11/file_example_MP3_1MG.mp3');
  } catch (e) {}
}

initNormalFunction() async {
  try {
    // Ensure that the plugin is initialized

    FlutterSoundPlayer player = FlutterSoundPlayer();
    await player.openPlayer();
    player.startPlayer(fromURI: 'https://github.com/prof3ssorSt3v3/media-sample-files/blob/master/clear-throat.mp3');
  } catch (e) {}
}
