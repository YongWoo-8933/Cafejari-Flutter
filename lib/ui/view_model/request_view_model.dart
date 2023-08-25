
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:cafejari_flutter/domain/use_case/user_use_case.dart';
import 'package:cafejari_flutter/ui/state/my_page_state/my_page_state.dart';
import 'package:cafejari_flutter/ui/state/request_state/request_state.dart';
import 'package:cafejari_flutter/ui/util/day_of_week_opening_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/ui/view_model/global_view_model.dart';

class RequestViewModel extends StateNotifier<RequestState> {

  RequestViewModel() : super(RequestState.empty());

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

  setOpeningHour(OpeningHour setHour){
    state = state.copyWith(openingHour: setHour);
  }

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
}
