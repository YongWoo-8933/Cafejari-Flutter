import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/components/buttons/edit_apply_button.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/state/cafe_info_modification_state/cafe_info_modification_state.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';
import 'package:cafejari_flutter/ui/util/zoom.dart';
import 'package:cafejari_flutter/ui/view_model/cafe_info_modification_view_model.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class CafeFloorPart extends ConsumerWidget {
  const CafeFloorPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CafeInfoModificationState state = ref.watch(cafeInfoModificationViewModelProvider);
    final CafeInfoModificationViewModel viewModel = ref.watch(cafeInfoModificationViewModelProvider.notifier);
    final MapState mapState = ref.watch(mapViewModelProvider);
    final double deviceWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: deviceWidth,
              height: 240,
              child: NaverMap(
                forceGesture: true,
                options: NaverMapViewOptions(
                  initialCameraPosition: NCameraPosition(target: mapState.selectedCafe.latLng, zoom: Zoom.large),
                  liteModeEnable: true,
                  nightModeEnable: true,
                  indoorEnable: false,
                  symbolScale: 0.8,
                  tiltGesturesEnable: false,
                  consumeSymbolTapEvents: false,
                  scaleBarEnable: false,
                  indoorLevelPickerEnable: false,
                  locationButtonEnable: false,
                  rotationGesturesEnable: false,
                ),
                onMapReady: (controller) => viewModel.initMapController(controller),
                onSymbolTapped: (symbol) {},
                onCameraChange: (position, reason) {},
                onCameraIdle: () {},
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "asset/image/4.0x/challenge_marker.png",
                  width: 48,
                  height: 58,
                ),
                const VerticalSpacer(58)
              ],
            )
          ],
        ),
        const VerticalSpacer(20),
        EditApplyButton(
            isApplied: state.isCoordinateEdited,
            width: 240,
            onPress: () => viewModel.setIsCoordinateEdited(!state.isCoordinateEdited)
        )
      ],
    );
  }
}