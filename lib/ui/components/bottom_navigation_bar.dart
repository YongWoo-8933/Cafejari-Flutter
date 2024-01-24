import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/view_model/global_view_model.dart';


class BottomNavBar extends ConsumerWidget {

  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalState globalState = ref.watch(globalViewModelProvider);
    final GlobalViewModel globalViewModel = ref.watch(globalViewModelProvider.notifier);
    final double height = ref.read(bottomNavBarHeightProvider);
    final double cornerRadius = ref.read(bottomNavBarCornerRadiusProvider);

    return Container(
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.grey_500, width: 1, strokeAlign: BorderSide.strokeAlignOutside),
        borderRadius: BorderRadius.all(Radius.circular(cornerRadius))
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(cornerRadius),
          topLeft: Radius.circular(cornerRadius)
        ),
        child: BottomNavigationBar(
          currentIndex: globalState.currentPage.index,
          backgroundColor: AppColor.white,
          selectedItemColor: AppColor.primary,
          unselectedItemColor: AppColor.grey_500,
          iconSize: 24,
          selectedLabelStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
          unselectedLabelStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          onTap: (index) async {
            globalViewModel.updateCurrentPageTo(index);
            if(index==2 && globalState.isChallengeBadgeVisible) {
              globalViewModel.setChallengeBadgeVisible(false);
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('asset/image/icon_navigation_map_grey.png'),
              activeIcon: Image.asset('asset/image/icon_navigation_map.png'),
              label: "탐색"
            ),
            BottomNavigationBarItem(
              icon: Image.asset('asset/image/icon_bottom_bar_coffee_cup_grey.png'),
              activeIcon: Image.asset('asset/image/icon_bottom_bar_coffee_cup.png'),
              label: "내카페"
            ),
            BottomNavigationBarItem(
              icon: Image.asset(globalState.isChallengeBadgeVisible ?
                'asset/image/icon_medal_badge.png' : 'asset/image/icon_medal_grey.png'),
              activeIcon: Image.asset('asset/image/icon_medal.png'),
              label: "챌린지"
            ),
            BottomNavigationBarItem(
              icon: Image.asset(globalState.myPushes.any((e) => !e.isRead) ?
                'asset/image/icon_user_badge.png' : 'asset/image/icon_user_grey.png'),
              activeIcon: Image.asset('asset/image/icon_user.png'),
              label: "MY"
            )
          ],
        ),
      ),
    );
  }
}
