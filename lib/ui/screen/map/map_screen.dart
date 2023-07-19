import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/screen/map/component/bottom_sheet_floor.dart';
import 'package:cafejari_flutter/ui/screen/map/component/bottom_sheet_moreInfo.dart';
import 'package:cafejari_flutter/ui/screen/map/component/bottom_sheet_slider.dart';
import 'package:cafejari_flutter/ui/screen/map/component/bottom_sheet_title.dart';
import 'package:cafejari_flutter/ui/screen/map/component/top_components.dart';
import 'package:cafejari_flutter/ui/util/permission_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
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
    locationPermission();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Text("카페 불러오기"),
        onPressed: () => ref.watch(mapViewModelProvider.notifier).refreshCafeInfos(),
      ),
      body: Stack(
        children: [
          SlidingUpPanel(
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
                    locationButtonEnable: true,),
                  forceGesture: true,
                  onMapReady: (controller) => mapViewModel.initMapController(controller),
                  onMapTapped: (_, latLng) => mapState.bottomSheetController.close(),
                  onSymbolTapped: (symbol) {},
                  onCameraChange: (position, reason) {},
                  onCameraIdle: () {},
                )),
            panelBuilder: (ScrollController sc) {
              return ListView(
                padding: EdgeInsets.all(15),
                controller: sc,
                children: const [
                  BottomSheetTitle(),
                  BottomSheetFloor(),
                  BottomSheetSlider(),
                  BottomSheetMoreInfo(),
                ],
              );
            },
            minHeight: 0,
            maxHeight: (MediaQuery.of(context).size.height - 60.0) * 0.95,
            snapPoint: 0.3,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.elliptical(10.0, 10.0), topRight: Radius.elliptical(10.0, 10.0)),
            onPanelOpened: () => mapViewModel.updateTopVisible(false),
            onPanelClosed: () => mapViewModel.updateTopVisible(true),
          ),
          Visibility(
            visible: mapState.topVisible,
            child: const Positioned(
                top: 70,
                left: 20,
                child: TopComponents()
            ),
          )
        ],
      )
    );
  }
}
