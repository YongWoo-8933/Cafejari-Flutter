import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/core/extension/int.dart';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/domain/use_case/cafe_use_case.dart';
import 'package:cafejari_flutter/ui/components/custom_snack_bar.dart';
import 'package:cafejari_flutter/ui/state/cafe_registration_state/cafe_registration_state.dart';
import 'package:cafejari_flutter/ui/util/day_of_week_opening_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/ui/view_model/global_view_model.dart';
import 'package:go_router/go_router.dart';

class CafeRegistrationViewModel extends StateNotifier<CafeRegistrationState> {
  final CafeUseCase _cafeUseCase;
  final GlobalViewModel globalViewModel;

  CafeRegistrationViewModel({
    required CafeUseCase cafeUseCase,
    required this.globalViewModel,
  }) : _cafeUseCase = cafeUseCase, super(CafeRegistrationState.empty());

  clearViewModel() => state = CafeRegistrationState.empty();

  initMapController(NaverMapController controller) => state = state.copyWith(mapController: controller);

  selectMaxFloor(int floor) {
    state = state.copyWith(selectedMaxFloor: floor);
    setWallSocketRate();
  }

  selectMinFloor(int floor) {
    state = state.copyWith(selectedMinFloor: floor);
    setWallSocketRate();
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

  setIsWallSocketEdited(bool isEdited) => state = state.copyWith(isWallSocketEdited: isEdited);

  setIsOpeningHourEdited(bool isEdited) => state = state.copyWith(isOpeningHourEdited: isEdited);

  searchCafe() async {
    state = state.copyWith(
      searchCafePredictions: await _cafeUseCase.getNaverSearchCafes(query: state.searchQueryController.text)
    );
  }

  clearSearchCafePredictions() => state = state.copyWith(searchCafePredictions: []);

  selectSearchCafe(NaverSearchCafe searchCafe) => state = state.copyWith(selectedSearchCafe: searchCafe);

  requestCafeRegistration({required BuildContext context}) async {
    try {
      List<({int floor, double rate})> wallSocketRateList = List.from(state.wallSocketRates);
      wallSocketRateList.sort((a, b) => a.floor.compareTo(b.floor));
      await _cafeUseCase.requestCafeAddition(
        accessToken: globalViewModel.state.accessToken,
        cafeName: state.selectedSearchCafe.name.replaceFirst("<b>", "").replaceFirst("</b>", ""),
        dongAddress: state.selectedSearchCafe.dongAddress,
        roadAddress: state.selectedSearchCafe.roadAddress,
        latitude: state.selectedSearchCafe.latitude,
        longitude: state.selectedSearchCafe.longitude,
        topFloor: state.selectedMaxFloor,
        bottomFloor: state.selectedMinFloor,
        wallSocketRateList: state.isWallSocketEdited ? wallSocketRateList.map((e) => e.rate).toList() : [],
        openingHourList: state.isOpeningHourEdited ? state.openingInfos.map((e) {
          if (e.isClose) {
            return "정기휴무 (매주 ${e.fullText})";
          } else {
            return "${e.openAt.hour.toTwoDigitMinute()}:${e.openAt.minute.toTwoDigitMinute()} ~ ${e.closeAt.hour.toTwoDigitMinute()}:${e.closeAt.minute.toTwoDigitMinute()}";
          }
        }).toList() : [],
        etc: state.freeQueryController.text,
        onAccessTokenRefresh: globalViewModel.setAccessToken
      );
      globalViewModel.showSnackBar(content: "등록요청\n완료", type: SnackBarType.complete);
      if(context.mounted) GoRouter.of(context).pop();
    } on ErrorWithMessage catch (e) {
      globalViewModel.showSnackBar(content: e.message, type: SnackBarType.error);
    } on RefreshTokenExpired {
      if(context.mounted) await globalViewModel.expireRefreshToken(context: context);
    }
  }
}
