import 'package:flutter/material.dart';

class NavigationHelper {
  static void pushToPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(
        settings: RouteSettings(name: page.toString()), // 페이지 이름을 설정합니다.
        builder: (context) => page, // 받은 페이지 위젯으로 이동합니다.
      ),
    );
  }
}

class ScreenRoute {

  static const String splash = "splash_screen";
}

enum PageType { map, leaderboard, shop, profile
}
