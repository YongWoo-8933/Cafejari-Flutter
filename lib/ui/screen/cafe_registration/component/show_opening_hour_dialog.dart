import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/state/request_state/request_state.dart';
import 'package:cafejari_flutter/ui/view_model/request_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

showOpeningHourDialog(BuildContext context) async {
  await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final RequestState requestState = ref.watch(requestViewModelProvider);
          final RequestViewModel requestViewModel = ref.watch(requestViewModelProvider.notifier);

          Widget openingTimeFrame({
            required String title,
            required String timeWithPeriod,
            required VoidCallback onTab
          }) {
            return GestureDetector(
              onTap: onTab,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: AppColor.grey_300,
                    width: 1,
                  ),
                ),
                width: 280,
                height: 48,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(title, style: TextSize.textSize_bold_16_w700),
                    Text(
                      timeWithPeriod,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            );
          }

          return AlertDialog(
            backgroundColor: AppColor.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
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
                    children: requestState.openingInfos.map((e) {
                      return Row(
                        children: [
                          _DayButton(
                            size: 36,
                            isClicked: requestState.selectedDaysOfWeek.contains(e.shortText),
                            text: e.shortText,
                            onPress: () {
                              List<String> newSelectedDays = List.from(requestState.selectedDaysOfWeek);
                              if (requestState.selectedDaysOfWeek.contains(e.shortText)) {
                                newSelectedDays.remove(e.shortText);
                              } else {
                                newSelectedDays.add(e.shortText);
                              }
                              requestViewModel.pickDay(newSelectedDays);
                            },
                          ),
                          HorizontalSpacer(requestState.openingInfos.last.shortText == e.shortText ? 0 : 4)
                        ],
                      );
                    }).toList()
                  ),
                  const VerticalSpacer(20),
                  openingTimeFrame(
                    title: "영업 시작",
                    timeWithPeriod: requestState.selectedOpeningInfo.getOpeningHourWithPeriod(),
                    onTab: () async {
                      requestViewModel.selectOpeningTime(
                        await showTimePicker(
                          initialEntryMode: TimePickerEntryMode.dialOnly,
                          initialTime: TimeOfDay(
                              hour: requestState.selectedOpeningInfo.openAt.hour,
                              minute: requestState.selectedOpeningInfo.openAt.minute
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
                    title: "영업 종료",
                    timeWithPeriod: requestState.selectedOpeningInfo.getClosingHourWithPeriod(),
                    onTab: () async {
                      requestViewModel.selectClosingTime(
                        await showTimePicker(
                          initialEntryMode: TimePickerEntryMode.dialOnly,
                          initialTime: TimeOfDay(
                              hour: requestState.selectedOpeningInfo.closeAt.hour,
                              minute: requestState.selectedOpeningInfo.closeAt.minute
                          ),
                          helpText: "영업 종료 시간 입력(AM/PM 주의)",
                          cancelText: "닫기",
                          confirmText: "적용",
                          context: context,
                        )
                      );
                    }
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
                      height: 48,
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
                        requestViewModel.saveSelectedOpeningHourInfo();
                        Navigator.of(context).pop();
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