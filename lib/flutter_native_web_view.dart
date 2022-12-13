import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef FlutterNativeWebViewCreatedCallback = void Function(
  WebViewController controller,
);

class NativeWebView extends StatelessWidget {
  final FlutterNativeWebViewCreatedCallback onWebViewCreated;

  const NativeWebView({
    Key? key,
    required this.onWebViewCreated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return AndroidView(
          viewType: 'plugins.example/flutter_native_web_view',
          onPlatformViewCreated: _onPlatformViewCreated,
        );
      case TargetPlatform.iOS:
        return UiKitView(
          viewType: 'plugins.example/flutter_native_web_view',
          onPlatformViewCreated: _onPlatformViewCreated,
        );
      default:
        return Text(
            '$defaultTargetPlatform is not yet supported by the web_view plugin');
    }
  }

  // Callback method when platform view is created
  void _onPlatformViewCreated(int id) =>
      onWebViewCreated(WebViewController._(id));
}

class WebViewController {
  WebViewController._(int id)
      : _channel = MethodChannel('plugins.example/flutter_native_web_view_$id');

  final MethodChannel _channel;

  Future<void> setUrl({required String url}) async {
    return _channel.invokeMethod('setUrl', url);
  }
}
