import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_native_view/flutter_native_view.dart';
import 'package:flutter_native_view/flutter_native_view_platform_interface.dart';
import 'package:flutter_native_view/flutter_native_view_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterNativeViewPlatform
    with MockPlatformInterfaceMixin
    implements FlutterNativeViewPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterNativeViewPlatform initialPlatform = FlutterNativeViewPlatform.instance;

  test('$MethodChannelFlutterNativeView is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterNativeView>());
  });

  test('getPlatformVersion', () async {
    FlutterNativeView flutterNativeViewPlugin = FlutterNativeView();
    MockFlutterNativeViewPlatform fakePlatform = MockFlutterNativeViewPlatform();
    FlutterNativeViewPlatform.instance = fakePlatform;

    expect(await flutterNativeViewPlugin.getPlatformVersion(), '42');
  });
}
