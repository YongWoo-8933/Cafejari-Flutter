import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/ui/util/day_of_week_opening_info.dart';
import 'package:cafejari_flutter/ui/util/n_location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'cafe_registration_state.freezed.dart';

@freezed
class CafeRegistrationState with _$CafeRegistrationState {
  factory CafeRegistrationState(
      {required NaverSearchCafe selectedSearchCafe,
        required final NaverMapController? mapController,
        required final TextEditingController searchQueryController,
        required final TextEditingController freeQueryController,
        required final NaverSearchCafes searchCafePredictions,
        required final int selectedMaxFloor,
        required final int selectedMinFloor,
        required final List<({int floor, double rate})> wallSocketRates,
        required final bool isWallSocketEdited,
        required final List<DayOfWeekOpeningInfo> openingInfos,
        required final bool isOpeningHourEdited,
        required final List<String> selectedDaysOfWeek,
        required final DayOfWeekOpeningInfo selectedOpeningInfo,
        required final OpeningHour openingHour,
        required final OpeningHour clickedDay
      }) = _CafeRegistrationState;

  factory CafeRegistrationState.empty() => CafeRegistrationState(
    selectedSearchCafe: NaverSearchCafe(
      name: "추가할 카페를 찾아보세요",
      roadAddress: "",
      dongAddress: "",
      latitude: NLocation.sinchon().cameraPosition.target.latitude,
      longitude: NLocation.sinchon().cameraPosition.target.longitude
    ),
    mapController: null,
    searchQueryController: TextEditingController(),
    freeQueryController: TextEditingController(),
    searchCafePredictions: [],
    selectedMaxFloor: 1,
    selectedMinFloor: 1,
    wallSocketRates: [(floor: 1, rate: 0.0)],
    isWallSocketEdited: false,
    openingInfos: [
      DayOfWeekOpeningInfo.empty(shortText: "월", fullText: "월요일"),
      DayOfWeekOpeningInfo.empty(shortText: "화", fullText: "화요일"),
      DayOfWeekOpeningInfo.empty(shortText: "수", fullText: "수요일"),
      DayOfWeekOpeningInfo.empty(shortText: "목", fullText: "목요일"),
      DayOfWeekOpeningInfo.empty(shortText: "금", fullText: "금요일"),
      DayOfWeekOpeningInfo.empty(shortText: "토", fullText: "토요일"),
      DayOfWeekOpeningInfo.empty(shortText: "일", fullText: "일요일")
    ],
    isOpeningHourEdited: false,
    selectedDaysOfWeek: [],
    selectedOpeningInfo: DayOfWeekOpeningInfo.empty(shortText: "", fullText: ""),
    openingHour: OpeningHour.empty(),
    clickedDay: OpeningHour.empty()
  );
}
