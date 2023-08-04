
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_secondary.dart';
import 'package:cafejari_flutter/ui/state/my_page_state/my_page_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';

class MyPagePoint extends ConsumerWidget {
  const MyPagePoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyPageState profileState = ref.watch(myPageViewModelProvider);

    final deviceSize = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey, // 그림자 색상
            spreadRadius: 5, // 그림자 퍼짐 정도
            blurRadius: 10, // 그림자 흐림 정도
            offset: Offset(0, 3), // 그림자 위치 (x, y)
          )
        ]
      ),
      child: Row(
        children: [
          Container(
            child: Column(
              children: [
                Text("포인트", style: TextSize.textSize_grey_14,),
                Row(
                  children: [
                    Text("45,000", style: TextSize.textSize_bold_16),
                    Icon(CupertinoIcons.right_chevron)
                  ],
                )
              ],
            ),
          ),
          ActionButtonSecondary(
              buttonWidth: 60,
              buttonHeight: 20,
              title: "포인트SHOP",
              isClicked: true,
              icon: CupertinoIcons.shopping_cart,
          )
        ],
      ),
    );
  }
}