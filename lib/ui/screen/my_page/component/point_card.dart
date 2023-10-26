import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/app_shadow.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_secondary.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PointCard extends ConsumerWidget {
  final double width;
  const PointCard({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalState globalState = ref.watch(globalViewModelProvider);
    const double height = 88;

    return Container(
      width: width,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: AppShadow.box
      ),
      child: Row(
        children: [
          Container(
              width: width / 2,
              height: height,
              color: AppColor.transparent,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("포인트", style: TextSize.textSize_grey_14),
                  const VerticalSpacer(4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${globalState.user.point}", style: TextSize.textSize_bold_20),
                      // const HorizontalSpacer(4),
                      // const Icon(CupertinoIcons.right_chevron, size: 16),
                    ],
                  ),
                ],
              )
          ),
          Container(
            width: width / 2,
            height: height,
            color: AppColor.transparent,
            alignment: Alignment.center,
            child: ActionButtonSecondary(
              buttonWidth: 128,
              buttonHeight: 45,
              title: "포인트SHOP",
              isClicked: true,
              icon: CupertinoIcons.shopping_cart,
              onPressed: () => GoRouter.of(context).goNamed(ScreenRoute.shop),
            ),
          )
        ],
      ),
    );
  }
}