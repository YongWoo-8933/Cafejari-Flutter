import 'package:cafejari_flutter/core/extension/int.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/screen/cafe_registration/component/edit_apply_button.dart';
import 'package:cafejari_flutter/ui/state/request_state/request_state.dart';
import 'package:cafejari_flutter/ui/view_model/request_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/src/theme/slider_theme.dart';

class CafeRegistrationWallSocketPart extends ConsumerWidget {
  final double width;

  const CafeRegistrationWallSocketPart({
    Key? key,
    required this.width
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final RequestState requestState = ref.watch(requestViewModelProvider);
    final RequestViewModel requestViewModel = ref.watch(requestViewModelProvider.notifier);
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
              itemCount: requestState.wallSocketRates.length,
              padding: const EdgeInsets.symmetric(vertical: 48, horizontal: horizontalPadding),
              itemBuilder: (BuildContext context, int index) {
                final wallSocketRate = requestState.wallSocketRates[index];
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
                          value: requestState.wallSocketRates[index].rate * 100,
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
                          onChanged: (dynamic value) {
                            requestViewModel.updateWallSocketRate(index: index, rate: value / 100);
                          }
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
          isApplied: requestState.isWallSocketEdited,
          width: width,
          onPress: () => requestViewModel.setIsWallSocketEdited(!requestState.isWallSocketEdited)
        )
      ],
    );
  }
}


