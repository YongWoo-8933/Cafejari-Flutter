import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/router.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/duration.dart';
import 'package:cafejari_flutter/ui/app_config/theme.dart';
import 'package:cafejari_flutter/ui/components/alert_dialog_square.dart';
import 'package:cafejari_flutter/ui/components/custom_snack_bar.dart';
import 'package:cafejari_flutter/ui/screen/challenge/challenge_screen.dart';
import 'package:cafejari_flutter/ui/screen/map/bottom_sheet_full_content.dart';
import 'package:cafejari_flutter/ui/screen/map/bottom_sheet_occupancy_update.dart';
import 'package:cafejari_flutter/ui/screen/map/bottom_sheet_preview.dart';
import 'package:cafejari_flutter/ui/screen/my_cafe/my_cafe_screen.dart';
import 'package:cafejari_flutter/ui/screen/my_page/my_page_screen.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';
import 'package:cafejari_flutter/ui/view_model/global_view_model.dart';
import 'package:cafejari_flutter/ui/view_model/map_view_model.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/screen/map/map_screen.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/components/bottom_navigation_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'ui/state/map_state/map_state.dart';

class CafejariApp extends ConsumerWidget {
  const CafejariApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return MaterialApp.router(
      theme: Theming.lightTheme,
      routerConfig: appRouter,
    );
  }
}

class RootScreen extends ConsumerStatefulWidget {
  const RootScreen({super.key});

  @override
  RootScreenState createState() => RootScreenState();
}

class RootScreenState extends ConsumerState<RootScreen> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    Future.delayed(Duration.zero, () async {
      final GlobalViewModel globalViewModel = ref.watch(globalViewModelProvider.notifier);
      await globalViewModel.init();
      FlutterNativeSplash.remove();

      final PendingDynamicLinkData? data = await FirebaseDynamicLinks.instance.getInitialLink();
      final Uri? deepLink = data?.link;
      if (deepLink.isNotNull) {
        // 링크를 통해 실행된 경우
        final List<String> separatedString = [];
        separatedString.addAll(deepLink!.path.split('/'));
        if (separatedString[1] == "map") {
          final GlobalViewModel globalViewModel = ref.watch(globalViewModelProvider.notifier);
          if(context.mounted) GoRouter.of(context).goNamed(ScreenRoute.root);
          globalViewModel.updateCurrentPageTo(PageType.map.index);
          globalViewModel.showSnackBar(content: "카페 id: ${separatedString[2]}", type: SnackBarType.complete);
        }
      }
      // 링크 작업 등록
      FirebaseDynamicLinks.instance.onLink.listen((pendingDynamicLinkData) {
        final Uri deepLink = pendingDynamicLinkData.link;
        final List<String> separatedString = [];
        separatedString.addAll(deepLink.path.split('/'));
        if (separatedString[1] == "map") {
          final GlobalViewModel globalViewModel = ref.watch(globalViewModelProvider.notifier);
          if (context.mounted) GoRouter.of(context).goNamed(ScreenRoute.root);
          globalViewModel.updateCurrentPageTo(PageType.map.index);
          globalViewModel.showSnackBar(content: "카페 id는\n${separatedString[2]}", type: SnackBarType.complete);
        }
      },
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {

    final MapState mapState = ref.watch(mapViewModelProvider);
    final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);
    final GlobalState globalState = ref.watch(globalViewModelProvider);
    final double deviceHeight = MediaQuery.of(context).size.height;
    const double bottomSheetPreviewHeight = 268;
    const double bottomSheetPreviewCornerRadius = 20;

    return RefreshConfiguration(
      headerBuilder: () => const WaterDropMaterialHeader(backgroundColor: AppColor.primary),
      headerTriggerDistance: 80.0,
      springDescription: const SpringDescription(stiffness: 170, damping: 16, mass: 1.9),
      maxOverScrollExtent: 100,
      maxUnderScrollExtent: 0,
      enableScrollWhenRefreshCompleted: true,
      child: WillPopScope(
        onWillPop: () async {
          if (globalState.currentPage.index != 0) {
            mapViewModel.globalViewModel.updateCurrentPageTo(0);
            return false;
          } else if(mapState.isSearchPageVisible) {
            mapViewModel.closeSearchPage();
            return false;
          } else if(mapState.bottomSheetOccupancyController.isPanelOpen) {
            mapState.bottomSheetOccupancyController.close();
            return false;
          } else if(mapState.bottomSheetController.isPanelOpen) {
            mapState.bottomSheetController.close();
            return false;
          } else if(mapState.isBottomSheetPreviewOpened) {
            await mapViewModel.closeBottomSheetPreview();
            return false;
          } else {
            return await showDialog<bool>(
              context: context,
              builder: (context) => SquareAlertDialog(
                text: "앱을 종료하시겠습니까?",
                negativeButtonText: "예",
                positiveButtonText: "아니오",
                onDismiss: () => Navigator.of(context).pop(),
                onNegativeButtonPressed: () => SystemNavigator.pop(),
                onPositiveButtonPressed: () {},
              )
            ) ?? false;
          }
        },
        child: DefaultTextStyle(
          style: const TextStyle(
            letterSpacing: 0,
            color: AppColor.black,
            fontSize: 14,
            fontWeight: FontWeight.w400
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              SlidingUpPanel(
                controller: mapState.bottomSheetOccupancyController,
                minHeight: 0,
                maxHeight: 480,
                backdropEnabled: true,
                color: AppColor.transparent,
                body: SlidingUpPanel(
                  controller: mapState.bottomSheetController,
                  minHeight: mapState.isBottomSheetPreviewOpened ?
                    bottomSheetPreviewHeight - bottomSheetPreviewCornerRadius : 0,
                  maxHeight: deviceHeight,
                  backdropEnabled: false,
                  boxShadow: null,
                  color: AppColor.transparent,
                  onPanelOpened: () => mapViewModel.setBottomSheetFullContentVisible(true),
                  onPanelClosed: () => mapViewModel.setBottomSheetFullContentVisible(false),
                  body: Scaffold(
                    body: IndexedStack(
                      index: globalState.currentPage.index,
                      children: const [
                        MapScreen(),
                        MyCafeScreen(),
                        ChallengeScreen(),
                        MyPageScreen()
                      ],
                    ),
                    resizeToAvoidBottomInset: false,
                    bottomNavigationBar: const BottomNavBar(),
                    backgroundColor: AppColor.transparent,
                    extendBody: true,
                  ),
                  // 카페 bottom sheet
                  panelBuilder: (scrollController) {
                    return Container(
                      color: AppColor.transparent,
                      child: AnimatedCrossFade(
                        firstChild: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const BottomSheetPreview(height: bottomSheetPreviewHeight, cornerRadius: bottomSheetPreviewCornerRadius),
                            Container(
                              color: AppColor.white,
                              height: deviceHeight - bottomSheetPreviewHeight,
                            ),
                          ],
                        ),
                        secondChild: BottomSheetFullContent(scrollController: scrollController),
                        crossFadeState: mapState.isBottomSheetFullContentVisible ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                        duration: AppDuration.animationDefault
                      )
                    );
                  }
                ),
                // 카페 혼잡도 업데이트 패널
                panelBuilder: (_) {
                  return const BottomSheetOccupancyUpdate();
                },
              ),
              CustomSnackBar(
                isVisible: globalState.isSnackBarOpened,
                isExpanded: globalState.isSnackBarExpanded,
                content: globalState.snackBarText,
                type: globalState.snackBarType,
              )
            ],
          ),
        ),
      )
    );
  }
}