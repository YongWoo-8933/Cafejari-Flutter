package kr.co.cafejari.cafejari_flutter

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        intent.putExtra("background_mode", "transparent")
        super.onCreate(savedInstanceState)
    }

    override fun onFlutterTextureViewCreated(flutterTextureView: FlutterTextureView) {
        flutterTextureView.isOpaque = true
        super.onFlutterTextureViewCreated(flutterTextureView)
    }
}