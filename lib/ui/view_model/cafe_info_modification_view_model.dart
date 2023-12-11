import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/core/extension/int.dart';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/domain/use_case/cafe_use_case.dart';
import 'package:cafejari_flutter/ui/components/custom_snack_bar.dart';
import 'package:cafejari_flutter/ui/state/cafe_info_modification_state/cafe_info_modification_state.dart';
import 'package:cafejari_flutter/ui/util/day_of_week_opening_info.dart';
import 'package:cafejari_flutter/ui/util/n_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/ui/view_model/global_view_model.dart';
import 'package:go_router/go_router.dart';

class CafeInfoModificationViewModel extends StateNotifier<CafeInfoModificationState> {
  final CafeUseCase _cafeUseCase;
  final GlobalViewModel globalViewModel;

  CafeInfoModificationViewModel({
    required CafeUseCase cafeUseCase,
    required this.globalViewModel,
  }) : _cafeUseCase = cafeUseCase, super(CafeInfoModificationState.empty());

  initViewModel({required Cafe selectedCafe}) {
    List<({int floor, String text})> restroomInfos = [];
    List<({int floor, double rate})> wallSocketRates = [];
    for (var cafeFloor in selectedCafe.cafeFloors) {
      restroomInfos.add((floor: cafeFloor.floor, text: cafeFloor.restroom ?? "남/여 화장실"));
      wallSocketRates.add((floor: cafeFloor.floor, rate: cafeFloor.wallSocketRate ?? 0.0));
    }
    state = CafeInfoModificationState.empty().copyWith(
      latLng: selectedCafe.latLng,
      selectedMaxFloor: selectedCafe.cafeFloors.last.floor,
      selectedMinFloor: selectedCafe.cafeFloors.first.floor,
      wallSocketRates: wallSocketRates,
      restroomInfos: restroomInfos
    );
  }

  clearViewModel() => state = CafeInfoModificationState.empty();

  initMapController(NaverMapController controller) => state = state.copyWith(mapController: controller);

  setCafeClosed(bool value) => state = state.copyWith(isCafeClosed: value);

  setLatLng() async {
    final NCameraPosition? cameraPosition = await state.mapController?.getCameraPosition();
    final NLatLng latLng = cameraPosition?.target ?? NLocation.sinchon().cameraPosition.target;
    state = state.copyWith(latLng: latLng);
  }

  selectMaxFloor(int floor) {
    state = state.copyWith(selectedMaxFloor: floor);
    setWallSocketRate();
    setRestroomInfo();
  }

  selectMinFloor(int floor) {
    state = state.copyWith(selectedMinFloor: floor);
    setWallSocketRate();
    setRestroomInfo();
  }

  setWallSocketRate() {
    List<({int floor, double rate})> newWallSocketRates = [];
    for(int i = state.selectedMinFloor; i <= state.selectedMaxFloor; i++) {
      if(i != 0) {
        newWallSocketRates.add((floor: i, rate: 0));
      }
    }
    state = state.copyWith(wallSocketRates: newWallSocketRates);
  }

  setRestroomInfo() {
    List<({int floor, String text})> newRestroomInfos = [];
    for(int i = state.selectedMinFloor; i <= state.selectedMaxFloor; i++) {
      if(i != 0) {
        newRestroomInfos.add((floor: i, text: "남/여 화장실"));
      }
    }
    state = state.copyWith(restroomInfos: newRestroomInfos);
  }

  updateWallSocketRate({required int index, required double rate}) {
    state = state.copyWith(
      wallSocketRates: state.wallSocketRates.map((e) {
        return (floor: e.floor, rate: state.wallSocketRates[index] == e ? rate : e.rate);
      }).toList()
    );
  }

  setOpeningHour(OpeningHour setHour) => state = state.copyWith(openingHour: setHour);

  pickDay(List<String> selectedDaysOfWeek) => state = state.copyWith(selectedDaysOfWeek: selectedDaysOfWeek);

  selectOpeningTime(TimeOfDay? timeOfDay) {
    if (timeOfDay.isNotNull) {
      state = state.copyWith(
        selectedOpeningInfo: state.selectedOpeningInfo.copyWith(openAt: timeOfDay)
      );
    }
  }

  selectClosingTime(TimeOfDay? timeOfDay) {
    if (timeOfDay.isNotNull) {
      state = state.copyWith(
        selectedOpeningInfo: state.selectedOpeningInfo.copyWith(closeAt: timeOfDay)
      );
    }
  }

  selectIsClose(bool isClosed) {
    state = state.copyWith(
      selectedOpeningInfo: state.selectedOpeningInfo.copyWith(isClose: isClosed)
    );
  }

