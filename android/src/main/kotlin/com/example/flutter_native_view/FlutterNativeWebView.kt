package com.example.flutter_native_view

import android.content.Context
import android.view.View
import android.webkit.WebView
import android.webkit.WebViewClient
import android.widget.LinearLayout
import androidx.annotation.NonNull
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView

class FlutterNativeWebView constructor(context: Context, messenger: BinaryMessenger, id: Int) : PlatformView,
    MethodChannel.MethodCallHandler {
    private lateinit var channel : MethodChannel
    private var layout: LinearLayout
    private val webView: WebView

    init {
        webView = WebView(context)
        webView.layoutParams = LinearLayout.LayoutParams(
            LinearLayout.LayoutParams.MATCH_PARENT,
            LinearLayout.LayoutParams.WRAP_CONTENT
        )

        webView.webViewClient = WebViewClient()

        layout = LinearLayout(context)
        layout.orientation = LinearLayout.VERTICAL
        layout.layoutParams = LinearLayout.LayoutParams(
            LinearLayout.LayoutParams.MATCH_PARENT,
            LinearLayout.LayoutParams.WRAP_CONTENT
        )

        layout.addView(webView)

        channel = MethodChannel(messenger, "plugins.example/flutter_native_web_view_$id")
        channel.setMethodCallHandler(this)
    }

    override fun getView(): View {
        return layout
    }

    override fun dispose() {
        TODO("Not yet implemented")
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) {
        when (call.method) {
            "setUrl" -> setText(call, result)
            else -> result.notImplemented()
        }
    }

    // set and load new Url
    private fun setText(call: MethodCall, result: MethodChannel.Result ) {
        val url = call.arguments as String
        webView.loadUrl(url)
        result.success(null)
    }
}