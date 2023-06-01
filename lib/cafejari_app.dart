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

class CafejariApp extends StatelessWidget {
  const CafejariApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: _router);
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
    final GlobalState globalState = ref.watch(globalViewModelProvider);
    return Scaffold(
        body: IndexedStack(
          index: globalState.currentPage.index,
          children: const [MapScreen(), LeaderboardScreen(), ShopScreen(), ProfileScreen()],
        ),
        bottomNavigationBar: WillPopScope(
          onWillPop: () {
            print("pop 색출");
            return Future(() => false);
          },
          child: const BottomNavBar(),
        ));
  }
}
