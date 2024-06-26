import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/components/back_button_app_bar.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/view_model/global_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class InAppWebViewScreen extends ConsumerStatefulWidget {
  const InAppWebViewScreen({Key? key}):super(key:key);

  @override
  InAppWebViewScreenState createState() => InAppWebViewScreenState();
}

class InAppWebViewScreenState extends ConsumerState<InAppWebViewScreen> {
  final GlobalKey webViewKey = GlobalKey();
  late final PullToRefreshController pullToRefreshController;
  double progress = 0;

  @override
  void initState() {
    super.initState();

    pullToRefreshController = PullToRefreshController(
      settings: PullToRefreshSettings(
        color: AppColor.white,
        backgroundColor: AppColor.primary,
        slingshotDistance: 40,
        distanceToTriggerSync: 40
      ),
      onRefresh: () async {
        final GlobalState globalState = ref.watch(globalViewModelProvider);
        if (defaultTargetPlatform == TargetPlatform.android) {
          await globalState.webViewController?.reload();
        } else if (defaultTargetPlatform == TargetPlatform.iOS) {
          await globalState.webViewController?.loadUrl(urlRequest: URLRequest(url: await globalState.webViewController?.getUrl()));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final GlobalState globalState = ref.watch(globalViewModelProvider);
    final GlobalViewModel globalViewModel = ref.watch(globalViewModelProvider.notifier);
    return PopScope(
      canPop: false,
      onPopInvoked: (result) async {
        bool? canGoBack = await globalState.webViewController?.canGoBack();
        if(canGoBack.isNotNull && canGoBack!) {
          globalState.webViewController?.goBack();
        } else {
          if(context.mounted) GoRouter.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: BackButtonAppBar(
          backGroundColor: AppColor.white,
          onBack: () => GoRouter.of(context).pop(),
          backButtonText: globalState.webViewTitle,
        ),
        body: Column(
          children: <Widget>[
            progress < 1.0
                ? LinearProgressIndicator(value: progress, color: AppColor.primary)
                : Container(),
            Expanded(
              child: Stack(
                children: [
                  InAppWebView(
                    key: webViewKey,
                    initialUrlRequest: URLRequest(url: WebUri.uri(globalState.webViewUri)),
                    initialSettings: InAppWebViewSettings(
                      javaScriptCanOpenWindowsAutomatically: true,
                      javaScriptEnabled: true,
                      useOnDownloadStart: true,
                      useOnLoadResource: true,
                      useShouldOverrideUrlLoading: true,
                      mediaPlaybackRequiresUserGesture: true,
                      allowFileAccessFromFileURLs: true,
                      allowUniversalAccessFromFileURLs: true,
                      verticalScrollBarEnabled: true,
                      useHybridComposition: true,
                      allowContentAccess: true,
                      builtInZoomControls: true,
                      thirdPartyCookiesEnabled: true,
                      allowFileAccess: true,
                      supportMultipleWindows: true,
                      allowsInlineMediaPlayback: true,
                      allowsBackForwardNavigationGestures: true,
                    ),
                    pullToRefreshController: pullToRefreshController,
                    onProgressChanged: (controller, progress) {
                      if (progress == 100) {pullToRefreshController.endRefreshing();}
                      setState(() {this.progress = progress / 100;});
                    },
                    onWebViewCreated: (InAppWebViewController controller) {
                      globalViewModel.initWebViewController(controller);
                    },
                    shouldOverrideUrlLoading:
                        (controller, navigationAction) async {
                      var uri = navigationAction.request.url!;
                      if (![
                        "http",
                        "https",
                        "file",
                        "chrome",
                        "data",
                        "javascript",
                        "about"
                      ].contains(uri.scheme)) {
                        if (await canLaunchUrl(uri)) {
                          // Launch the App
                          await launchUrl(
                            uri,
                          );
                          // and cancel the request
                          return NavigationActionPolicy.CANCEL;
                        }
                      }
                      return NavigationActionPolicy.ALLOW;
                    }
                  )
                ]
              )
            )
          ]
        )
      ),
    );
  }
}