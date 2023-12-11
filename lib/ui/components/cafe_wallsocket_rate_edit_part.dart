import 'package:cafejari_flutter/core/extension/int.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/components/buttons/edit_apply_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/src/theme/slider_theme.dart';


class CafeWallSocketRateEditPart extends StatelessWidget {
  final List<({int floor, double rate})> wallSocketRates;
  final Function(int, double) onWallSocketRateUpdate;
  final bool isEdited;
  final VoidCallback onEditButtonClick;
  final double width;

  const CafeWallSocketRateEditPart({
    Key? key,
    required this.width,
    required this.wallSocketRates,
    required this.onWallSocketRateUpdate,
    required this.isEdited,
    required this.onEditButtonClick
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const horizontalPadding = 20.0;
    const sideTextWidth = 40.0;

    return Column(
      children: [
        Container(
          width: width,
          height: 320,
          decoration: BoxDecoration(
            color: AppColor.grey_100,
            borderRadius: BorderRadius.circular(24)
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: ListView.builder(
              itemCount: wallSocketRates.length,
              padding: const EdgeInsets.symmetric(vertical: 48, horizontal: horizontalPadding),
              itemBuilder: (BuildContext context, int index) {
                final wallSocketRate = wallSocketRates[index];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: sideTextWidth,
                      child: Text(
                        "${wallSocketRate.floor.toFloor()}층",
                        style: TextSize.textSize_bold_14,
                        textAlign: TextAlign.end,
                      ),
                    ),
                    SizedBox(
                      width: width - horizontalPadding * 2 - sideTextWidth * 2 - 10,
                      child: SfSliderTheme(
                        data: SfSliderThemeData().copyWith(
                          thumbRadius: 8,
                          thumbColor: AppColor.white,
                          tooltipBackgroundColor: AppColor.primary
                        ),
                        child: SfSlider(
                          min: 0.0,
                          max: 100.0,
                          value: wallSocketRates[index].rate * 100,
                          stepSize: 5.0,
                          showTicks: false,
                          tooltipTextFormatterCallback: (_, str) => "$str%",
                          enableTooltip: true,
                          activeColor: AppColor.primary,
                          thumbIcon: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.white
                            ),
                          ),
                          onChangeStart: (_) => HapticFeedback.lightImpact(),
                          onChangeEnd: (_) => HapticFeedback.lightImpact(),
                          onChanged: (dynamic value) => onWallSocketRateUpdate(index, value / 100)
                        )
                      ),
                    ),
                    SizedBox(
                      width: sideTextWidth,
                      child: Text(
                        "${(wallSocketRate.rate * 100).toInt()}%",
                        style: const TextStyle(
                          color: AppColor.secondary,
                          fontWeight: FontWeight.w700
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ]
                );
              },
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


