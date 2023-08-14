
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_secondary.dart';
import 'package:cafejari_flutter/ui/state/my_page_state/my_page_state.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:go_router/go_router.dart';

class MyPagePoint extends ConsumerWidget {
  const MyPagePoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyPageState profileState = ref.watch(myPageViewModelProvider);
    final deviceSize = MediaQuery.of(context).size;

    return Material(
      elevation: 0.5,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: deviceSize.width-60,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                GoRouter.of(context).goNamed(ScreenRoute.point);
              },
              child: Container(
                margin: AppPadding.padding_20,
                child: Column(
                  children: [
                    Text("포인트", style: TextSize.textSize_grey_14,),
                    Row(
                      children: [
                        Text("45,000", style: TextSize.textSize_bold_20),
                        Icon(CupertinoIcons.right_chevron, size: 16,),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: AppPadding.padding_20,
              child: ActionButtonSecondary(
                buttonWidth: (deviceSize.width-60)/2-40,
                buttonHeight: 45,
                title: "포인트SHOP",
                isClicked: true,
                icon: CupertinoIcons.shopping_cart,
                onPressed: () { GoRouter.of(context).goNamed(ScreenRoute.shop);},
              ),
            ),

          ],
        ),
      ),
    );
  }
}