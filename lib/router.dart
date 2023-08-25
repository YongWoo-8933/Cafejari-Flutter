
import 'package:cafejari_flutter/cafejari_app.dart';
import 'package:cafejari_flutter/ui/screen/cafe_registration/cafe_registration_screen.dart';
import 'package:cafejari_flutter/ui/screen/challenge/challenge_info_screen.dart';
import 'package:cafejari_flutter/ui/screen/challenge/challenge_progress_screen.dart';
import 'package:cafejari_flutter/ui/screen/leaderboard/leaderboard_screen.dart';
import 'package:cafejari_flutter/ui/screen/login/login_screen.dart';
import 'package:cafejari_flutter/ui/screen/login/registration_screen.dart';
import 'package:cafejari_flutter/ui/screen/my_cafe/my_cafe_screen.dart';
import 'package:cafejari_flutter/ui/screen/point/point_screen.dart';
import 'package:cafejari_flutter/ui/screen/push/push_screen.dart';
import 'package:cafejari_flutter/ui/screen/shop/shop_screen.dart';
import 'package:cafejari_flutter/ui/screen/splash/splash_screen.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      name: ScreenRoute.root,
      builder: (_, __) => RootScreen(),
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
          path: "my_cafe",
          name: ScreenRoute.myCafe,
          builder: (_, __) => const MyCafeScreen(),
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
          path: "point",
          name: ScreenRoute.point,
          builder: (_, __) => const PointScreen(),
        ),
        GoRoute(
          path: "push",
          name: ScreenRoute.push,
          builder: (_, __) => const PushScreen(),
        ),
        GoRoute(
          path: "leader_board",
          name: ScreenRoute.leader_board,
          builder: (_, __) => const LeaderboardScreen(),
        ),
        GoRoute(
          path: "cafe_registration",
          name: ScreenRoute.cafeRegistration,
          builder: (_, __) => const CafeRegistrationScreen(),
        ),
      ]
    ),
    GoRoute(
        path: "/splash",
        name: ScreenRoute.splash,
        builder: (_, __) => const SplashScreen()
    ),
  ],
  observers: [FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance)]);