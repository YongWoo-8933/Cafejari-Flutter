
import 'package:cafejari_flutter/core/extension/double.dart';
import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/ui/app_config/duration.dart';
import 'package:cafejari_flutter/ui/components/custom_snack_bar.dart';
import 'package:cafejari_flutter/ui/util/occupancy_level.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/domain/use_case/cafe_use_case.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';
import 'package:cafejari_flutter/ui/util/zoom.dart';
import 'package:cafejari_flutter/ui/view_model/global_view_model.dart';

class MapViewModel extends StateNotifier<MapState> {
  final CafeUseCase _mapUseCase;
  final GlobalViewModel globalViewModel;

  MapViewModel({required CafeUseCase mapUseCase, required this.globalViewModel})
      : _mapUseCase = mapUseCase, super(MapState.empty().copyWith());

  refreshCafes({required NCameraPosition cameraPosition}) async {
    try {
      final Cafes newCafes = await _mapUseCase.getMapCafes(cameraPosition: cameraPosition);
      Set<NMarker> resSet = {};
      for (var cafe in newCafes) {
        var marker = NMarker(
            id: cafe.id.toString(),
            position: cafe.latLng,
            icon: cafe.recentUpdatedOccupancyRate.toOccupancyLevel().nMarker,
            size: cafe.recentUpdatedOccupancyRate.toOccupancyLevel().markerSize);
        marker.setZIndex(1);
        marker.setOnTapListener((tappedMarker) async {
          if (state.selectedMarker.isNotNull) {
            state.selectedMarker?.setSize(cafe.recentUpdatedOccupancyRate.toOccupancyLevel().markerSize);
            state.selectedMarker?.setZIndex(1);
          }
          tappedMarker.setCaptionOffset(1.0);
          tappedMarker.setSize(cafe.recentUpdatedOccupancyRate.toOccupancyLevel().markerSize * 1.25);
          tappedMarker.setZIndex(3);
          tappedMarker.setCaptionAligns([NAlign.top]);
          tappedMarker.setCaptionOffset(4.0);
          state = state.copyWith(
            selectedCafe: cafe,
            selectedMarker: tappedMarker,
            selectedCafeFloor: cafe.recentUpdatedFloor.isNull ? cafe.cafeFloors.first :
              cafe.cafeFloors.firstWhere((e) => e.floor == cafe.recentUpdatedFloor)
          );
          state.mapController?.updateCamera(
            NCameraUpdate.scrollAndZoomTo(target: cafe.latLng, zoom: Zoom.large));
          openBottomSheetPreview();
        });
        resSet.add(marker);
      }
      await state.mapController?.clearOverlays();
      await state.mapController?.addOverlayAll(resSet);

      state = state.copyWith(cafes: newCafes);
    } on ErrorWithMessage catch(e) {
      globalViewModel.showSnackBar(content: e.message, type: SnackBarType.error);
    }
  }

  searchCafe() async {
    try {
      state = state.copyWith(
          searchPredictions: await _mapUseCase.getSearchCafes(query: state.searchQueryController.text));
    } on ErrorWithMessage catch (e) {
      globalViewModel.showSnackBar(content: e.message, type: SnackBarType.error);
    }
  }

  emptySearchPredictions() => state = state.copyWith(searchPredictions: []);

  openBottomSheetPreview() {
    state = state.copyWith(isBottomSheetPreviewOpened: true, isBottomSheetPreviewExpanded: true);
  }

  closeBottomSheetPreview() async {
    state = state.copyWith(isBottomSheetPreviewExpanded: false);
    await Future.delayed(AppDuration.animationDefault, () {
      state = state.copyWith(isBottomSheetPreviewOpened: false);
    });
  }

  initMapController(NaverMapController mapController) {
    state = state.copyWith(mapController: mapController);
  }

  selectedCafe(Cafe changedSelectedCafe){
    state = state.copyWith(selectedCafe: changedSelectedCafe);
  }

  selectedCafeFloor(CafeFloor changedSelectedCafeFloor){
    state = state.copyWith(selectedCafeFloor: changedSelectedCafeFloor);
  }

  changeCurrentPage(PageController changedCurrentPage){
    state = state.copyWith(pageController: changedCurrentPage);
  }

  setRefreshButtonVisible(bool visible) => state = state.copyWith(isRefreshButtonVisible: visible);

  setBottomSheetFullContentVisible(bool visible) => state = state.copyWith(isBottomSheetFullContentVisible: visible);

  setCurrentPage(int page) => state = state.copyWith(currentPage: page);

  openSearchPage() {
    state = state.copyWith(isSearchPageVisible: true, isSearchPageFadedIn: true);
  }

  closeSearchPage() async {
    state = state.copyWith(isSearchPageFadedIn: false);
    state.searchQueryController.text = "";
    emptySearchPredictions();
    await Future.delayed(AppDuration.animationDefault, () {
      state = state.copyWith(isSearchPageVisible: false);
    });
  }
}