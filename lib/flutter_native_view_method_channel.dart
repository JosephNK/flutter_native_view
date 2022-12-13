import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_native_view_platform_interface.dart';

/// An implementation of [FlutterNativeViewPlatform] that uses method channels.
class MethodChannelFlutterNativeView extends FlutterNativeViewPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_native_view');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
