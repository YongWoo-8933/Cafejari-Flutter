import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/app_shadow.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/buttons/x_button.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';
import 'package:cafejari_flutter/ui/view_model/map_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_core/src/theme/slider_theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

enum CATIDialogType { cafe, my }

final _hasOpennessSliderValue = StateProvider<int>((ref) => 0);
final _isCoffeeFocusedSliderValue  = StateProvider<int>((ref) => 0);
final _isWorkFriendlyValue  = StateProvider<int>((ref) => 0);
final _is4thSliderValue  = StateProvider<int>((ref) => 0);

showCATIDialog({
  required BuildContext context,
  required CATIDialogType type
}) async {
  await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final MapState mapState = ref.watch(mapViewModelProvider);
          final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);
          const double width = 320;
          const double padding = 20;

          return Dialog(
            elevation: 0,
            backgroundColor: AppColor.transparent,
            child: Container(
              padding: const EdgeInsets.all(padding),
              width: width,
              height: 650,
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: XButton(
                      buttonSize: 28,
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  const VerticalSpacer(10),
                  Text(
                    type == CATIDialogType.cafe ? "이 카페의 분위기를 선택해주세요" : "선호하는 카페의 스타일을 선택해주세요",
                    style: TextSize.textSize_bold_16
                  ),
                  const VerticalSpacer(30),
                  CATISlider(
                    value: ref.watch(_hasOpennessSliderValue),
                      width: width - padding * 2,
                    onChange: (value) => ref.watch(_hasOpennessSliderValue.notifier).update((state) => value),
                    title: "공간의 개방감",
                    negativeValueText: "아늑한",
                    positiveValueText: "개방적"
                  ),
                  const VerticalSpacer(10),
                  CATISlider(
                    value: ref.watch(_isCoffeeFocusedSliderValue),
                    width: width - padding * 2,
                    onChange: (value) => ref.watch(_isCoffeeFocusedSliderValue.notifier).update((state) => value),
                    title: "주력 식품",
                    negativeValueText: "디저트",
                    positiveValueText: "커피"
                  ),
                  const VerticalSpacer(10),
                  CATISlider(
                    value: ref.watch(_isWorkFriendlyValue),
                      width: width - padding * 2,
                    onChange: (value) => ref.watch(_isWorkFriendlyValue.notifier).update((state) => value),
                    title: "이용 목적",
                    negativeValueText: "감성/힐링",
                    positiveValueText: "공부/업무"
                  ),
                  const VerticalSpacer(10),
                  CATISlider(
                    value: ref.watch(_is4thSliderValue),
                      width: width - padding * 2,
                    onChange: (value) => ref.watch(_is4thSliderValue.notifier).update((state) => value),
                      title: "블라블라?",
                      negativeValueText: "럏곓",
                      positiveValueText: "뭏닭겱"
                  ),
                  const VerticalSpacer(30),
                  ActionButtonPrimary(
                    buttonWidth: width - padding * 2,
                    buttonHeight: 48,
                    title: "CARI 등록",
                    onPressed: () => {}
                  )
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

class CATISlider extends StatelessWidget {
  final int value;
  final double width;
  final ValueChanged<int> onChange;
  final String title;
  final String negativeValueText;
  final String positiveValueText;

  const CATISlider({
    super.key,
    required this.value,
    required this.width,
    required this.onChange,
    required this.title,
    required this.negativeValueText,
    required this.positiveValueText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColor.background,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title, style: TextSize.textSize_bold_14),
          SfSliderTheme(
            data: SfSliderThemeData().copyWith(
              thumbRadius: 12,
              thumbColor: AppColor.white,
              tooltipBackgroundColor: AppColor.primary,
              activeTrackHeight: 4,
              inactiveTrackHeight: 4,
              inactiveLabelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: AppColor.primary
              ),
              activeLabelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: AppColor.primary
              )
            ),
            child: SfSlider(
              min: -2,
              max: 2,
              value: value,
              stepSize: 1.0,
              interval: 2.0,
              showTicks: false,
              showLabels: true,
              labelFormatterCallback: (_, value) {
                switch(int.parse(value)) {
                  case -2: return negativeValueText;
                  case 2: return positiveValueText;
                  default: return "";
                }
              },
              edgeLabelPlacement: EdgeLabelPlacement.inside,
              enableTooltip: true,
              tooltipTextFormatterCallback: (_, value) {
                switch(int.parse(value).abs()) {
                  case 0: return "보통";
                  case 1: return "약간";
                  case 2: return "매우";
                  default: return "";
                }
              },
              activeColor: AppColor.grey_500,
              inactiveColor: AppColor.grey_500,
              thumbIcon: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.white,
                  boxShadow: AppShadow.box
                ),
              ),
              onChanged: (dynamic value) => onChange(value.toInt())
            )
          ),
        ],
      ),
    );
  }
}
