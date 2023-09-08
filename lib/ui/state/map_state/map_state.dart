
import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

part 'map_state.freezed.dart';

@freezed
class MapState with _$MapState {
  factory MapState(
      {required final PanelController bottomSheetController,
      required final PanelController bottomSheetOccupancyController,
      required final PageController pageController,
      required final int currentCafeImagePage,
      required final Cafes cafes,
      required final Locations locations,
      required final String? randomCafeImageUrl,
      required final Cafe selectedCafe,
      required final CafeFloor selectedCafeFloor,
      required final NMarker? selectedMarker,
      required final NaverMapController? mapController,
      required final NCameraPosition? initTempCameraPosition,
      required final NCameraPosition? shareTempCameraPosition,
      required final TextEditingController searchQueryController,
      required final Cafes searchPredictions,
      required final double occupancySliderValue,
      required final bool isSearchPageVisible,
      required final bool isSearchPageFadedIn,
      required final bool isBottomSheetPreviewOpened,
      required final bool isBottomSheetPreviewExpanded,
      required final bool isBottomSheetFullContentVisible,
      required final bool isOccupancyBottomSheetDraggable,
      required final bool isRefreshButtonVisible}) = _MapState;

  factory MapState.empty() => MapState(
      bottomSheetController: PanelController(),
      bottomSheetOccupancyController: PanelController(),
      pageController: PageController(),
      currentCafeImagePage: 0,
      cafes: [],
      locations: [],
      randomCafeImageUrl: null,
      selectedCafe: Cafe.empty(),
      selectedCafeFloor: CafeFloor.empty(),
      selectedMarker: null,
      mapController: null,
      initTempCameraPosition: null,
      shareTempCameraPosition: null,
      searchQueryController: TextEditingController(),
      searchPredictions: [],
      occupancySliderValue: 0.0,
      isSearchPageVisible: false,
      isSearchPageFadedIn: false,
      isBottomSheetPreviewOpened: false,
      isBottomSheetPreviewExpanded: false,
      isBottomSheetFullContentVisible: false,
      isOccupancyBottomSheetDraggable: true,
      isRefreshButtonVisible: false);
}
