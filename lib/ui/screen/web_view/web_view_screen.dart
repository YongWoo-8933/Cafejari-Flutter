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

    pullToRefreshController = (kIsWeb
        ? null
        : PullToRefreshController(
      options: PullToRefreshOptions(
        color: AppColor.white,
        backgroundColor: AppColor.primary,
        slingshotDistance: 40,
        distanceToTriggerSync: 40
      ),
      onRefresh: () async {
        final GlobalState globalState = ref.watch(globalViewModelProvider);
        if (defaultTargetPlatform == TargetPlatform.android) {
          globalState.webViewController?.reload();
        } else if (defaultTargetPlatform == TargetPlatform.iOS) {
          globalState.webViewController?.loadUrl(urlRequest: URLRequest(url: await globalState.webViewController?.getUrl()));
        }
      },
    ))!;
  }

  @override
  Widget build(BuildContext context) {
    final GlobalState globalState = ref.watch(globalViewModelProvider);
    final GlobalViewModel globalViewModel = ref.watch(globalViewModelProvider.notifier);
    return WillPopScope(
      onWillPop: () async {
        bool? canGoBack = await globalState.webViewController?.canGoBack();
        if(canGoBack.isNotNull && canGoBack!) {
          globalState.webViewController?.goBack();
          return false;
        } else {
          return true;
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
                    initialUrlRequest: URLRequest(url: globalState.webViewUri),
                    initialOptions: InAppWebViewGroupOptions(
                      crossPlatform: InAppWebViewOptions(
                        javaScriptCanOpenWindowsAutomatically: true,
                        javaScriptEnabled: true,
                        useOnDownloadStart: true,
                        useOnLoadResource: true,
                        useShouldOverrideUrlLoading: true,
                        mediaPlaybackRequiresUserGesture: true,
                        allowFileAccessFromFileURLs: true,
                        allowUniversalAccessFromFileURLs: true,
                        verticalScrollBarEnabled: true
                      ),
                      android: AndroidInAppWebViewOptions(
                        useHybridComposition: true,
                        allowContentAccess: true,
                        builtInZoomControls: true,
                        thirdPartyCookiesEnabled: true,
                        allowFileAccess: true,
                        supportMultipleWindows: true
                      ),
                      ios: IOSInAppWebViewOptions(
                        allowsInlineMediaPlayback: true,
                        allowsBackForwardNavigationGestures: true,
                      ),
                    ),
                    pullToRefreshController: pullToRefreshController,
                    onLoadStart: (InAppWebViewController controller, uri) {
                      setState(() {  });
                    },
                    onLoadStop: (InAppWebViewController controller, uri) {
                      setState(() {  });
                    },
                    onProgressChanged: (controller, progress) {
                      if (progress == 100) {pullToRefreshController.endRefreshing();}
                      setState(() {this.progress = progress / 100;});
                    },
                    androidOnPermissionRequest: (controller, origin, resources) async {
                      return PermissionRequestResponse(
                        resources: resources,
                        action: PermissionRequestResponseAction.GRANT
                      );
                    },
                    onWebViewCreated: (InAppWebViewController controller) {
                      globalViewModel.initWebViewController(controller);
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