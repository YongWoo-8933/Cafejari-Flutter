
import 'package:cafejari_flutter/router.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/theme.dart';
import 'package:cafejari_flutter/ui/screen/challenge/challenge_screen.dart';
import 'package:cafejari_flutter/ui/screen/my_cafe/my_cafe_screen.dart';
import 'package:cafejari_flutter/ui/screen/my_page/my_page_screen.dart';
import 'package:cafejari_flutter/ui/viewmodel/map_view_model.dart';
import 'package:flutter/material.dart';
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
    final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);

    return RefreshConfiguration(
      headerBuilder: () => const WaterDropMaterialHeader(backgroundColor: AppColor.primary),
      headerTriggerDistance: 80.0,
      springDescription: const SpringDescription(stiffness: 170, damping: 16, mass: 1.9),
      maxOverScrollExtent :100,
      maxUnderScrollExtent:0,
      enableScrollWhenRefreshCompleted: true,
      child: WillPopScope(
        onWillPop: () async {
          if (globalState.currentPage.index != 0) {
            globalViewModel.updateCurrentPageTo(0);
            return false;
          } else if(mapState.bottomSheetController.panelPosition != 0) {
            mapState.bottomSheetController.close();
            return false;
          } else {
            final exit = await showDialog<bool>(
              context: context,
              builder: (context) => AlertDialog(
                content: const Text("앱을 종료하시겠습니까?"),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: const Text('확인'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: const Text('취소'),
                  ),
                ],
              ),
            );
            return exit ?? false;
          }
        },
        // child: SlidingUpPanel(
        child: Scaffold(
            key: mapState.scaffoldStateKey,
            body: IndexedStack(
              index: globalState.currentPage.index,
              children: const [MapScreen(), MyCafeScreen(), ChallengeScreen(), MyPageScreen()],
            ),
            bottomNavigationBar: const BottomNavBar(),
            backgroundColor: AppColor.transparent,
            floatingActionButton: FloatingActionButton(
              child: Text("모달열기"),
              onPressed: () {
                mapState.scaffoldStateKey.currentState!.showBottomSheet(enableDrag: true, (context) {
                  return GestureDetector(
                    onVerticalDragUpdate: (details) {
                      if (details.delta.dy < 0 && details.delta.dy.abs() > 10.0) {
                        showModalBottomSheet(context: context, builder: (context) {
                          return Container(
                            width: double.infinity,
                            height: 500,
                            child: Text("두번째 모달"),
                          );
                        });
                        // showMaterialModalBottomSheet(
                        //   context: context,
                        //   builder: (context) {
                        //     return Container(
                        //       width: double.infinity,
                        //       height: 500,
                        //       child: Text("두번째 모달"),
                        //     );
                        //   }
                        // );
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      child: SizedBox(
                        width: 100,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("fdsaf"),
                        ),
                      ),
                    ),
                  );
                });
              },
            )
          )
        )
      // child: Scaffold(
      //     body: IndexedStack(
      //       index: globalState.currentPage.index,
      //       children: const [MapScreen(), ChallengeScreen(), MyCafeScreen(), MyPageScreen()],
      //     ),
      //     panelBuilder: (ScrollController sc) {
      //       return SingleChildScrollView( // 스크롤 가능한 뷰로 변경
      //         controller: sc, // 스크롤 컨트롤러를 전달
      //         child: Column(
      //           children: const [
      //             // BottomSheetPage1(),
      //             // BottomSheetPage2(),
      //             // BottomSheetPage3(),
      //           ],
      //         ),
      //       );
      //     },
      //     controller: mapState.bottomSheetController,
      //     minHeight: 0,
      //     maxHeight: deviceHeight,
      //     snapPoint: 0.3,
      //     borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          // onPanelClosed: () => {
          //   mapViewModel.updateTopVisible(true),
          //   mapViewModel.updateTopImageVisible(false),
          //   mapState.pageController.jumpToPage(0)
          // },
          // onPanelSlide: (double slideOffset) {
          //   if (slideOffset <= 0.31) {
          //     ref.read(mapViewModelProvider.notifier).updateTopVisible(true);
          //     //mapState.pageController.jumpToPage(0);
          //   } else if(0.31 < slideOffset && slideOffset < 0.7){
          //     ref.read(mapViewModelProvider.notifier).updateTopVisible(false);
          //     ref.read(mapViewModelProvider.notifier).updateTopImageVisible(false);
          //     mapState.pageController.jumpToPage(1);
          //   }else{
          //     ref.read(mapViewModelProvider.notifier).updateTopImageVisible(true);
          //   }
          // },


    );
  }
}