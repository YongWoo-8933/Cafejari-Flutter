import 'package:cafejari_flutter/ui/screen/map/component/bottom_sheet_floor.dart';
import 'package:cafejari_flutter/ui/screen/map/component/bottom_sheet_moreInfo.dart';
import 'package:cafejari_flutter/ui/screen/map/component/bottom_sheet_slider.dart';
import 'package:cafejari_flutter/ui/screen/map/component/bottom_sheet_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';

class MapBottomSheet extends ConsumerWidget {
  const MapBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapState mapState = ref.watch(mapViewModelProvider);

    return ListView(
      physics: mapState.bottomSheetController.isPanelOpen ? AlwaysScrollableScrollPhysics() : NeverScrollableScrollPhysics(),
      children: [
        Text("${mapState.bottomSheetController.isPanelOpen}"),
        BottomSheetTitle(),
        BottomSheetFloor(),
        BottomSheetSlider(),
        BottomSheetMoreInfo(),
        BottomSheetMoreInfo(),
        BottomSheetMoreInfo(),
      ],
    );
  }
}