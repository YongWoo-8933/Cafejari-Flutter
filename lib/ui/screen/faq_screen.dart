import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class FAQScreen extends StatelessWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WebViewController webViewController = WebViewController()
    ..loadRequest(Uri.parse("https://www.instagram.com/cafejari_official/"));

    return Scaffold(
      body: WebViewWidget(controller: webViewController),
    );
  }
}