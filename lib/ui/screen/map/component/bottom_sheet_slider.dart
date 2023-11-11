import 'package:cafejari_flutter/core/extension/double.dart';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/util/occupancy_level.dart';
import 'package:cafejari_flutter/ui/view_model/map_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';

class BottomSheetSlider extends ConsumerWidget {
  final double width;

  const BottomSheetSlider({super.key, required this.width});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapState mapState = ref.watch(mapViewModelProvider);
    final double occupancyRate = mapState.selectedCafeFloor.recentUpdates.firstOrNull?.occupancyRate ??
      mapState.selectedCafeFloor.occupancyRatePrediction ?? 0.0;
    String occupancyRateDescription = "";
    if(mapState.selectedCafeFloor.recentUpdates.isNotEmpty) {
      final minute = mapState.selectedCafeFloor.recentUpdates.first.update.difference(DateTime.now()).inMinutes.abs();
      occupancyRateDescription = minute > 60 ? "1시간전" : "$minute분전";
    } else {
      occupancyRateDescription = "*예상";
    }
    const double componentWidth = 40;

    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // % 표시
          Row(
            children: [
              HorizontalSpacer((width - componentWidth) * occupancyRate),
              SizedBox(
                width: componentWidth,
                child: Text(
                  " ${(occupancyRate * 100).toInt()}%",
                  style: TextSize.textSize_bold_12,
                  textAlign: TextAlign.center,
                )
              ),
            ]
          ),
          const VerticalSpacer(10),
          // 바
          Container(
            alignment: Alignment.centerLeft,
            color: AppColor.secondary,
            height: 10,
            margin: const EdgeInsets.symmetric(horizontal: componentWidth / 2),
            child: Row(
              children: [
                Container(
                  width: (width - componentWidth) / 4,
                  height: 10,
                  color: OccupancyLevel.zero().color,
                ),
                Container(
                  width: (width - componentWidth) / 4,
                  height: 10,
                  color: OccupancyLevel.one().color,
                ),
                Container(
                  width: (width - componentWidth) / 4,
                  height: 10,
                  color: OccupancyLevel.two().color,
                ),
                Container(
                  width: (width - componentWidth) / 4,
                  height: 10,
                  color: OccupancyLevel.three().color,
                )
              ]
            ),
          ),
          const VerticalSpacer(5),
          // 설명 + 핀
          Stack(
            children: [
              // 설명
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: componentWidth,
                    child: Text(
                      OccupancyLevel.zero().stringValue,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColor.grey_500,
                        fontSize: 10
                      ),
                    ),
                  ),
                  SizedBox(
                    width: componentWidth,
                    child: Text(
                      OccupancyLevel.three().stringValue,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColor.grey_500,
                        fontSize: 10
                      ),
                    ),
                  ),
                ]
              ),
              // 핀
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    HorizontalSpacer((width - componentWidth) * occupancyRate),
                    Column(
                      children: [
                        Image.asset(
                          occupancyRate.toOccupancyLevel().pinImagePath,
                          width: componentWidth,
                        ),
                        Text(
                          occupancyRateDescription,
                          style: TextStyle(
                            color: AppColor.secondary.withOpacity(0.75),
                            fontSize: 10
                          ),
                        )
                      ],
                    ),
                  ]
                ),
              ),
            ]
          ),
        ]
      ),
    );
  }
}
