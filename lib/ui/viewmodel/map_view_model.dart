import 'dart:ui';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/core/extension/int.dart';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/domain/entity/cafe_info/cafe_info.dart';
import 'package:cafejari_flutter/domain/use_case/map_use_case.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';
import 'package:cafejari_flutter/ui/util/n_location.dart';
import 'package:cafejari_flutter/ui/util/zoom.dart';
import 'package:cafejari_flutter/ui/viewmodel/global_view_model.dart';

class MapViewModel extends StateNotifier<MapState> {
  final MapUseCase _mapUseCase;
  final GlobalViewModel globalViewModel;

  MapViewModel({required MapUseCase mapUseCase, required this.globalViewModel})
      : _mapUseCase = mapUseCase,
        super(MapState.empty());

  refreshCafeInfos() async {
    try {
      final CafeInfos newCafeInfos = await _mapUseCase.getCafeInfos(
          accessToken: globalViewModel.state.accessToken,
          cameraPosition:
              await state.mapController?.getCameraPosition() ?? NLocation.sinchon().cameraPosition);

      Set<NMarker> resSet = {};

      for (var cafeInfo in newCafeInfos) {
        var marker = NMarker(
            id: cafeInfo.id.toString(),
            position: cafeInfo.latLng,
            icon: cafeInfo.minCrowded.toCrowded().marker,
            size: const Size(31, 36));
        marker.setZIndex(1);
        marker.setOnTapListener((tappedMarker) async {
          if (state.selectedMarker.isNotNull) {
            state.selectedMarker?.setSize(const Size(31, 36));
            state.selectedMarker?.setZIndex(1);
            state.selectedMarker?.setCaption(const NOverlayCaption(text: ""));
            state.selectedMarker?.setSubCaption(const NOverlayCaption(text: ""));
          }
          tappedMarker.setCaptionOffset(1.0);
          tappedMarker.setSize(const Size(43, 50));
          tappedMarker.setZIndex(3);
          tappedMarker.setCaption(NOverlayCaption(text: cafeInfo.name, textSize: 16.0));
          tappedMarker.setSubCaption(NOverlayCaption(
              text: cafeInfo.minCrowded.toCrowded().stringValue,
              textSize: 14.0,
              color: cafeInfo.minCrowded.toCrowded().complementaryColor,
              haloColor: cafeInfo.minCrowded.toCrowded().color));
          tappedMarker.setCaptionAligns([NAlign.top]);
          tappedMarker.setCaptionOffset(4.0);

          state = state.copyWith(selectedCafeInfo: cafeInfo, selectedMarker: tappedMarker, selectedCafe: cafeInfo.cafes.first);
          state.mapController?.updateCamera(
              NCameraUpdate.scrollAndZoomTo(target: cafeInfo.latLng, zoom: Zoom.large));
          await state.bottomSheetController.animatePanelToSnapPoint();
        });
        resSet.add(marker);
      }

      await state.mapController?.clearOverlays();
      await state.mapController?.addOverlayAll(resSet);

      state = state.copyWith(cafeInfos: newCafeInfos);
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

  changeUpdatedCrowded(double changedUpdatedCrowded){
    state = state.copyWith(updatedCrowded: changedUpdatedCrowded);
  }

  updateTopVisible(bool updateTopVisibility){
    state = state.copyWith(topVisible: updateTopVisibility);
  }
}