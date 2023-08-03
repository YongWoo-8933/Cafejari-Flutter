import 'package:cafejari_flutter/core/extension/int.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
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

    double slider_Width = ((MediaQuery.of(context).size.width / 2)-60);

    return Container(
      padding: AppPadding.padding_horizon_10,
      child: Column(
        children: [
          Row(
            children: [
              //SizedBox(width: (slider_Width/100)*mapState.selectedCafe.crowded),
              Text("${mapState.selectedCafe.crowded}"),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: slider_Width / 4,
                height: 10,
                color: AppColor.grey_100,
              ),
              Container(
                width: slider_Width / 4,
                height: 10,
                color: AppColor.grey_300,
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
          SizedBox(height: 10),
          Row(
            children: [
              //SizedBox(width: (slider_Width/100)*mapState.selectedCafe.crowded),
              Transform.rotate(
                angle: 3.14,
                child: Image.asset(
                  mapState.selectedCafe.crowded.toCrowded().image,
                  width: 20,
                  height: 20,
              ),),

            ],
          ),
        ],
      ),
    );
  }
}
