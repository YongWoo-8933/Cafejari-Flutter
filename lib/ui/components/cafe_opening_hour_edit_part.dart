import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/components/show_opening_hour_dialog.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/components/buttons/edit_apply_button.dart';
import 'package:cafejari_flutter/ui/util/day_of_week_opening_info.dart';
import 'package:flutter/material.dart';

class CafeOpeningHourEditPart extends StatelessWidget {
  final double width;
  final bool isEdited;
  final List<DayOfWeekOpeningInfo> openingInfos;
  final ShowOpeningHourDialogType showOpeningHourDialogType;
  final Function(List<String>) onPickDay;
  final VoidCallback onEditButtonClick;

  const CafeOpeningHourEditPart({
    Key? key,
    required this.width,
    required this.isEdited,
    required this.openingInfos,
    required this.onPickDay,
    required this.showOpeningHourDialogType,
    required this.onEditButtonClick
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const VerticalSpacer(10),
            _TimeEditButton(
              text: "모든 영업시간 수정",
              onPress: () {
                onPickDay(["월", "화", "수", "목", "금", "토", "일"]);
                showOpeningHourDialog(context: context, type: showOpeningHourDialogType);
              }
            ),
            const HorizontalSpacer(10),
            _TimeEditButton(
              text: "월~금 수정",
              onPress: () {
                onPickDay(["월", "화", "수", "목", "금"]);
                showOpeningHourDialog(context: context, type: showOpeningHourDialogType);
              }
            ),
            const HorizontalSpacer(10),
            _TimeEditButton(
              text: "토~일 수정",
              onPress: () {
                onPickDay(["토", "일"]);
                showOpeningHourDialog(context: context, type: showOpeningHourDialogType);
              }
            ),
          ],
        ),
        const VerticalSpacer(20),
        Container(
          width: width,
          decoration: BoxDecoration(color: AppColor.grey_100, borderRadius: BorderRadius.circular(24)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 30, left: 30, right: 10),
              child: Column(
                children: openingInfos.map((e) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 48,
                        child: Text(e.fullText),
                      ),
                      Row(
                        children: [
                          Text(e.getOpeningHourText()),
                          IconButton(
                            onPressed: () {
                              onPickDay([e.shortText]);
                              showOpeningHourDialog(context: context, type: showOpeningHourDialogType);
                            },
                            icon: const Icon(Icons.edit, color: AppColor.secondary, size: 20)
                          ),
                        ]
                      )
                    ],
                  );
                }).toList()
              )
            ),
          ),
        ),
        const VerticalSpacer(40),
        EditApplyButton(
          isApplied: isEdited,
          width: width,
          onPress: onEditButtonClick
        )
      ],
    );
  }
}

class _TimeEditButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;

  const _TimeEditButton({
    super.key,
    required this.text,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        alignment: Alignment.center,
        padding: AppPadding.padding_horizon_15,
        decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: AppColor.secondary,
              width: 1,
            )
        ),
        height: 48,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: AppColor.secondary,
          ),
        ),
      ),
    );
  }
}
