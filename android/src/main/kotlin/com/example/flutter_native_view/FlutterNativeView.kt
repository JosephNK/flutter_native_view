package com.example.flutter_native_view

import android.content.Context
import android.graphics.Color
import android.view.View
import android.webkit.WebView
import android.webkit.WebViewClient
import android.widget.LinearLayout
import androidx.annotation.NonNull
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView

class FlutterNativeView constructor(context: Context, messenger: BinaryMessenger, id: Int) : PlatformView,
    MethodChannel.MethodCallHandler {
    private lateinit var channel : MethodChannel
    private var layout: LinearLayout
    private val view: View

    init {
        view = View(context)
        view.layoutParams = LinearLayout.LayoutParams(
            LinearLayout.LayoutParams.MATCH_PARENT,
            LinearLayout.LayoutParams.WRAP_CONTENT
        )
        view.setBackgroundColor(Color.parseColor("#FFFF00"))

        layout = LinearLayout(context)
        layout.orientation = LinearLayout.VERTICAL
        layout.layoutParams = LinearLayout.LayoutParams(
            LinearLayout.LayoutParams.MATCH_PARENT,
            LinearLayout.LayoutParams.WRAP_CONTENT
        )

        layout.addView(view)

        channel = MethodChannel(messenger, "plugins.example/flutter_native_view_$id")
        // Init methodCall Listener
        channel.setMethodCallHandler(this)
    }

    override fun getView(): View {
        return layout
    }

    override fun dispose() {
        TODO("Not yet implemented")
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) {
        if (call.method == "getPlatformVersion") {
            result.success("Android ${android.os.Build.VERSION.RELEASE}")
        } else {
            result.notImplemented()
        }
    }
}