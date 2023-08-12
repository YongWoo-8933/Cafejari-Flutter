
import 'package:cafejari_flutter/core/extension/double.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/viewmodel/map_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';

class BottomSheetSmallSlider extends ConsumerWidget {
  const BottomSheetSmallSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapState mapState = ref.watch(mapViewModelProvider);
    final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);
    final Size deviceSize = MediaQuery.of(context).size;

    double slider_Width = (deviceSize.width/2)-70;

    return Container(
      padding: AppPadding.padding_horizon_15,
      child: Column(
        children: [
          // Container(
          //   width: mapState.selectedCafeFloor.recentUpdates.isNotEmpty ? ((slider_Width+60/100)*(mapState.selectedCafeFloor.recentUpdates.last.occupancyRate*100)) : 0,
          //   alignment: Alignment.bottomRight,
          //   child: Text(mapState.selectedCafeFloor.recentUpdates.isNotEmpty
          //         ? "${((mapState.selectedCafeFloor.recentUpdates.last.occupancyRate)*100).floor()}%" : ""),
          // ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: slider_Width / 4,
                height: 10,
                color: AppColor.grey_200,
              ),
              Container(
                width: slider_Width / 4,
                height: 10,
                color: AppColor.grey_400,
              ),
              Container(
                width: slider_Width / 4,
                height: 10,
                color: AppColor.grey_500,
              ),
              Container(
                width: slider_Width / 4,
                height: 10,
                color: AppColor.grey_900,
              ),
            ],
          ),
          Container(
            width: slider_Width,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("한적", style: TextSize.textSize_grey_10),
                Text("만석", style: TextSize.textSize_grey_10)
              ],
            ),
          ),
          // SizedBox(height: 10),
        ],
      ),
    );
  }
}
