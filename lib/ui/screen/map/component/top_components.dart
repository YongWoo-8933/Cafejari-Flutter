
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/components/buttons/coffee_cup_button.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class TopComponents extends ConsumerWidget {
  const TopComponents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    return Container(
      width: MediaQuery.of(context).size.width-40,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: AppColor.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // 수직, 수평 이동 값
                  )
                ]
              ),
              padding: AppPadding.padding_horizon_10,
              child: const Row(
                children: [
                  Center(
                    child: Icon(CupertinoIcons.search),
                  )
                ],
              ),
            )
          ),
          const SizedBox(width: 10),
          CoffeeCupButton(isAlert: true, buttonSize: 40, onPressed: () {GoRouter.of(context).goNamed(ScreenRoute.myCafe);})
        ],
      ),

    );
  }
}