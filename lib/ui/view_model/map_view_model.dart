
import 'package:cafejari_flutter/core/extension/double.dart';
import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:cafejari_flutter/domain/use_case/user_use_case.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/duration.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/custom_snack_bar.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/util/n_location.dart';
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
  final CafeUseCase _cafeUseCase;
  final UserUseCase _userUseCase;
  final GlobalViewModel globalViewModel;

  MapViewModel({
    required CafeUseCase cafeUseCase,
    required UserUseCase userUseCase,
    required this.globalViewModel
  }): _cafeUseCase = cafeUseCase, _userUseCase = userUseCase, super(MapState.empty().copyWith());

  refreshCafes({NCameraPosition? cameraPosition}) async {
    final NCameraPosition nonNullCameraPosition = cameraPosition ?? await state.mapController?.getCameraPosition() ?? NLocation.sinchon().cameraPosition;
    try {
      final Cafes newCafes = await _cafeUseCase.getMapCafes(cameraPosition: nonNullCameraPosition);

      // 마커 설정
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

      // selected cafe / cafeFloor 설정
      final Cafe selectedNewCafe = newCafes.firstWhere(
        (element) => element.id == state.selectedCafe.id,
        orElse: () => Cafe.empty()
      );
      final CafeFloor selectedNewCafeFloor = selectedNewCafe.cafeFloors.firstWhere(
        (element) => element.id == state.selectedCafeFloor.id,
        orElse: () => CafeFloor.empty()
      );

      // 변경 사항 저장
      state = state.copyWith(cafes: newCafes, selectedCafe: selectedNewCafe, selectedCafeFloor: selectedNewCafeFloor);
    } on ErrorWithMessage catch(e) {
      globalViewModel.showSnackBar(content: e.message, type: SnackBarType.error);
    }
  }

  searchCafe() async {
    try {
      state = state.copyWith(
          searchPredictions: await _cafeUseCase.getSearchCafes(query: state.searchQueryController.text));
    } on ErrorWithMessage catch (e) {
      globalViewModel.showSnackBar(content: e.message, type: SnackBarType.error);
    }
  }

  clearSearchPredictions() => state = state.copyWith(searchPredictions: []);

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

  setCurrentCafeImagePage(int page) => state = state.copyWith(currentCafeImagePage: page);

  setRefreshButtonVisible(bool visible) => state = state.copyWith(isRefreshButtonVisible: visible);

  setBottomSheetFullContentVisible(bool visible) => state = state.copyWith(isBottomSheetFullContentVisible: visible);

  setOccupancyBottomSheetDraggable(bool draggable) => state = state.copyWith(isOccupancyBottomSheetDraggable: draggable);

  updateOccupancySliderValue(value) => state = state.copyWith(occupancySliderValue: value);

  openSearchPage() {
    state = state.copyWith(isSearchPageVisible: true, isSearchPageFadedIn: true);
  }

  closeSearchPage() async {
    state = state.copyWith(isSearchPageFadedIn: false);
    state.searchQueryController.text = "";
    clearSearchPredictions();
    await Future.delayed(AppDuration.animationDefault, () {
      state = state.copyWith(isSearchPageVisible: false);
    });
  }

  updateFavoriteCafeList(int cafeId) async {
    try {
      List<int> newCafeIdList = List.from(globalViewModel.state.user.favoriteCafes.map((e) => e.id).toList());
      if(newCafeIdList.contains(cafeId)) {
        // 내 카페 해제
        newCafeIdList.remove(cafeId);
        globalViewModel.showSnackBar(content: "내 카페에서 \n제외됨", type: SnackBarType.complete);
      } else {
        // 내 카페 등록
        newCafeIdList.add(cafeId);
        globalViewModel.showSnackBar(content: "내 카페에 \n추가됨", type: SnackBarType.complete);
      }
      final User updatedUser = await _userUseCase.updateProfile(
        accessToken: globalViewModel.state.accessToken,
        profileId: globalViewModel.state.user.profileId,
        favoriteCafeIdList: newCafeIdList
      );
      globalViewModel.saveLoginResult(accessToken: globalViewModel.state.accessToken, user: updatedUser);
    } on RefreshTokenExpired {
      null;
    } on ErrorWithMessage catch (e) {
      globalViewModel.showSnackBar(content: e.message, type: SnackBarType.error);
    }
  }

  updateOccupancyRateAsUser({required BuildContext context}) async {
    try {
      final OccupancyRateUpdate updateResponse = await _cafeUseCase.updateOccupancy(
        occupancyRate: state.occupancySliderValue / 100,
        cafeFloorId: state.selectedCafeFloor.id,
        accessToken: globalViewModel.state.accessToken
      );
      final Cafe updatedCafe = await _cafeUseCase.getCafe(cafeId: updateResponse.cafeFloor.cafe.id);
      _replaceCafe(updatedCafe);
      globalViewModel.saveLoginResult(
        accessToken: globalViewModel.state.accessToken,
        user: globalViewModel.state.user.copyWith(point: globalViewModel.state.user.point + updateResponse.point)
      );
      state.bottomSheetOccupancyController.close();
      Future.delayed(Duration.zero, () => _showPointAnimation(context: context, point: updateResponse.point));
    } on RefreshTokenExpired {
      null;
    } on ErrorWithMessage catch (e) {
      globalViewModel.showSnackBar(content: e.message, type: SnackBarType.error);
    }
  }

  updateOccupancyRateAsGuest({required BuildContext context}) async {
    try {
      final OccupancyRateUpdate updateResponse = await _cafeUseCase.updateOccupancy(
        occupancyRate: state.occupancySliderValue / 100,
        cafeFloorId: state.selectedCafeFloor.id
      );
      final Cafe updatedCafe = await _cafeUseCase.getCafe(cafeId: updateResponse.cafeFloor.cafe.id);
      _replaceCafe(updatedCafe);
      state.bottomSheetOccupancyController.close();
      globalViewModel.showSnackBar(content: "등록 완료", type: SnackBarType.complete);
    } on ErrorWithMessage catch (e) {
      globalViewModel.showSnackBar(content: e.message, type: SnackBarType.error);
    }
  }

  _replaceCafe(Cafe cafe) {
    // cafe list 대체
    Cafes copiedCafes = List.from(state.cafes);
    final int index = copiedCafes.indexWhere((element) => element.id == cafe.id);
    if(index >= 0) copiedCafes[index] = cafe;

    // 대체할 selected cafe floor 추출
    final CafeFloor newCafeFloor = cafe.cafeFloors.firstWhere(
        (element) => element.id == state.selectedCafeFloor.id,
        orElse: () => state.selectedCafeFloor
    );

    // marker 교체
    var marker = NMarker(
      id: cafe.id.toString(),
      position: cafe.latLng,
      icon: cafe.recentUpdatedOccupancyRate.toOccupancyLevel().nMarker,
      size: cafe.recentUpdatedOccupancyRate.toOccupancyLevel().markerSize * 1.25
    );
    marker.setZIndex(3);
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
    state.mapController?.addOverlay(marker);

    // state 적용
    state = state.copyWith(
      cafes: copiedCafes,
      selectedCafe: cafe,
      selectedCafeFloor: newCafeFloor,
      selectedMarker: marker,
    );
  }

  _showPointAnimation({required BuildContext context, required int point}) {
    showDialog(context: context, builder: (context) {
      Future.delayed(Duration(seconds: 4), () => Navigator.of(context).pop());
      return Dialog(
        insetPadding: AppPadding.padding_0,
        backgroundColor: AppColor.transparent,
        child: Container(
          width: 180,
          height: 300,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VerticalSpacer(40),
              Text(
                "등록 완료",
                style: TextSize.textSize_bold_20,
              ),
              VerticalSpacer(8),
              Image.asset("asset/image/point_animation.gif", width: 150, height: 150),
              VerticalSpacer(4),
              Text(
                "획득한 포인트 : ${point}P",
                style: TextStyle(
                  color: AppColor.secondary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),
              ),
              VerticalSpacer(40),
            ],
          ),
        ),
      );
    });
  }
}