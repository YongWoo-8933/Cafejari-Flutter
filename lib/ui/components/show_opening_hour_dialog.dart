import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/state/cafe_info_modification_state/cafe_info_modification_state.dart';
import 'package:cafejari_flutter/ui/state/cafe_registration_state/cafe_registration_state.dart';
import 'package:cafejari_flutter/ui/util/day_of_week_opening_info.dart';
import 'package:cafejari_flutter/ui/view_model/cafe_info_modification_view_model.dart';
import 'package:cafejari_flutter/ui/view_model/cafe_registration_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ShowOpeningHourDialogType { registration, modification }

showOpeningHourDialog({
  required BuildContext context,
  required ShowOpeningHourDialogType type
}) async {
  await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final CafeRegistrationState registrationState =  ref.watch(cafeRegistrationViewModelProvider);
          final CafeInfoModificationState modificationState =  ref.watch(cafeInfoModificationViewModelProvider);
          final CafeRegistrationViewModel registrationViewModel =  ref.watch(cafeRegistrationViewModelProvider.notifier);
          final CafeInfoModificationViewModel modificationViewModel =  ref.watch(cafeInfoModificationViewModelProvider.notifier);
          const double componentHeight = 48;

          final List<DayOfWeekOpeningInfo> openingInfos = type == ShowOpeningHourDialogType.registration ?
            registrationState.openingInfos : modificationState.openingInfos;
          final List<String> selectedDaysOfWeek = type == ShowOpeningHourDialogType.registration ?
            registrationState.selectedDaysOfWeek : modificationState.selectedDaysOfWeek;
          final DayOfWeekOpeningInfo selectedOpeningInfo = type == ShowOpeningHourDialogType.registration ?
            registrationState.selectedOpeningInfo : modificationState.selectedOpeningInfo;

          final Function(List<String>) pickDay = type == ShowOpeningHourDialogType.registration ?
            registrationViewModel.pickDay : modificationViewModel.pickDay;
          final Function(TimeOfDay? timeOfDay) selectOpeningTime = type == ShowOpeningHourDialogType.registration ?
            registrationViewModel.selectOpeningTime : modificationViewModel.selectOpeningTime;
          final Function(TimeOfDay? timeOfDay) selectClosingTime = type == ShowOpeningHourDialogType.registration ?
            registrationViewModel.selectClosingTime : modificationViewModel.selectClosingTime;
          final Function(bool) selectIsClose = type == ShowOpeningHourDialogType.registration ?
            registrationViewModel.selectIsClose : modificationViewModel.selectIsClose;
          final VoidCallback saveSelectedOpeningHourInfo = type == ShowOpeningHourDialogType.registration ?
            registrationViewModel.saveSelectedOpeningHourInfo : modificationViewModel.saveSelectedOpeningHourInfo;

          Widget openingTimeFrame({
            required bool isClosed,
            required String title,
            required String timeWithPeriod,
            required VoidCallback onTab
          }) {
            return GestureDetector(
              onTap: isClosed ? null : onTab,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: AppColor.grey_300,
                    width: 1,
                  ),
                ),
                width: 280,
                height: componentHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: isClosed ? AppColor.grey_300 : AppColor.primary
                      )
                    ),
                    Text(
                      timeWithPeriod,
                      style: TextStyle(
                        fontSize: 16,
                        color: isClosed ? AppColor.grey_300 : AppColor.primary
                      )
                    ),
                  ],
                ),
              ),
            );
          }

          return AlertDialog(
            backgroundColor: AppColor.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            insetPadding: AppPadding.padding_0,
            contentPadding: AppPadding.padding_10,
            buttonPadding:  AppPadding.padding_0,
            actionsAlignment: MainAxisAlignment.center,
            content: Container(
              alignment: Alignment.center,
              width: 300,
              height: 360,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              color: AppColor.white,
              child: Column(
                children: [
                  const Text("요일 및 시간을 선택해 주세요", style: TextSize.textSize_16),
                  const VerticalSpacer(40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: openingInfos.map((e) {
                      return Row(
                        children: [
                          _DayButton(
                            size: 36,
                            isClicked: selectedDaysOfWeek.contains(e.shortText),
                            text: e.shortText,
                            onPress: () {
                              List<String> newSelectedDays = List.from(selectedDaysOfWeek);
                              if (selectedDaysOfWeek.contains(e.shortText)) {
                                newSelectedDays.remove(e.shortText);
                              } else {
                                newSelectedDays.add(e.shortText);
                              }
                              pickDay(newSelectedDays);
                            },
                          ),
                          HorizontalSpacer(openingInfos.last.shortText == e.shortText ? 0 : 4)
                        ],
                      );
                    }).toList()
                  ),
                  const VerticalSpacer(20),
                  openingTimeFrame(
                    isClosed: selectedOpeningInfo.isClose,
                    title: "영업 시작",
                    timeWithPeriod: selectedOpeningInfo.getOpeningHourWithPeriod(),
                    onTab: () async {
                      selectOpeningTime(
                        await showTimePicker(
                          initialEntryMode: TimePickerEntryMode.dialOnly,
                          initialTime: TimeOfDay(
                            hour: selectedOpeningInfo.openAt.hour,
                            minute: selectedOpeningInfo.openAt.minute
                          ),
                          helpText: "영업 시작 시간 입력(AM/PM 주의)",
                          cancelText: "닫기",
                          confirmText: "적용",
                          context: context,
                        )
                      );
                    }
                  ),
                  const VerticalSpacer(16),
                  openingTimeFrame(
                    isClosed: selectedOpeningInfo.isClose,
                    title: "영업 종료",
                    timeWithPeriod: selectedOpeningInfo.getClosingHourWithPeriod(),
                    onTab: () async {
                      selectClosingTime(
                        await showTimePicker(
                          initialEntryMode: TimePickerEntryMode.dialOnly,
                          initialTime: TimeOfDay(
                            hour: selectedOpeningInfo.closeAt.hour,
                            minute: selectedOpeningInfo.closeAt.minute
                          ),
                          helpText: "영업 종료 시간 입력(AM/PM 주의)",
                          cancelText: "닫기",
                          confirmText: "적용",
                          context: context,
                        )
                      );
                    }
                  ),
                  const VerticalSpacer(16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () => selectIsClose(!selectedOpeningInfo.isClose),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(135, componentHeight),
                        backgroundColor: selectedOpeningInfo.isClose ? AppColor.secondary : AppColor.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(componentHeight / 2),
                          side: BorderSide(
                            color: selectedOpeningInfo.isClose ? AppColor.transparent : AppColor.grey_300,
                            width: 1,
                          )
                        )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.check_mark_circled,
                            color: selectedOpeningInfo.isClose ? AppColor.white : AppColor.grey_500,
                            size: 16,
                          ),
                          const HorizontalSpacer(8),
                          Text(
                            "정기휴무",
                            style: TextStyle(
                              color: selectedOpeningInfo.isClose ? AppColor.white : AppColor.grey_700,
                            )
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ),
            actions: [
              Padding(
                padding: AppPadding.padding_vertical_20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 135,
                      height: componentHeight,
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                            side: const BorderSide(color: AppColor.grey_400, width: 1),
                          ),
                          elevation: 0
                        ),
                        child: const FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('닫기', style: TextSize.textSize_16),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const HorizontalSpacer(10),
                    ActionButtonPrimary(
                      buttonWidth: 135,
                      buttonHeight: 48,
                      title: "저장",
                      onPressed: () {
                        saveSelectedOpeningHourInfo();
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              )
            ],
          );
        },
      );
    },
  );
}

class _DayButton extends StatelessWidget {
  final String text;
  final double size;
  final bool isClicked;
  final VoidCallback onPress;

  const _DayButton({
    super.key,
    required this.text,
    required this.size,
    required this.isClicked,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isClicked ? AppColor.secondary : AppColor.white,
            borderRadius: BorderRadius.circular(size / 2),
            border: Border.all(
              color: AppColor.secondary,
              width: 1,
            )
        ),
        width: size,
        height: size,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: isClicked ? AppColor.white : AppColor.secondary,
          ),
        ),
      ),
    );
  }
}