import 'package:cafejari_flutter/core/extension/int.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/screen/cafe_registration/component/cafe_registration_floor_picker.dart';
import 'package:cafejari_flutter/ui/state/request_state/request_state.dart';
import 'package:cafejari_flutter/ui/view_model/request_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';

class CafeRegistrationFloorPart extends ConsumerWidget {
  final double greyAreaWidth;

  const CafeRegistrationFloorPart({
    Key? key,
    required this.greyAreaWidth
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final RequestState requestState = ref.watch(requestViewModelProvider);
    final RequestViewModel requestViewModel = ref.watch(requestViewModelProvider.notifier);
    const int maximumFloorLimit = 63;
    const int minimumFloorLimit = -10;

    return Column(
      children: [
        const Text(
          "(필수) 최고층을 입력 해주세요",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14
          ),
        ),
        const VerticalSpacer(15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _CafeRegistrationFloorChangeButton(
              type: _CafeRegistrationFloorChangeButtonType.minus,
              onTab: () {
                if(requestState.selectedMaxFloor > requestState.selectedMinFloor) {
                  requestViewModel.selectMaxFloor(
                    requestState.selectedMaxFloor - (requestState.selectedMaxFloor == 1 ? 2 : 1)
                  );
                }
              },
            ),
            const HorizontalSpacer(20),
            _FloorInputFrame(
              onTab: () {
                showCupertinoDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return const CafeRegistrationFloorPicker(
                        maximumFloorLimit: maximumFloorLimit,
                        minimumFloorLimit: minimumFloorLimit,
                        type: CafeRegistrationFloorPickerType.max,
                      );
                    }
                );
              },
              floorText: requestState.selectedMaxFloor.toFloor(),
            ),
            const HorizontalSpacer(20),
            _CafeRegistrationFloorChangeButton(
              type: _CafeRegistrationFloorChangeButtonType.plus,
              onTab: () {
                if(requestState.selectedMaxFloor <= maximumFloorLimit) {
                  requestViewModel.selectMaxFloor(
                    requestState.selectedMaxFloor + (requestState.selectedMaxFloor == -1 ? 2 : 1)
                  );
                }
              },
            )
          ],
        ),
        const VerticalSpacer(40),
        const Text(
          "(필수) 최저층을 입력 해주세요",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14
          ),
        ),
        const VerticalSpacer(15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _CafeRegistrationFloorChangeButton(
              type: _CafeRegistrationFloorChangeButtonType.minus,
              onTab: () {
                if(requestState.selectedMinFloor >= minimumFloorLimit) {
                  requestViewModel.selectMinFloor(
                    requestState.selectedMinFloor - (requestState.selectedMinFloor == 1 ? 2 : 1)
                  );
                }
              },
            ),
            const HorizontalSpacer(20),
            _FloorInputFrame(
              onTab: () {
                showCupertinoDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return const CafeRegistrationFloorPicker(
                      maximumFloorLimit: maximumFloorLimit,
                      minimumFloorLimit: minimumFloorLimit,
                      type: CafeRegistrationFloorPickerType.min,
                    );
                  }
                );
              },
              floorText: requestState.selectedMinFloor.toFloor(),
            ),
            const HorizontalSpacer(20),
            _CafeRegistrationFloorChangeButton(
              type: _CafeRegistrationFloorChangeButtonType.plus,
              onTab: () {
                if(requestState.selectedMinFloor < requestState.selectedMaxFloor) {
                  requestViewModel.selectMinFloor(
                    requestState.selectedMinFloor + (requestState.selectedMinFloor == -1 ? 2 : 1)
                  );
                }
              },
            ),
          ],
        ),
        const VerticalSpacer(40),
        Container(
          decoration: BoxDecoration(
            color: AppColor.grey_100,
            borderRadius: BorderRadius.circular(30)
          ),
          width: greyAreaWidth,
          height: 48,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${requestState.selectedMinFloor.toFloor()}층 ~ ${requestState.selectedMaxFloor.toFloor()}층   ",
                style: TextSize.textSize_16
              ),
              Text(
                "총 ${calculateTotalFloor(maxFloor: requestState.selectedMaxFloor,
                    minFloor: requestState.selectedMinFloor)}개층 입니다",
                style: TextSize.textSize_bold_16
              ),
            ],
          ),
        )
      ],
    );
  }
}

int calculateTotalFloor({required int minFloor, required int maxFloor}) {
  if(minFloor * maxFloor > 0) {
    return maxFloor - minFloor + 1;
  } else if (minFloor * maxFloor < 0) {
    return maxFloor - minFloor;
  } else {
    return 0;
  }
}

enum _CafeRegistrationFloorChangeButtonType { plus, minus }

class _CafeRegistrationFloorChangeButton extends StatelessWidget {
  final _CafeRegistrationFloorChangeButtonType type;
  final VoidCallback onTab;

  const _CafeRegistrationFloorChangeButton({
    Key? key,
    required this.type,
    required this.onTab
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      height: 30,
      child: ElevatedButton(
        onPressed: onTab,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: AppColor.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Icon(
          type == _CafeRegistrationFloorChangeButtonType.plus ? CupertinoIcons.plus : CupertinoIcons.minus,
          color: AppColor.white,
          size: 15,
        ),
      ),
    );
  }
}

class _FloorInputFrame extends StatelessWidget {
  final VoidCallback onTab;
  final String floorText;

  const _FloorInputFrame({
    Key? key,
    required this.onTab,
    required this.floorText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
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
            Text("$floorText  ", style: TextSize.textSize_bold_16_w700),
            const Text("층",style: TextSize.textSize_16)
          ]
        ),
      ),
    );
  }
}

