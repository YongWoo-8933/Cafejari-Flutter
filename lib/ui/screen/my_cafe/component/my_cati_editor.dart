import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/app_shadow.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/buttons/x_button.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/state/my_cafe_state/my_cafe_state.dart';
import 'package:cafejari_flutter/ui/view_model/my_cafe_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_core/src/theme/slider_theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';


final _isLoading = StateProvider<bool>((ref) => false);


class MyCATIEditor extends ConsumerWidget {
  const MyCATIEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyCafeViewModel myCafeViewModel = ref.watch(myCafeViewModelProvider.notifier);
    final MyCafeState myCafeState = ref.watch(myCafeViewModelProvider);
    const double sidePadding = 20;
    return Dialog(
      elevation: 0,
      backgroundColor: AppColor.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 30),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double sliderWidth = constraints.maxWidth - sidePadding * 2;
          return Container(
            padding: const EdgeInsets.all(sidePadding),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: XButton(
                    buttonSize: 28,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                const VerticalSpacer(10),
                SizedBox(
                  width: sliderWidth,
                  child: const Text(
                    "선호하는 카페의 스타일을 선택해보세요",
                    style: TextSize.textSize_bold_16,
                    textAlign: TextAlign.center,
                  ),
                ),
                const VerticalSpacer(8),
                SizedBox(
                  width: sliderWidth,
                  child: const Text(
                    "내가 설정한 CATI에 부합하는 카페를 추천해드려요!",
                    style: TextStyle(
                      color: AppColor.grey_600,
                      fontSize: 12
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const VerticalSpacer(40),
                CATISlider(
                  value: myCafeState.catiOpennessSliderValue,
                  width: sliderWidth,
                  onChange: (value) => myCafeViewModel.setCATIOpenness(value),
                  title: "공간의 개방감",
                  negativeValueText: "아늑함",
                  positiveValueText: "개방적임",
                  tooltip1stText: "매우 아늑함",
                  tooltip2ndText: "아늑함",
                  tooltip3rdText: "개방적임",
                  tooltip4thText: "매우 개방적임",
                ),
                const VerticalSpacer(10),
                CATISlider(
                  value: myCafeState.catiCoffeeSliderValue,
                  width: sliderWidth,
                  onChange: (value) => myCafeViewModel.setCATICoffee(value),
                  title: "주력 음료",
                  negativeValueText: "음료",
                  positiveValueText: "커피",
                  tooltip1stText: "음료가 매우 맛있음",
                  tooltip2ndText: "음료가 맛있음",
                  tooltip3rdText: "커피가 맛있음",
                  tooltip4thText: "커피가 매우 맛있음",
                ),
                const VerticalSpacer(10),
                CATISlider(
                  value: myCafeState.catiWorkspaceSliderValue,
                  width: sliderWidth,
                  onChange: (value) => myCafeViewModel.setCATIWorkspace(value),
                  title: "공간의 분위기",
                  negativeValueText: "감성카페",
                  positiveValueText: "업무공간",
                  tooltip1stText: "매우 감성적임",
                  tooltip2ndText: "감성적임",
                  tooltip3rdText: "업무하기 좋음",
                  tooltip4thText: "매우 업무하기 좋음",
                ),
                const VerticalSpacer(10),
                CATISlider(
                  value: myCafeState.catiAciditySliderValue,
                  width: sliderWidth,
                  onChange: (value) => myCafeViewModel.setCATIAcidity(value),
                  title: "커피맛(산미의 정도)",
                  negativeValueText: "고소한맛",
                  positiveValueText: "산미",
                  tooltip1stText: "씁쓸함",
                  tooltip2ndText: "고소함",
                  tooltip3rdText: "산미가 있음",
                  tooltip4thText: "산미가 강함",
                ),
                const VerticalSpacer(30),
                ActionButtonPrimary(
                  buttonWidth: sliderWidth,
                  buttonHeight: 48,
                  title: "CATI 등록",
                  isLoading: ref.watch(_isLoading),
                  onPressed: () async {
                    ref.watch(_isLoading.notifier).update((ref) => true);
                    await myCafeViewModel.updateMyCATI(context: context);
                    ref.watch(_isLoading.notifier).update((ref) => false);
                    if(context.mounted) Navigator.of(context).pop();
                  }
                )
              ],
            ),
          );
        }
      ),
    );
  }
}

class CATISlider extends StatelessWidget {
  final int value;
  final double width;
  final ValueChanged<int> onChange;
  final String title;
  final String negativeValueText;
  final String positiveValueText;
  final String tooltip1stText;
  final String tooltip2ndText;
  final String tooltip3rdText;
  final String tooltip4thText;

  const CATISlider({
    super.key,
    required this.value,
    required this.width,
    required this.onChange,
    required this.title,
    required this.negativeValueText,
    required this.positiveValueText,
    required this.tooltip1stText,
    required this.tooltip2ndText,
    required this.tooltip3rdText,
    required this.tooltip4thText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColor.background,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title, style: TextSize.textSize_bold_14),
          const VerticalSpacer(4),
          SfSliderTheme(
            data: SfSliderThemeData().copyWith(
              thumbRadius: 12,
              thumbColor: AppColor.white,
              tooltipBackgroundColor: AppColor.primary,
              activeTrackHeight: 4,
              inactiveTrackHeight: 4,
              tickOffset: const Offset(0, 0),
              tickSize: const Size(0.5, 5),
              activeTickColor: AppColor.grey_300,
              inactiveTickColor: AppColor.grey_300,
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
              min: -3,
              max: 3,
              value: value,
              stepSize: 2.0,
              interval: 2.0,
              showTicks: true,
              showLabels: true,
              labelFormatterCallback: (_, value) {
                switch(int.parse(value)) {
                  case -3: return negativeValueText;
                  case 3: return positiveValueText;
                  default: return "";
                }
              },
              edgeLabelPlacement: EdgeLabelPlacement.inside,
              enableTooltip: true,
              tooltipTextFormatterCallback: (_, value) {
                switch(int.parse(value)) {
                  case -3: return tooltip1stText;
                  case -1: return tooltip2ndText;
                  case 1: return tooltip3rdText;
                  case 3: return tooltip4thText;
                  default: return "";
                }
              },
              activeColor: AppColor.grey_400,
              inactiveColor: AppColor.grey_400,
              thumbIcon: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.white,
                  boxShadow: AppShadow.box
                ),
              ),
              onChangeStart: (_) => HapticFeedback.lightImpact(),
              onChangeEnd: (_) => HapticFeedback.lightImpact(),
              onChanged: (dynamic value) {
                HapticFeedback.lightImpact();
                onChange(value.toInt());
              }
            )
          ),
        ],
      ),
    );
  }
}
