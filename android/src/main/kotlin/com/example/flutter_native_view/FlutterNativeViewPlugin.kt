package com.example.flutter_native_view

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin

/** FlutterNativeViewPlugin */
class FlutterNativeViewPlugin: FlutterPlugin {
  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    flutterPluginBinding.platformViewRegistry.registerViewFactory(
      "plugins.example/flutter_native_view", FlutterNativeViewFactory(flutterPluginBinding.binaryMessenger))
    flutterPluginBinding.platformViewRegistry.registerViewFactory(
      "plugins.example/flutter_native_web_view", FlutterNativeViewFactory(flutterPluginBinding.binaryMessenger))
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    TODO("Not yet implemented")
  }
}