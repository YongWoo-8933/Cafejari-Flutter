import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/screen/cafe_registration/component/registration_wallsocket/registration_wallsocket_slider.dart';
import 'package:cafejari_flutter/ui/state/request_state/request_state.dart';
import 'package:cafejari_flutter/ui/viewmodel/request_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';

class RegistrationPhoto extends ConsumerWidget {
  const RegistrationPhoto({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final RequestState requestState = ref.watch(requestViewModelProvider);

    return Container(
      padding: AppPadding.padding_horizon_30,
      decoration: BoxDecoration(
        color: AppColor.white,
      ),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColor.grey_400,
              borderRadius: BorderRadius.circular(10)
            ),
            height: 140,
            width: 90,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("사진첨부", style: TextSize.textSize_14),
                Icon(CupertinoIcons.plus, size: 14, weight: 400,)
              ],
            ),
          )
        ],
      ),
    );
  }
}


