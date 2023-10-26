import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/components/square_alert_dialog.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';
import 'package:cafejari_flutter/ui/view_model/map_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BookmarkButton extends ConsumerWidget {
  final double? buttonSize;

  const BookmarkButton({
    super.key,
    required this.buttonSize,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalState globalState = ref.watch(globalViewModelProvider);
    final MapState mapState = ref.watch(mapViewModelProvider);
    final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);
    return Container(
      width: buttonSize,
      height: buttonSize,
      decoration: const BoxDecoration(
        shape: BoxShape.circle
      ),
      child: ElevatedButton(
        onPressed: () {
          HapticFeedback.lightImpact();
          if (globalState.isLoggedIn) {
            mapViewModel.updateFavoriteCafeList(cafe: mapState.selectedCafe, context: context);
          } else {
            showDialog(context: context, builder: (_) => SquareAlertDialog(
              text: "로그인하시면 즐겨찾는 카페를 설정하여 모아볼 수 있습니다. 로그인 페이지로 이동할까요?",
              negativeButtonText: "아니오",
              positiveButtonText: "네",
              onDismiss: () => Navigator.of(context).pop(),
              onNegativeButtonPress: () {},
              onPositiveButtonPress: () => GoRouter.of(context).goNamed(ScreenRoute.login)
            ));
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: globalState.user.favoriteCafes.where((e) => e.id == mapState.selectedCafe.id).isNotEmpty ? AppColor.secondary : AppColor.grey_300,
          elevation: 0,
          shape: const CircleBorder(),
          padding: AppPadding.padding_0
        ),
        child: const Icon(
          CupertinoIcons.heart,
          color: AppColor.white,
          size: 16,
        ),
      ),
    );
  }
}
