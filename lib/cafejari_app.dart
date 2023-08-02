import 'package:cafejari_flutter/ui/app_config/theme.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/screen/leaderboard/leaderboard_screen.dart';
import 'package:cafejari_flutter/ui/screen/map/map_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:cafejari_flutter/ui/screen/profile/profile_screen.dart';
import 'package:cafejari_flutter/ui/screen/shop/shop_screen.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/widget/bottom_navigation_bar.dart';

import 'ui/state/map_state/map_state.dart';
import 'ui/viewmodel/global_view_model.dart';

final darkModeProvider = StateProvider<bool>((ref) => false);

class CafejariApp extends ConsumerWidget  {
  const CafejariApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool darkMode = ref.watch(darkModeProvider);

    return MaterialApp.router(
      theme: darkMode ? Themings.darkTheme : Themings.lightTheme,
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
    initialLocation: "/",
    routes: [GoRoute(path: "/", builder: (context, state) => const _RootScreen())],
    observers: [FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance)]);

class _RootScreen extends ConsumerWidget {
  const _RootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final MapState mapState = ref.watch(mapViewModelProvider);
    final GlobalState globalState = ref.watch(globalViewModelProvider);
    final GlobalViewModel globalViewModel = ref.watch(globalViewModelProvider.notifier);

    return WillPopScope(
      onWillPop: () async {
      if (globalState.currentPage.index != 0) {
        globalViewModel.updateCurrentPageTo(0);
        return false;
      } else {
        if(mapState.bottomSheetController.panelPosition != 0){
          mapState.bottomSheetController.close();
          return false;
        }else{
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
        }
      }
      ,
      child: Scaffold(
          body: IndexedStack(
            index: globalState.currentPage.index,
            children: const [MapScreen(), LeaderboardScreen(), ShopScreen(), ProfileScreen()],
          ),
          bottomNavigationBar: const BottomNavBar(),
          backgroundColor: Colors.transparent),
    );
  }
}