import 'package:cafejari_flutter/ui/screen/map/bottom_sheet_page1.dart';
import 'package:cafejari_flutter/ui/screen/map/bottom_sheet_page2.dart';
import 'package:cafejari_flutter/ui/screen/map/bottom_sheet_page3.dart';
import 'package:cafejari_flutter/ui/screen/map/component/list_view_button.dart';
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
        onPressed: () => mapViewModel.refreshCafes(),
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
              return PageView(
                controller: mapState.pageController,
                physics: NeverScrollableScrollPhysics(),
                children: const [
                  BottomSheetPage1(),
                  BottomSheetPage2(),
                  BottomSheetPage3(),
                ]
              );
            },
            minHeight: 0,
            maxHeight: (MediaQuery.of(context).size.height - 60.0) * 0.95,
            snapPoint: mapState.pageController.initialPage==2 ? 0.5 : 0.3,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.elliptical(10.0, 10.0), topRight: Radius.elliptical(10.0, 10.0)),
            onPanelClosed: () => {
              mapViewModel.updateTopVisible(true),
              mapViewModel.updateTopImageVisible(false),
              mapState.pageController.jumpToPage(0)
            },
            onPanelSlide: (double slideOffset) {
              if (slideOffset <= 0.31) {
                ref.read(mapViewModelProvider.notifier).updateTopVisible(true);
                //mapState.pageController.jumpToPage(0);
              } else if(0.31 < slideOffset && slideOffset < 0.7){
                ref.read(mapViewModelProvider.notifier).updateTopVisible(false);
                ref.read(mapViewModelProvider.notifier).updateTopImageVisible(false);
                mapState.pageController.jumpToPage(1);
              }else{
                ref.read(mapViewModelProvider.notifier).updateTopImageVisible(true);
              }
            },
          ),
          Visibility(
            visible: mapState.topVisible,
            child: const Positioned(
                top: 70,
                left: 20,
                child: TopComponents()
            ),
          ),
          Visibility(
            visible: mapState.topImageVisible,
            child: Positioned(
                // child: Image.network(mapState.selectedCafeInfo.googlePlaceId)
                child: Image.network("")
            ),
          ),
          Visibility(
            visible: mapState.topVisible,
            child: Positioned(
                top: MediaQuery.of(context).size.height*0.55,
                left: MediaQuery.of(context).size.width*0.45,
                child: ListViewButton(
                    onPressed: () => {

                    }
                )
            ),
          )
        ],
      )
    );
  }
}
