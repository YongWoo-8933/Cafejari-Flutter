import 'package:cafejari_flutter/cafejari_app.dart';
import 'package:cafejari_flutter/ui/screen/app_permission_screen/app_permission_screen.dart';
import 'package:cafejari_flutter/ui/screen/cafe_info_modification/cafe_info_modification_screen.dart';
import 'package:cafejari_flutter/ui/screen/cafe_registration/cafe_registration_screen.dart';
import 'package:cafejari_flutter/ui/screen/challenge/challenge_info_screen.dart';
import 'package:cafejari_flutter/ui/screen/challenge/challenge_progress_screen.dart';
import 'package:cafejari_flutter/ui/screen/leaderboard/leaderboard_screen.dart';
import 'package:cafejari_flutter/ui/screen/login/login_screen.dart';
import 'package:cafejari_flutter/ui/screen/login/registration_screen.dart';
import 'package:cafejari_flutter/ui/screen/push/push_screen.dart';
import 'package:cafejari_flutter/ui/screen/shop/shop_screen.dart';
import 'package:cafejari_flutter/ui/screen/splash/splash_screen.dart';
import 'package:cafejari_flutter/ui/screen/web_view/web_view_screen.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: "/splash_screen",
  observers: [FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance)],
  routes: [
    GoRoute(
      path: "/splash_screen",
      name: ScreenRoute.splash,
      builder: (_, __) => const SplashScreen()
    ),
    GoRoute(
      path: "/app_permission",
      name: ScreenRoute.appPermission,
      builder: (_, __) => const AppPermissionScreen()
    ),
    GoRoute(
      path: "/",
      name: ScreenRoute.root,
      builder: (_, __) => const RootScreen(),
      routes: [
        GoRoute(
            path: "login",
            name: ScreenRoute.login,
            builder: (_, __) => const LoginScreen(),
            routes: [
              GoRoute(
                  path: "registration",
                  name: ScreenRoute.registration,
                  builder: (_, __) => const RegistrationScreen()
              )
            ]
        ),
        GoRoute(
            path: "challenge_info",
            name: ScreenRoute.challengeInfo,
            builder: (_, __) => const ChallengeInfoScreen(),
            routes: [
              GoRoute(
                  path: "challenge_progress",
                  name: ScreenRoute.challengeProgress,
                  builder: (_, __) => const ChallengeProgressScreen()
              )
            ]
        ),
        GoRoute(
          path: "shop",
          name: ScreenRoute.shop,
          builder: (_, __) => const ShopScreen(),
        ),
        GoRoute(
          path: "push",
          name: ScreenRoute.push,
          builder: (_, __) => const PushScreen(),
        ),
        GoRoute(
          path: "leader_board",
          name: ScreenRoute.leaderboard,
          builder: (_, __) => const LeaderboardScreen(),
        ),
        GoRoute(
          path: "cafe_registration",
          name: ScreenRoute.cafeRegistration,
          builder: (_, __) => const CafeRegistrationScreen(),
        ),
        GoRoute(
          path: "cafe_info_modification",
          name: ScreenRoute.cafeInfoModification,
          builder: (_, __) => const CafeInfoModificationScreen(),
        ),
        GoRoute(
          path: "web_view_screen",
          name: ScreenRoute.webView,
          builder: (_, __) => const InAppWebViewScreen(),
        ),
      ]
    ),
  ],
);