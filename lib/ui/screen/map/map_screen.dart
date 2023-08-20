
import 'dart:async';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/ui/screen/map/on_map.dart';
import 'package:cafejari_flutter/ui/util/n_location.dart';
import 'package:cafejari_flutter/ui/util/permission_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';
import 'package:cafejari_flutter/ui/viewmodel/map_view_model.dart';


class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  MapScreenState createState() => MapScreenState();
}


class MapScreenState extends ConsumerState<MapScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      locationPermission();
      ref.watch(mapViewModelProvider).pageController.addListener(() {
        final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);
        final page = ref.watch(mapViewModelProvider).pageController.page ?? 0;
        if (page.isNotNull && page == page.toInt()) {
          mapViewModel.setCurrentPage(page.toInt());
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final MapState mapState = ref.watch(mapViewModelProvider);
    final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);
    final double bottomNavBarHeight = ref.read(bottomSheetHeightProvider);
    final double bottomNavBarCornerRadius = ref.read(bottomSheetCornerRadiusProvider);

    return Padding(
      padding: EdgeInsets.only(bottom: bottomNavBarHeight - bottomNavBarCornerRadius),
      child: const Stack(
        children: [
          _NaverMap(),
          OnMap(),
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
        logoMargin: const EdgeInsets.symmetric(vertical: 25, horizontal: 12)
      ),
      forceGesture: true,
      onMapReady: (controller) => mapViewModel.initMapController(controller),
      onMapTapped: (_, latLng) => mapState.bottomSheetController.close(),
      onCameraIdle: () {
        if(!mapState.isRefreshButtonVisible) {
          mapViewModel.setRefreshButtonVisible(true);
          Future.delayed(
            const Duration(seconds: 4), () => mapViewModel.setRefreshButtonVisible(false));
        }
      },
    );
  }
}
