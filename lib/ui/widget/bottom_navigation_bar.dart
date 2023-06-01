import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';
import 'package:cafejari_flutter/ui/viewmodel/global_view_model.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalState globalState = ref.watch(globalViewModelProvider);
    final GlobalViewModel globalViewModel = ref.watch(globalViewModelProvider.notifier);

    return CurvedNavigationBar(
      index: globalState.currentPage.index,
      height: 60.0,
      items: <Widget>[
        _BottomBarUnit(
            icon: CupertinoIcons.map_fill,
            isSelected: globalState.currentPage.index == PageType.map.index,
            description: "지도"),
        _BottomBarUnit(
            icon: Icons.military_tech,
            isSelected: globalState.currentPage.index == PageType.leaderboard.index,
            description: "랭킹"),
        _BottomBarUnit(
            icon: Icons.shopping_cart,
            isSelected: globalState.currentPage.index == PageType.shop.index,
            description: "상점"),
        _BottomBarUnit(
            icon: CupertinoIcons.profile_circled,
            isSelected: globalState.currentPage.index == PageType.profile.index,
            description: "프로필")
      ],
      color: AppColor.white,
      buttonBackgroundColor: AppColor.white,
      backgroundColor: AppColor.brown_500,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 400),
      onTap: (index) => globalViewModel.updateCurrentPageTo(index),
    );
  }
}

class _BottomBarUnit extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final String description;

  const _BottomBarUnit(
      {Key? key, required this.icon, required this.isSelected, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 36,
        height: 36,
        child: Column(
          children: [
            Icon(icon, size: 24, color: isSelected ? AppColor.brown_500 : AppColor.grey_300),
            Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Text(description,
                    style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                        color: isSelected ? AppColor.brown_500 : AppColor.grey_300)))
          ],
        ));
  }
}
