import 'dart:ui';

import 'package:cafejari_flutter/core/extension/double.dart';
import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/domain/use_case/cafe_use_case.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';
import 'package:cafejari_flutter/ui/util/n_location.dart';
import 'package:cafejari_flutter/ui/util/zoom.dart';
import 'package:cafejari_flutter/ui/viewmodel/global_view_model.dart';

class MapViewModel extends StateNotifier<MapState> {
  final CafeUseCase _mapUseCase;
  final GlobalViewModel globalViewModel;

  MapViewModel({required CafeUseCase mapUseCase, required this.globalViewModel})
      : _mapUseCase = mapUseCase, super(MapState.empty());

  refreshCafes() async {
    try {
      final Cafes newCafes = await _mapUseCase.getMapCafes(
          cameraPosition:
              await state.mapController?.getCameraPosition() ?? NLocation.sinchon().cameraPosition);
      Set<NMarker> resSet = {};
      for (var cafe in newCafes) {
        var marker = NMarker(
            id: cafe.id.toString(),
            position: cafe.latLng,
            icon: cafe.recentUpdatedOccupancyRate.toOccupancyLevel().markerImage,
            size: const Size(33, 46));
        marker.setZIndex(1);
        marker.setOnTapListener((tappedMarker) async {
          if (state.selectedMarker.isNotNull) {
            state.selectedMarker?.setSize(const Size(33, 46));
            state.selectedMarker?.setZIndex(1);
            state.selectedMarker?.setCaption(const NOverlayCaption(text: ""));
            state.selectedMarker?.setSubCaption(const NOverlayCaption(text: ""));
          }
          tappedMarker.setCaptionOffset(1.0);
          tappedMarker.setSize(const Size(43, 50));
          tappedMarker.setZIndex(3);
          tappedMarker.setCaption(NOverlayCaption(text: cafe.name, textSize: 16.0));
          tappedMarker.setSubCaption(NOverlayCaption(
              text: cafe.recentUpdatedOccupancyRate.toOccupancyLevel().stringValue,
              textSize: 14.0,
              color: cafe.recentUpdatedOccupancyRate.toOccupancyLevel().complementaryColor,
              haloColor: cafe.recentUpdatedOccupancyRate.toOccupancyLevel().color));
          tappedMarker.setCaptionAligns([NAlign.top]);
          tappedMarker.setCaptionOffset(4.0);

          state = state.copyWith(
              selectedCafe: cafe,
              selectedMarker: tappedMarker,
              selectedCafeFloor: cafe.cafeFloors.first);
          state.mapController?.updateCamera(
              NCameraUpdate.scrollAndZoomTo(target: cafe.latLng, zoom: Zoom.large));
          await state.bottomSheetController.animatePanelToSnapPoint();
        });
        resSet.add(marker);
      }

      await state.mapController?.clearOverlays();
      await state.mapController?.addOverlayAll(resSet);

      state = state.copyWith(cafes: newCafes);
    } on RefreshTokenExpired {
      globalViewModel.logout();
    } on ErrorWithMessage {
      // 에러 메시지 출력
    }
  }

  initMapController(NaverMapController mapController) {
    state = state.copyWith(mapController: mapController);
  }

  changeSelectedCafe(Cafe changedSelectedCafe){
    state = state.copyWith(selectedCafe: changedSelectedCafe);
  }

  changeSelectedCafeFloor(CafeFloor changedSelectedCafeFloor){
    state = state.copyWith(selectedCafeFloor: changedSelectedCafeFloor);
  }

  changeUpdatedCrowded(double changedUpdatedCrowded){
    state = state.copyWith(updatedCrowded: changedUpdatedCrowded);
  }

  changeUpdatedThumbIcons(IconData changedUpdatedThumbIcon){
    state = state.copyWith(thumbIcons: changedUpdatedThumbIcon);
  }

  changeCurrentPage(PageController changedCurrentPage){
    state = state.copyWith(pageController: changedCurrentPage);
  }

  updateTopVisible(bool updateTopVisibility){
    state = state.copyWith(topVisible: updateTopVisibility);
  }

  updateTopImageVisible(bool updateTopImageVisibility){
    state = state.copyWith(topImageVisible: updateTopImageVisibility);
  }
}