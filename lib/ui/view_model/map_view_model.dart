import 'dart:math';
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
import 'package:firebase_analytics/firebase_analytics.dart';
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

  Future<Cafes> refreshCafes({NCameraPosition? cameraPosition, int? selectedCafeId}) async {
    final NCameraPosition nonNullCameraPosition = cameraPosition ?? await state.mapController?.getCameraPosition() ?? NLocation.sinchon().cameraPosition;
    try {
      final Cafes newCafes = await _cafeUseCase.getMapCafes(cameraPosition: nonNullCameraPosition);

      // 마커 설정
      Set<NMarker> resSet = {};
      for (final cafe in newCafes) {
        resSet.add(_makeMarkerFromCafe(cafe: cafe, isTapped: selectedCafeId == cafe.id));
      }
      await state.mapController?.clearOverlays();
      await state.mapController?.addOverlayAll(resSet);

      // 변경 사항 저장
      state = state.copyWith(cafes: newCafes);
      return newCafes;
    } on ErrorWithMessage catch(e) {
      globalViewModel.showSnackBar(content: e.message, type: SnackBarType.error);
      return [];
    }
  }

  moveToCafeWithRefresh({required int cafeId}) async {
    try {
      final Cafe cafe = await _cafeUseCase.getCafe(cafeId: cafeId);
      final NCameraPosition cameraPosition = NCameraPosition(target: cafe.latLng, zoom: Zoom.large);
      await refreshCafes(cameraPosition: cameraPosition, selectedCafeId: cafeId);
      selectCafe(cafe);
      selectCafeFloor(cafe.cafeFloors.first);
      state.mapController?.updateCamera(NCameraUpdate.fromCameraPosition(cameraPosition));
      openBottomSheetPreview();
    } on ErrorWithMessage {
      null;
    }
  }

  refreshMyTodayOccupancyRateUpdates({required BuildContext context}) async {
    try {
      state = state.copyWith(myTodayUpdates: await _cafeUseCase.getMyTodayOccupancyUpdates(
        accessToken: globalViewModel.state.accessToken,
        onAccessTokenRefresh: globalViewModel.setAccessToken
      ));
    } on ErrorWithMessage catch (e) {
      null;
    } on RefreshTokenExpired {
      if(context.mounted) globalViewModel.expireRefreshToken(context: context);
    }
  }

  refreshLocations() async {
    try {
      state = state.copyWith(locations: await _cafeUseCase.getLocations());
    } on ErrorWithMessage catch (e) {
      globalViewModel.showSnackBar(content: e.message, type: SnackBarType.error);
    }
  }

  getRandomCafeImageUrl() async {
    try {
      final Cafe cafe = await _cafeUseCase.getCafe(cafeId: 3);
      if(cafe.imageUrls.isEmpty) {
        state = state.copyWith(randomCafeImageUrl: null);
      } else {
        final int randomIndex = Random().nextInt(cafe.imageUrls.length);
        state = state.copyWith(randomCafeImageUrl: cafe.imageUrls[randomIndex]);
      }
    } on ErrorWithMessage {
      null;
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

  openBottomSheetPreview() {
    state = state.copyWith(isBottomSheetPreviewOpened: true, isBottomSheetPreviewExpanded: true);
  }

  closeBottomSheetPreview() async {
    state = state.copyWith(isBottomSheetPreviewExpanded: false);
    await Future.delayed(AppDuration.animationDefault, () {
      state = state.copyWith(isBottomSheetPreviewOpened: false);
    });
  }

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

  updateFavoriteCafeList({required Cafe cafe, required BuildContext context}) async {
    try {
      List<Cafe> newCafeList = List.from(globalViewModel.state.user.favoriteCafes);
      if(newCafeList.where((e) => e.id == cafe.id).isNotEmpty) {
        // 내 카페 해제
        newCafeList.removeWhere((e) => e.id == cafe.id);
      } else {
        // 내 카페 등록
        newCafeList.add(cafe);
      }
      globalViewModel.setUser(globalViewModel.state.user.copyWith(favoriteCafes: newCafeList));
      final User updatedUser = await _userUseCase.updateProfile(
        accessToken: globalViewModel.state.accessToken,
        profileId: globalViewModel.state.user.profileId,
        favoriteCafeIdList: newCafeList.map((e) => e.id).toList(),
        onAccessTokenRefresh: globalViewModel.setAccessToken
      );
      globalViewModel.setUser(updatedUser);
      if (updatedUser.favoriteCafes.where((e) => e.id == cafe.id).isNotEmpty) {
        globalViewModel.showSnackBar(content: "내 카페에\n추가됨", type: SnackBarType.complete);
      } else {
        globalViewModel.showSnackBar(content: "내 카페에서\n제외됨", type: SnackBarType.complete);
      }
    } on ErrorWithMessage catch (e) {
      globalViewModel.showSnackBar(content: e.message, type: SnackBarType.error);
    } on RefreshTokenExpired {
      if(context.mounted) await globalViewModel.expireRefreshToken(context: context);
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
      Map<int, OccupancyRateUpdates> newUpdates = Map.from(state.myTodayUpdates);
      if(newUpdates.containsKey(updateResponse.cafeFloor.id)) {
        newUpdates[updateResponse.cafeFloor.id]!.insert(0, updateResponse);
      } else {
        newUpdates[updateResponse.cafeFloor.id] = [updateResponse];
      }
      state = state.copyWith(myTodayUpdates: newUpdates);
      _replaceCafe(updatedCafe);
      globalViewModel.init(
        accessToken: globalViewModel.state.accessToken,
        user: globalViewModel.state.user.copyWith(point: globalViewModel.state.user.point + updateResponse.point)
      );
      Future.delayed(Duration.zero, () => _showPointAnimation(context: context, point: updateResponse.point));
    } on ErrorWithMessage catch (e) {
      globalViewModel.showSnackBar(content: e.message, type: SnackBarType.error);
    } on RefreshTokenExpired {
      if(context.mounted) await globalViewModel.expireRefreshToken(context: context);
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
      globalViewModel.showSnackBar(content: "등록 완료", type: SnackBarType.complete);
    } on ErrorWithMessage catch (e) {
      globalViewModel.showSnackBar(content: e.message, type: SnackBarType.error);
    }
  }

  initWithMapLinkCafeId(int cafeId) async {
    try {
      final Cafe cafe = await _cafeUseCase.getCafe(cafeId: cafeId);
      selectCafe(cafe);
      selectCafeFloor(cafe.cafeFloors.first);
      final NCameraPosition cameraPosition = NCameraPosition(target: cafe.latLng, zoom: Zoom.large);
      setShareTempCameraPosition(cameraPosition);
      if(state.mapController.isNotNull) {
        await refreshCafes(cameraPosition: cameraPosition, selectedCafeId: cafe.id);
        state.mapController!.updateCamera(NCameraUpdate.fromCameraPosition(cameraPosition));
      }
    } on ErrorWithMessage {
      null;
    }
  }

  initCATISliderValue() {
    state = state.copyWith(
      catiOpennessSliderValue: state.selectedCafe.cati?.openness ?? CATI.empty().openness,
      catiCoffeeSliderValue: state.selectedCafe.cati?.coffee ?? CATI.empty().coffee,
      catiWorkspaceSliderValue: state.selectedCafe.cati?.workspace ?? CATI.empty().workspace,
      catiAciditySliderValue: state.selectedCafe.cati?.acidity ?? CATI.empty().acidity
    );
  }

  voteCATI({required BuildContext context}) async {
    try {
      await _cafeUseCase.voteCATI(
        accessToken: globalViewModel.state.accessToken,
        cafeId: state.selectedCafe.id,
        openness: state.catiOpennessSliderValue,
        coffee: state.catiCoffeeSliderValue,
        workspace: state.catiWorkspaceSliderValue,
        acidity: state.catiAciditySliderValue,
        onAccessTokenRefresh: globalViewModel.setAccessToken
      );
      _replaceCafe(await _cafeUseCase.getCafe(cafeId: state.selectedCafe.id));
      globalViewModel.showSnackBar(content: "CATI등록됨", type: SnackBarType.complete);
    } on ErrorWithMessage {
      null;
    } on RefreshTokenExpired {
      if (context.mounted) globalViewModel.expireRefreshToken(context: context);
    }
  }

  initMapController(NaverMapController mapController) => state = state.copyWith(mapController: mapController);

  updateOccupancySliderValue(value) => state = state.copyWith(occupancySliderValue: value);

  clearSearchPredictions() => state = state.copyWith(searchPredictions: []);

  setInitTempCameraPosition(NCameraPosition? cameraPosition) => state = state.copyWith(initTempCameraPosition: cameraPosition);

  setShareTempCameraPosition(NCameraPosition? cameraPosition) => state = state.copyWith(shareTempCameraPosition: cameraPosition);

  selectCafe(Cafe changedSelectedCafe) {
    state = state.copyWith(
      selectedCafe: changedSelectedCafe,
      currentCafeImagePage: 0
    );
    if(state.cafeImagePageController.hasClients) state.cafeImagePageController.jumpToPage(0);
  }

  selectCafeFloor(CafeFloor changedSelectedCafeFloor) => state = state.copyWith(selectedCafeFloor: changedSelectedCafeFloor);

  setCurrentCafeImagePage(int page) => state = state.copyWith(currentCafeImagePage: page);

  setRefreshButtonVisible(bool visible) => state = state.copyWith(isRefreshButtonVisible: visible);

  setBottomSheetFullContentVisible(bool visible) => state = state.copyWith(isBottomSheetFullContentVisible: visible);

  setCATIOpenness(int value) => state = state.copyWith(catiOpennessSliderValue: value);

  setCATICoffee(int value) => state = state.copyWith(catiCoffeeSliderValue: value);

  setCATIWorkspace(int value) => state = state.copyWith(catiWorkspaceSliderValue: value);

  setCATIAcidity(int value) => state = state.copyWith(catiAciditySliderValue: value);

  // ===============================================================================================

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
    var marker = _makeMarkerFromCafe(cafe: cafe, isTapped: true);
    state.mapController?.addOverlay(marker);

    // state 적용
    selectCafe(cafe);
    selectCafeFloor(newCafeFloor);
    state = state.copyWith(cafes: copiedCafes);
  }

  NMarker _makeMarkerFromCafe({required Cafe cafe, required bool isTapped}) {
    var marker = NMarker(
      id: cafe.id.toString(),
      position: cafe.latLng,
      icon: cafe.recentUpdatedOccupancyRate.toOccupancyLevel().nMarker,
      size: cafe.recentUpdatedOccupancyRate.toOccupancyLevel().markerSize
    );
    marker.setZIndex(1);
    marker.setOnTapListener((tappedMarker) async {
      _tapMarker(marker: tappedMarker, cafe: cafe);
      selectCafe(cafe);
      selectCafeFloor(cafe.recentUpdatedFloor.isNull ?
        cafe.cafeFloors.first :
        cafe.cafeFloors.firstWhere((e) => e.floor == cafe.recentUpdatedFloor)
      );
      state.mapController?.updateCamera(NCameraUpdate.scrollAndZoomTo(target: cafe.latLng, zoom: Zoom.large));
      openBottomSheetPreview();
    });
    if(isTapped) _tapMarker(cafe: cafe, marker: marker);
    return marker;
  }

  _tapMarker({required NMarker marker, required Cafe cafe}) async {
    await FirebaseAnalytics.instance.logEvent(
      name: "marker_click",
      parameters: {
        "cafe_id": cafe.id,
        "cafe_brand": cafe.brandName ?? "None"
      },
    );
    if (state.selectedMarker.isNotNull) {
      state.selectedMarker?.setSize(state.selectedMarker!.size * 5 / 6);
      state.selectedMarker?.setZIndex(1);
      state.selectedMarker?.setCaption(const NOverlayCaption(text: ""));
    }
    marker.setCaptionOffset(1.0);
    marker.setSize(cafe.recentUpdatedOccupancyRate.toOccupancyLevel().markerSize * 1.2);
    marker.setZIndex(3);
    marker.setCaptionAligns([NAlign.top]);
    marker.setCaptionOffset(4.0);
    marker.setCaption(NOverlayCaption(text: cafe.name, textSize: 14));
    state = state.copyWith(selectedMarker: marker);
  }

  _showPointAnimation({required BuildContext context, required int point}) {
    showDialog(context: context, builder: (context) {
      Future.delayed(const Duration(seconds: 4), () {if(context.mounted) Navigator.of(context).pop();});
      return Dialog(
        insetPadding: AppPadding.padding_0,
        backgroundColor: AppColor.transparent,
        child: Container(
          width: 160,
          height: 300,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const VerticalSpacer(40),
              const Text(
                "등록 완료",
                style: TextSize.textSize_bold_20,
              ),
              const VerticalSpacer(8),
              Image.asset("asset/image/point_animation.gif", width: 150, height: 150),
              const VerticalSpacer(4),
              Text(
                "획득한 포인트 : ${point}P",
                style: const TextStyle(
                  color: AppColor.secondary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),
              ),
              const VerticalSpacer(40),
            ],
          ),
        ),
      );
    });
  }
}