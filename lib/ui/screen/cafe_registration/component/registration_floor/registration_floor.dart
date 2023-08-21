import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/screen/cafe_registration/component/registration_floor/registration_floor_chage_button.dart';
import 'package:cafejari_flutter/ui/screen/cafe_registration/component/registration_floor/registration_floor_picker.dart';
import 'package:cafejari_flutter/ui/state/request_state/request_state.dart';
import 'package:cafejari_flutter/ui/viewmodel/request_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';

class RegistrationFloor extends ConsumerWidget {

  const RegistrationFloor({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final RequestState requestState = ref.watch(requestViewModelProvider);
    final RequestViewModel requestViewModel = ref.watch(requestViewModelProvider.notifier);
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white
      ),
      height: 320,
      child: Column(
        children: [
          Text("최고총 몇층인가요?"),
          VerticalSpacer(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RegistrationFloorChageButton(plus: false, maxOrMin: true),
              HorizontalSpacer(20),
              GestureDetector(
                onTap:  () => showCupertinoPicker(context, requestState, requestViewModel, true),
                child: Container(
                  alignment: Alignment.center,
                  width: 88,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      width: 1,
                      color: AppColor.grey_400
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Text("${requestState.maxFloor[requestState.maxFloorIndex]}  ", style: TextSize.textSize_bold_16_w700),
                    Text("층",style: TextSize.textSize_16)
                  ]),
                ),
              ),
              HorizontalSpacer(20),
              RegistrationFloorChageButton(plus: true, maxOrMin: true),
            ],
          ),
          VerticalSpacer(30),
          Text("최저층은 몇층인가요?"),
          VerticalSpacer(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RegistrationFloorChageButton(plus: false,maxOrMin: false),
              HorizontalSpacer(20),
              GestureDetector(
                onTap:  () => showCupertinoPicker(context, requestState, requestViewModel, false),
                child: Container(
                  alignment: Alignment.center,
                  width: 88,
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                          width: 1,
                          color: AppColor.grey_400
                      )
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${requestState.minFloor[requestState.minFloorIndex]}  ", style: TextSize.textSize_bold_16_w700),
                        Text("층",style: TextSize.textSize_16)
                      ]),
                ),
              ),
              HorizontalSpacer(20),
              RegistrationFloorChageButton(plus: true, maxOrMin: false),
            ],
          ),
          VerticalSpacer(30),
          Container(
            decoration: BoxDecoration(
              color: AppColor.grey_200,
              borderRadius: BorderRadius.circular(30)
            ),
            width: 240,
            height: 35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${requestState.minFloor[requestState.minFloorIndex]} ~ ${requestState.maxFloor[requestState.maxFloorIndex]} 층  ", style:  TextSize.textSize_bold_16_w400),
                Text("총 ${requestState.maxFloorIndex-requestState.minFloorIndex}개층 입니다", style:  TextSize.textSize_bold_16_w700),
              ],
            ),
          )
        ],
      ),
    );
  }

}

