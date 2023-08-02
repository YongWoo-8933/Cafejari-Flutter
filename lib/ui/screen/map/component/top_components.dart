
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
              child: const Row(
                children: [
                  Center(
                    child: Icon(CupertinoIcons.search),
                  )
                ],
              ),
              padding: AppPading.padding_horizon_10,
            )
          ),
          SizedBox(width: 10,),
          Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.black
            ),
            child: const Icon(Icons.ac_unit, color: AppColor.white),
          )
        ],
      ),

    );
  }
}