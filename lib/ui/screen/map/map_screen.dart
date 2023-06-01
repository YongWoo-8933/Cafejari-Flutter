import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/screen/map/map_bottom_sheet.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';
import 'package:cafejari_flutter/ui/util/n_location.dart';
import 'package:cafejari_flutter/ui/viewmodel/map_view_model.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MapScreen extends ConsumerWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapState mapState = ref.watch(mapViewModelProvider);
    final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Text("카페 불러오기"),
        onPressed: () => ref.watch(mapViewModelProvider.notifier).refreshCafeInfos(),
      ),
      body: SlidingUpPanel(
        controller: mapState.bottomSheetController,
        body: Padding(
            padding: const EdgeInsets.only(bottom: 60.0),
            child: NaverMap(
              options: NaverMapViewOptions(
                  initialCameraPosition: NLocation.sinchon().cameraPosition,
                  liteModeEnable: true,
                  nightModeEnable: true,
                  indoorEnable: false,
                  symbolScale: 0.8,
                  tiltGesturesEnable: false,
                  consumeSymbolTapEvents: false,
                  scaleBarEnable: false,
                  indoorLevelPickerEnable: false,
                  locationButtonEnable: true),
              forceGesture: true,
              onMapReady: (controller) => mapViewModel.initMapController(controller),
              onMapTapped: (_, latLng) => mapState.bottomSheetController.close(),
              onSymbolTapped: (symbol) {},
              onCameraChange: (position, reason) {},
              onCameraIdle: () {},
            )),
        panel: const MapBottomSheet(),
        minHeight: 0,
        maxHeight: (MediaQuery.of(context).size.height - 60.0) * 0.95,
        snapPoint: 0.3,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.elliptical(10.0, 10.0), topRight: Radius.elliptical(10.0, 10.0)),
      ),
    );
  }
}
