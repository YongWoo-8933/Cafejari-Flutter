import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/core/extension/double.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/app_shadow.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';
import 'package:cafejari_flutter/ui/util/occupancy_level.dart';
import 'package:cafejari_flutter/ui/view_model/map_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/src/theme/slider_theme.dart';

class OccupancyUpdateSlider extends ConsumerWidget {
  final double width;

  const OccupancyUpdateSlider({super.key,
    required this.width
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapState mapState = ref.watch(mapViewModelProvider);
    final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);
    const double thumbWidth = 20;

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: width - thumbWidth,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            boxShadow: AppShadow.box
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Row(
              children: [
                Container(
                  width: (width - thumbWidth) / 4,
                  height: 10,
                  color: OccupancyLevel.zero().color,
                ),
                Container(
                  width: (width - thumbWidth) / 4,
                  height: 10,
                  color: OccupancyLevel.one().color,
                ),
                Container(
                  width: (width - thumbWidth) / 4,
                  height: 10,
                  color: OccupancyLevel.two().color,
                ),
                Container(
                  width: (width - thumbWidth) / 4,
                  height: 10,
                  color: OccupancyLevel.three().color,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: width,
          child: SfSliderTheme(
            data: SfSliderThemeData().copyWith(
              thumbRadius: thumbWidth,
              tooltipBackgroundColor: AppColor.primary,
              activeTrackHeight: 10,
              inactiveTrackHeight: 10
            ),
            child: SfSlider(
              min: 0.0,
              max: 100.0,
              value: mapState.occupancySliderValue,
              stepSize: 1.0,
              showTicks: false,
              tooltipTextFormatterCallback: (_, str) => "혼잡도 $str%",
              shouldAlwaysShowTooltip: true,
              enableTooltip: true,
              activeColor: AppColor.transparent,
              inactiveColor: AppColor.transparent,
              thumbIcon: Image.asset((mapState.occupancySliderValue/100).toOccupancyLevel().thumbImagePath),
              onChangeStart: (_) {
                mapViewModel.setOccupancyBottomSheetDraggable(false);
                HapticFeedback.lightImpact();
              },
              onChanged: (dynamic value) => mapViewModel.updateOccupancySliderValue(value),
              onChangeEnd: (_) {
                mapViewModel.setOccupancyBottomSheetDraggable(true);
                HapticFeedback.lightImpact();
              },
            ),
          ),
        )
      ],
    );
  }
}