  saveSelectedOpeningHourInfo() {
    for (var shortText in state.selectedDaysOfWeek) {
      for (var openingInfo in state.openingInfos) {
        if(openingInfo.shortText == shortText) {
          List<DayOfWeekOpeningInfo> newInfos = List.from(state.openingInfos);
          final index = newInfos.indexWhere((element) => element.shortText == shortText);
          newInfos[index] = state.selectedOpeningInfo.copyWith(
            fullText: openingInfo.fullText, shortText: openingInfo.shortText
          );
          state = state.copyWith(openingInfos: newInfos);
        }
      }
    }
  }

  updateRestroomInfo({required int index, required String text}) {
    state = state.copyWith(
      restroomInfos: state.restroomInfos.map((e) {
        return (floor: e.floor, text: state.wallSocketRates[index].floor == e.floor ? text : e.text);
      }).toList()
    );
  }

  setIsFloorEdited(bool isEdited) => state = state.copyWith(isFloorEdited: isEdited);
  setIsCoordinateEdited(bool isEdited) => state = state.copyWith(isCoordinateEdited: isEdited);
  setIsWallSocketEdited(bool isEdited) => state = state.copyWith(isWallSocketEdited: isEdited);
  setIsOpeningHourEdited(bool isEdited) => state = state.copyWith(isOpeningHourEdited: isEdited);
  setIsRestroomEdited(bool isEdited) => state = state.copyWith(isRestroomEdited: isEdited);

  setIsClosingPartExpanded(bool isExpanded) => state = state.copyWith(isClosingPartExpanded: isExpanded);
  setIsFloorPartExpanded(bool isExpanded) => state = state.copyWith(isFloorPartExpanded: isExpanded);
  setIsCoordinatePartExpanded(bool isExpanded) => state = state.copyWith(isCoordinatePartExpanded: isExpanded);
  setIsCafeClosePartExpanded(bool isExpanded) => state = state.copyWith(isCafeClosePartExpanded: isExpanded);
  setIsWallSocketPartExpanded(bool isExpanded) => state = state.copyWith(isWallSocketPartExpanded: isExpanded);
  setIsOpeningHourPartExpanded(bool isExpanded) => state = state.copyWith(isOpeningHourPartExpanded: isExpanded);
  setIsRestroomPartExpanded(bool isExpanded) => state = state.copyWith(isRestroomPartExpanded: isExpanded);
  setIsFreePartExpanded(bool isExpanded) => state = state.copyWith(isFreePartExpanded: isExpanded);

  requestCafeModification({
    required BuildContext context,
    required Cafe selectedCafe
  }) async {
    if(!state.isCoordinateEdited && !state.isFloorEdited && !state.isRestroomEdited &&
       !state.isWallSocketEdited && !state.isOpeningHourEdited && !state.isCafeClosed &&
       state.freeQueryController.text.isEmpty) {
      globalViewModel.showSnackBar(content: "수정된 정보가\n없어요", type: SnackBarType.error);
    } else {
      try {
        List<({int floor, double rate})> wallSocketRateList = List.from(state.wallSocketRates);
        wallSocketRateList.sort((a, b) => a.floor.compareTo(b.floor));
        List<({int floor, String text})> restroomInfoList = List.from(state.restroomInfos);
        restroomInfoList.sort((a, b) => a.floor.compareTo(b.floor));
        await _cafeUseCase.requestCafeModification(
            accessToken: globalViewModel.state.accessToken,
            isClosed: state.isCafeClosed,
            cafeId: selectedCafe.id,
            topFloor: state.isFloorEdited ? state.selectedMaxFloor : selectedCafe.cafeFloors.last.floor,
            bottomFloor: state.isFloorEdited ? state.selectedMinFloor : selectedCafe.cafeFloors.first.floor,
            onAccessTokenRefresh: globalViewModel.setAccessToken,
            wallSocketRateList: state.isWallSocketEdited ? wallSocketRateList.map((e) => e.rate).toList() : null,
            openingHourList: state.isOpeningHourEdited ? state.openingInfos.map((e) {
              if (e.isClose) {
                return "정기휴무 (매주 ${e.fullText})";
              } else {
                return "${e.openAt.hour.toTwoDigitMinute()}:${e.openAt.minute.toTwoDigitMinute()} ~ ${e.closeAt.hour.toTwoDigitMinute()}:${e.closeAt.minute.toTwoDigitMinute()}";
              }
            }).toList() : null,
            restRoomList: state.isRestroomEdited ? restroomInfoList.map((e) => e.text).toList() : null,
            latitude: state.isCoordinateEdited ? state.latLng.latitude : null,
            longitude: state.isCoordinateEdited ? state.latLng.longitude : null,
            etc: state.freeQueryController.text.isNotEmpty ? state.freeQueryController.text : null
        );
        globalViewModel.showSnackBar(content: "수정요청\n완료", type: SnackBarType.complete);
        if(context.mounted) GoRouter.of(context).pop();
      } on ErrorWithMessage catch (e) {
        globalViewModel.showSnackBar(content: e.message, type: SnackBarType.error);
      } on RefreshTokenExpired {
        if(context.mounted) await globalViewModel.expireRefreshToken(context: context);
      }
    }
  }
}
