import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_native_view_method_channel.dart';

abstract class FlutterNativeViewPlatform extends PlatformInterface {
  /// Constructs a FlutterNativeViewPlatform.
  FlutterNativeViewPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterNativeViewPlatform _instance = MethodChannelFlutterNativeView();

  /// The default instance of [FlutterNativeViewPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterNativeView].
  static FlutterNativeViewPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterNativeViewPlatform] when
  /// they register themselves.
  static set instance(FlutterNativeViewPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
