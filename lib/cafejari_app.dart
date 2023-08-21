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
import 'package:cafejari_flutter/ui/viewmodel/map_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/screen/map/map_screen.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/components/bottom_navigation_bar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'ui/state/map_state/map_state.dart';
import 'ui/viewmodel/global_view_model.dart';

final darkModeProvider = StateProvider<bool>((ref) => false);

class CafejariApp extends ConsumerWidget  {
  const CafejariApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool darkMode = ref.watch(darkModeProvider);

    return MaterialApp.router(
      theme: darkMode ? Theming.darkTheme : Theming.lightTheme,
      routerConfig: appRouter,
    );
  }
}

class RootScreen extends ConsumerStatefulWidget {
  const RootScreen({super.key});

  @override
  RootScreenState createState() => RootScreenState();
}

class RootScreenState extends ConsumerState<RootScreen> {

  @override
  Widget build(BuildContext context) {

    final MapState mapState = ref.watch(mapViewModelProvider);
    final GlobalState globalState = ref.watch(globalViewModelProvider);
    final GlobalViewModel globalViewModel = ref.watch(globalViewModelProvider.notifier);
    final double deviceHeight = MediaQuery.of(context).size.height;
    const double bottomSheetPreviewHeight = 268;
    const double bottomSheetPreviewCornerRadius = 20;
    final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);

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
            globalViewModel.updateCurrentPageTo(0);
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
                boxShadow: null,
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