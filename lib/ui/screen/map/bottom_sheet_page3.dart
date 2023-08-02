import 'package:another_xlider/another_xlider.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_secondary.dart';
import 'package:cafejari_flutter/ui/components/slider.dart';
import 'package:cafejari_flutter/ui/screen/map/component/bottom_sheet_floorDeco.dart';
import 'package:cafejari_flutter/ui/viewmodel/map_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';

class BottomSheetPage3 extends ConsumerWidget {
  const BottomSheetPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapState mapState = ref.watch(mapViewModelProvider);
    final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);

    return Container(
      padding: AppPading.padding_30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("혼잡도 등록", style: TextSize.textSize_bold_20),
          Text("혼잡도를 등록하고 포인트 받아가세요", style: TextSize.textSize_grey_12),
          SizedBox(height: 30),
          BottomSheetFloorDeco(),
          SizedBox(height: 30),
          CustomSlider(
              value: mapState.updatedCrowded,
              onChanged: (double newValue) {
                mapViewModel.changeUpdatedCrowded(newValue);
              },
              sliderWidth_padding: 10
          ),
          SizedBox(height: 30),
          ActionButtonPrimary(buttonWidth: 210, buttonHeight: 40, title: "등록하기")
        ],
      ),
    );
  }
}