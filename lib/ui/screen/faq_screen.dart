import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

final _webViewControllerProvider = StateProvider<WebViewController>(
        (ref) => WebViewController()..loadRequest(Uri.parse("https://www.instagram.com/cafejari_official/"))
);


class FAQScreen extends ConsumerWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      body: WebViewWidget(controller: ref.watch(_webViewControllerProvider)),
    );
  }
}