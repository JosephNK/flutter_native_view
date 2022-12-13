import 'flutter_native_view_platform_interface.dart';

export 'flutter_native_web_view.dart';
export 'flutter_native_yellow_view.dart';

class FlutterNativeView {
  Future<String?> getPlatformVersion() {
    return FlutterNativeViewPlatform.instance.getPlatformVersion();
  }
}
