
import 'dart:async';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/ui/screen/map/on_map.dart';
import 'package:cafejari_flutter/ui/screen/map/cafe_search_page.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/util/n_location.dart';
import 'package:cafejari_flutter/ui/util/zoom.dart';
import 'package:cafejari_flutter/ui/view_model/global_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';
import 'package:cafejari_flutter/ui/view_model/map_view_model.dart';
import 'package:geolocator/geolocator.dart';


class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  MapScreenState createState() => MapScreenState();
}


class MapScreenState extends ConsumerState<MapScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () async {
      final mapViewModel = ref.watch(mapViewModelProvider.notifier);
      final myCafeViewModel = ref.watch(myCafeViewModelProvider.notifier);
      final mapState = ref.watch(mapViewModelProvider);
      Position? location = await mapViewModel.globalViewModel.getFirstLocation();
      myCafeViewModel.initCafeRecommendationData(location: location);
      if (mapState.shareTempCameraPosition.isNull) {
        final NCameraPosition cameraPosition = location.isNotNull ?
        NCameraPosition(target: NLatLng(location!.latitude, location.longitude), zoom: Zoom.medium) :
        NLocation.sinchon().cameraPosition;
        if (mapState.mapController.isNull) {
          mapViewModel.setInitTempCameraPosition(cameraPosition);
        } else {
          mapState.mapController!.updateCamera(NCameraUpdate.fromCameraPosition(cameraPosition));
          await mapViewModel.refreshCafes(cameraPosition: cameraPosition);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double bottomNavBarHeight = ref.read(bottomNavBarHeightProvider);
    final double bottomNavBarCornerRadius = ref.read(bottomNavBarCornerRadiusProvider);

    return Padding(
      padding: EdgeInsets.only(bottom: bottomNavBarHeight - bottomNavBarCornerRadius),
      child: const Stack(
        children: [
          _NaverMap(),
          OnMap(),
          SearchPage()
        ],
      ),
    );
  }
}

class _NaverMap extends ConsumerWidget {
  const _NaverMap({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);
    final MapState mapState = ref.watch(mapViewModelProvider);
    return NaverMap(
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
        locationButtonEnable: true,
        maxZoom: 20.0,
        minZoom: 8.0,
        logoMargin: const EdgeInsets.symmetric(vertical: 25, horizontal: 12)
      ),
      forceGesture: true,
      onMapReady: (controller) {
        controller.setLocationTrackingMode(NLocationTrackingMode.noFollow);
        if (mapState.shareTempCameraPosition.isNotNull) {
          controller.updateCamera(NCameraUpdate.fromCameraPosition(mapState.shareTempCameraPosition!));
          mapViewModel.refreshCafes(cameraPosition: mapState.shareTempCameraPosition!);
          mapViewModel.setShareTempCameraPosition(null);
        } else if(mapState.initTempCameraPosition.isNotNull) {
          controller.updateCamera(NCameraUpdate.fromCameraPosition(mapState.initTempCameraPosition!));
          mapViewModel.refreshCafes(cameraPosition: mapState.initTempCameraPosition!);
          mapViewModel.setInitTempCameraPosition(null);
        }
        mapViewModel.initMapController(controller);
      },
      onMapTapped: (_, __) {
        mapViewModel.closeBottomSheetPreview();
        mapState.bottomSheetController.close();
        mapViewModel.clearSelectedCafeAndMarker();
      },
      onCameraIdle: () async {
        final cameraPosition = await mapState.mapController?.getCameraPosition();
        if(cameraPosition.isNotNull) {
          if(mapState.lastCameraLatLng.isNotNull) {
            final distance = mapViewModel.globalViewModel.getDistanceToMeter(cameraPosition!.target, mapState.lastCameraLatLng!);
            if(distance > 500 && !mapState.isCafeRefreshIndicatorVisible) {
              mapViewModel.setLastCameraLatLng(cameraPosition.target);
              mapViewModel.refreshCafes();
            }
          } else {
            mapViewModel.setLastCameraLatLng(cameraPosition!.target);
          }
        }
        if(!mapState.isRefreshButtonVisible) {
          mapViewModel.setRefreshButtonVisible(true);
          Future.delayed(
              const Duration(seconds: 4), () => mapViewModel.setRefreshButtonVisible(false));
        }
      },
    );
  }
}
