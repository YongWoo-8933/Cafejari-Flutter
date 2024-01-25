import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/core/flutter_local_notification.dart';
import 'package:cafejari_flutter/router.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/duration.dart';
import 'package:cafejari_flutter/ui/app_config/theme.dart';
import 'package:cafejari_flutter/ui/components/onboarding_dialog.dart';
import 'package:cafejari_flutter/ui/components/square_alert_dialog.dart';
import 'package:cafejari_flutter/ui/components/custom_snack_bar.dart';
import 'package:cafejari_flutter/ui/screen/challenge/challenge_screen.dart';
import 'package:cafejari_flutter/ui/screen/map/bottom_sheet_full_content.dart';
import 'package:cafejari_flutter/ui/screen/map/bottom_sheet_preview.dart';
import 'package:cafejari_flutter/ui/screen/my_cafe/my_cafe_screen.dart';
import 'package:cafejari_flutter/ui/screen/my_page/my_page_screen.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';
import 'package:cafejari_flutter/ui/view_model/global_view_model.dart';
import 'package:cafejari_flutter/ui/view_model/map_view_model.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    final GlobalState globalState = ref.watch(globalViewModelProvider);

    return RefreshConfiguration(
        headerBuilder: () => const WaterDropMaterialHeader(backgroundColor: AppColor.primary),
        headerTriggerDistance: 80.0,
        springDescription: const SpringDescription(stiffness: 170, damping: 16, mass: 1.9),
        maxOverScrollExtent: 100,
        maxUnderScrollExtent: 0,
        enableScrollWhenRefreshCompleted: true,
      child: Stack(
        alignment: Alignment.center,
        children: [
          MaterialApp.router(
            theme: Theming.lightTheme,
            routerConfig: appRouter,
            debugShowCheckedModeBanner: false,
          ),
          CustomSnackBar(
            isVisible: globalState.isSnackBarOpened,
            isExpanded: globalState.isSnackBarExpanded,
            content: globalState.snackBarText,
            type: globalState.snackBarType,
          )
        ],
      ),
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
      final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);
      final challengeViewModel = ref.watch(challengeViewModelProvider.notifier);
      final myPageViewModel = ref.watch(myPageViewModelProvider.notifier);

      // 기본 서버 정보 로딩
      await mapViewModel.refreshLocations();
      await mapViewModel.getRandomCafeImageUrl();
      await challengeViewModel.refreshChallenges();
      await myPageViewModel.getDefaultProfileImages();
      if (context.mounted) await globalViewModel.startAppFeedbackTimer(context: context);
      if (!await globalViewModel.getIsFlagButtonTapped()) globalViewModel.setFlagButtonBadgeVisible(true);

      if (await globalViewModel.getIsInstalledFirst() && context.mounted) {
        // 앱 첫 사용자
        globalViewModel.setIsInstalledFirst(false);
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => const OnboardingDialog()
        );
      } else {
        // 일반 앱 시작
        await globalViewModel.init();
      }

      // 지도 관련 deep link 로직 처리
      Future.delayed(const Duration(seconds: 1), () async {
        final PendingDynamicLinkData? data = await FirebaseDynamicLinks.instance.getInitialLink();
        final Uri? deepLink = data?.link;
        if (deepLink.isNotNull && context.mounted) {
          _mapLinkFunction(
            context: context,
            mapViewModel: mapViewModel,
            globalViewModel: globalViewModel,
            link: deepLink!
          );
        }
      });

      // 위치 트래킹, 버전 체크
      if(context.mounted) {
        await globalViewModel.locationTrackingStart(context: context);
        if(context.mounted) await globalViewModel.checkVersion(context: context);
      }

      // 맵 딥링크 설정
      FirebaseDynamicLinks.instance.onLink.listen((pendingDynamicLinkData) async {
        final Uri deepLink = pendingDynamicLinkData.link;
        if (context.mounted) {
          _mapLinkFunction(
            context: context,
            mapViewModel: mapViewModel,
            globalViewModel: globalViewModel,
            link: deepLink
          );
        }
      });

      // 알림 설정
      FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true
      );
      if(defaultTargetPlatform == TargetPlatform.android) {
        FirebaseMessaging.onMessage.listen((RemoteMessage message) {
          if (message.notification.isNotNull) {
            globalViewModel.init();
            FlutterLocalNotification.showNotification(
              title: message.notification!.title,
              body: message.notification!.body
            );
          }
        });
      }
      RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
      if (initialMessage.isNotNull) {
        final String? bottomTabIndex = initialMessage!.data['bottom_tab_index'];
        if (bottomTabIndex.isNotNull) {
          globalViewModel.updateCurrentPageTo(int.parse(bottomTabIndex!));
        }
      }
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        if (message.notification.isNotNull) {
          globalViewModel.init();
          final String? bottomTabIndex = message.data['bottom_tab_index'];
          if (bottomTabIndex.isNotNull) {
            globalViewModel.updateCurrentPageTo(int.parse(bottomTabIndex!));
          }
        }
      });
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
    switch(state) {
      case AppLifecycleState.resumed:
        Future.delayed(Duration.zero, () async {
          final timeDifferenceInSeconds = ref.watch(mapViewModelProvider).lastUpdateTime.difference(DateTime.now()).inSeconds;
          if(ref.watch(mapViewModelProvider).cafes.isNotEmpty && timeDifferenceInSeconds.abs() > 90) {
            await ref.watch(mapViewModelProvider.notifier).refreshCafes();
          }
        });
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.hidden:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final MapState mapState = ref.watch(mapViewModelProvider);
    final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);
    final GlobalState globalState = ref.watch(globalViewModelProvider);
    final double deviceHeight = MediaQuery.of(context).size.height;
    const double bottomSheetPreviewHeight = 268;
    const double bottomSheetPreviewCornerRadius = 20;

    return PopScope(
      canPop: false,
      onPopInvoked: (result) async {
        if (globalState.currentPage.index != 0) {
          mapViewModel.globalViewModel.updateCurrentPageTo(0);
        } else if(mapState.isSearchPageVisible) {
          mapViewModel.closeSearchPage();
        } else if(mapState.bottomSheetController.isPanelOpen) {
          mapState.bottomSheetController.close();
        } else if(mapState.isBottomSheetPreviewOpened) {
          await mapViewModel.closeBottomSheetPreview();
        } else if(!await mapViewModel.globalViewModel.getIsReviewSubmitted() && context.mounted) {
          await mapViewModel.globalViewModel.showAppFeedbackDialog(context: context);
        } else {
          if(context.mounted) {
            await showDialog<bool>(
              context: context,
              builder: (context) =>
                SquareAlertDialog(
                  text: "앱을 종료하시겠습니까?",
                  negativeButtonText: "예",
                  positiveButtonText: "아니오",
                  onDismiss: () => Navigator.of(context).pop(),
                  onNegativeButtonPress: () => SystemNavigator.pop(),
                  onPositiveButtonPress: () {},
                )
            );
          }
        }
      },
      child: DefaultTextStyle(
        style: const TextStyle(
          letterSpacing: 0,
          color: AppColor.black,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 1.2
        ),
        child: SlidingUpPanel(
          controller: mapState.bottomSheetController,
          minHeight: mapState.isBottomSheetPreviewOpened ?
            bottomSheetPreviewHeight - bottomSheetPreviewCornerRadius : 0,
          maxHeight: deviceHeight,
          backdropEnabled: false,
          boxShadow: null,
          color: AppColor.transparent,
          onPanelOpened: () => mapViewModel.setBottomSheetFullContentVisible(true),
          onPanelClosed: () => mapViewModel.setBottomSheetFullContentVisible(false),
          body: SafeArea(
            top: false,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              bottomNavigationBar: const SafeArea(top: false, child: BottomNavBar()),
              backgroundColor: AppColor.transparent,
              extendBody: true,
              body: IndexedStack(
                index: globalState.currentPage.index,
                children: const [
                  MapScreen(),
                  MyCafeScreen(),
                  ChallengeScreen(),
                  MyPageScreen()
                ],
              )
            ),
          ),
          // 카페 bottom sheet
          panelBuilder: (scrollController) {
            return Container(
              color: AppColor.transparent,
              child: AnimatedCrossFade(
                firstChild: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const BottomSheetPreview(
                      height: bottomSheetPreviewHeight,
                      cornerRadius: bottomSheetPreviewCornerRadius
                    ),
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
      ),
    );
  }
}


_mapLinkFunction({
  required BuildContext context,
  required MapViewModel mapViewModel,
  required GlobalViewModel globalViewModel,
  required Uri link
}) async {
  final List<String> separatedString = [];
  separatedString.addAll(link.path.split('/'));
  if (separatedString[1] == "map") {
    if(context.mounted) GoRouter.of(context).goNamed(ScreenRoute.root);
    globalViewModel.updateCurrentPageTo(PageType.map.index);
    await mapViewModel.initWithMapLinkCafeId(int.parse(separatedString[2]));
    await mapViewModel.openBottomSheetPreview();
  }
}