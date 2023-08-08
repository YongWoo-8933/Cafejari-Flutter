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

    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
      ),
      child: BottomNavigationBar(
        currentIndex: globalState.currentPage.index,
        items:  [
          BottomNavigationBarItem(
            icon: _BottomBarUnit(
              imageAsset: 'asset/image/icon_navigation_map_grey.png',
              imageAssetSelected: 'asset/image/icon_navigation_map.png',
              isSelected: globalState.currentPage.index == PageType.map.index,
              description: "탐색",
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: _BottomBarUnit(
              imageAsset: 'asset/image/icon_medal_grey.png',
              imageAssetSelected: 'asset/image/icon_medal.png',
              isSelected: globalState.currentPage.index == PageType.leaderboard.index,
              description: "챌린지",
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: _BottomBarUnit(
              imageAsset: 'asset/image/icon_plag_grey.png',
              imageAssetSelected: 'asset/image/icon_plag.png',
              isSelected: globalState.currentPage.index == PageType.shop.index,
              description: "카페로그",
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: _BottomBarUnit(
              imageAsset: 'asset/image/icon_user_grey.png',
              imageAssetSelected: 'asset/image/icon_user.png',
              isSelected: globalState.currentPage.index == PageType.profile.index,
              description: "MY",
            ),
            label: "",
          ),
        ],
        backgroundColor: AppColor.white,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => globalViewModel.updateCurrentPageTo(index),
      ),
    );

  }
}

class _BottomBarUnit extends StatelessWidget {
  final String imageAsset;
  final String imageAssetSelected;
  final bool isSelected;
  final String description;

  const _BottomBarUnit({
    Key? key,
    required this.imageAsset,
    required this.imageAssetSelected,
    required this.isSelected,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 42,
      child: Column(
        children: [
          Image.asset(
            isSelected ? imageAssetSelected : imageAsset,
            width: 26,
            height: 26,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 2.0),
            child: Text(
              description,
              style: TextStyle(
                fontSize: 10.0,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
