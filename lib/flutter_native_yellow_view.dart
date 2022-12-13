import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NativeYellowView extends StatelessWidget {
  const NativeYellowView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return AndroidView(
          viewType: 'plugins.example/flutter_native_view',
          onPlatformViewCreated: _onPlatformViewCreated,
        );
      case TargetPlatform.iOS:
        return UiKitView(
          viewType: 'plugins.example/flutter_native_view',
          onPlatformViewCreated: _onPlatformViewCreated,
        );
      default:
        return Text(
            '$defaultTargetPlatform is not yet supported by the web_view plugin');
    }
  }

  // Callback method when platform view is created
  void _onPlatformViewCreated(int id) {}
}
