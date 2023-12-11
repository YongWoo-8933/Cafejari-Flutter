import 'dart:async';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/ui/screen/map/on_map.dart';
import 'package:cafejari_flutter/ui/screen/map/cafe_search_page.dart';
import 'package:cafejari_flutter/ui/util/n_location.dart';
import 'package:cafejari_flutter/ui/util/zoom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';
import 'package:cafejari_flutter/ui/view_model/map_view_model.dart';
import 'package:geolocator/geolocator.dart';


final _mapController = StateProvider<NaverMapController?>((ref) => null);


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
      Position? location = await ref.watch(mapViewModelProvider.notifier).globalViewModel.getFirstLocation();
      ref.watch(myCafeViewModelProvider.notifier).initCafeRecommendationData(location: location);
      if (ref.watch(mapViewModelProvider).shareTempCameraPosition.isNull) {
        final NCameraPosition cameraPosition = location.isNotNull ?
        NCameraPosition(target: NLatLng(location!.latitude, location.longitude), zoom: Zoom.medium) :
        NLocation.sinchon().cameraPosition;
        if (ref.watch(mapViewModelProvider).mapController.isNull) {
          ref.watch(mapViewModelProvider.notifier).setInitTempCameraPosition(cameraPosition);
        } else {
          ref.watch(mapViewModelProvider).mapController!.updateCamera(NCameraUpdate.fromCameraPosition(cameraPosition));
          await ref.watch(mapViewModelProvider.notifier).refreshCafes(cameraPosition: cameraPosition);
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
    // map controller를 놓칠 경우 따로 저장해둔 애를 전달해줌
    if(mapState.mapController.isNull && ref.watch(_mapController).isNotNull) {
      Future.delayed(Duration.zero, () {
        final mapController = ref.watch(_mapController)!;
        mapViewModel.initMapController(mapController);
      });
    }

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
        final MapState mapState = ref.watch(mapViewModelProvider);
        final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);
        controller.setLocationTrackingMode(NLocationTrackingMode.noFollow);
        mapViewModel.initMapController(controller);
        ref.watch(_mapController.notifier).update((state) => controller);
        if (mapState.shareTempCameraPosition.isNotNull) {
          controller.updateCamera(NCameraUpdate.fromCameraPosition(mapState.shareTempCameraPosition!));
          mapViewModel.refreshCafes(cameraPosition: mapState.shareTempCameraPosition!);
          mapViewModel.setShareTempCameraPosition(null);
        } else if(mapState.initTempCameraPosition.isNotNull) {
          controller.updateCamera(NCameraUpdate.fromCameraPosition(mapState.initTempCameraPosition!));
          mapViewModel.refreshCafes(cameraPosition: mapState.initTempCameraPosition!);
          mapViewModel.setInitTempCameraPosition(null);
        }
      },
      onMapTapped: (_, __) {
        final MapState mapState = ref.watch(mapViewModelProvider);
        final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);
        mapViewModel.closeBottomSheetPreview();
        mapState.bottomSheetController.close();
        mapViewModel.clearSelectedCafeAndMarker();
      },
      onCameraIdle: () async {
        final MapState mapState = ref.watch(mapViewModelProvider);
        final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);
        final cameraPosition = await mapState.mapController?.getCameraPosition();
        if(cameraPosition.isNotNull) {
          if(mapState.lastCameraLatLng.isNotNull) {
            final distance = mapViewModel.globalViewModel.getDistanceToMeter(cameraPosition!.target, mapState.lastCameraLatLng!);
            if(distance > 700 && !mapState.isCafeRefreshIndicatorVisible) {
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
