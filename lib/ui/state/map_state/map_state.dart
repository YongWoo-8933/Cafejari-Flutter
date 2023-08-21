
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
      required final int currentPage,
      required final Cafes cafes,
      required final Cafe selectedCafe,
      required final CafeFloor selectedCafeFloor,
      required final NMarker? selectedMarker,
      required final NaverMapController? mapController,
      required final TextEditingController searchQueryController,
      required final Cafes searchPredictions,
      required final bool isSearchPageVisible,
      required final bool isSearchPageFadedIn,
      required final bool isBottomSheetPreviewOpened,
      required final bool isBottomSheetPreviewExpanded,
      required final bool isBottomSheetFullContentVisible,
      required final bool isRefreshButtonVisible}) = _MapState;

  factory MapState.empty() => MapState(
      bottomSheetController: PanelController(),
      bottomSheetOccupancyController: PanelController(),
      pageController: PageController(),
      currentPage: 0,
      cafes: [],
      selectedCafe: Cafe.empty(),
      selectedCafeFloor: CafeFloor.empty(),
      selectedMarker: null,
      mapController: null,
      searchQueryController: TextEditingController(),
      searchPredictions: [],
      isSearchPageVisible: false,
      isSearchPageFadedIn: false,
      isBottomSheetPreviewOpened: false,
      isBottomSheetPreviewExpanded: false,
      isBottomSheetFullContentVisible: false,
      isRefreshButtonVisible: false);
}
