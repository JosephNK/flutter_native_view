import 'package:flutter/material.dart';
import 'package:flutter_native_view/flutter_native_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(color: Colors.orangeAccent, height: 50.0),
              _buildNativeView(),
              // _buildNativeWebView(),
              Container(color: Colors.pinkAccent, height: 50.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNativeView() {
    return const SizedBox(
      height: 10000, // <-- For larger sizes, a crash occurs.
      child: NativeYellowView(),
    );
  }

  Widget _buildNativeWebView() {
    return SizedBox(
      height: 10000, // <-- For larger sizes, a crash occurs.
      child: NativeWebView(
        onWebViewCreated: (controller) {
          _webViewController = controller;
          controller.setUrl(url: 'https://flutter.dev/');
        },
      ),
    );
  }
}
