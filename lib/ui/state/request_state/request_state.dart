import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/ui/util/day_of_week_opening_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'request_state.freezed.dart';

@freezed
class RequestState with _$RequestState {
  factory RequestState(
      {required final String cafeName,
        required final String cafeAddress,
        required final NaverMapController? mapController,
        required final TextEditingController searchQueryController,
        required final TextEditingController freeQueryController,
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
      }) = _RequestState;

  factory RequestState.empty() => RequestState(
    cafeName: "스타벅스 신촌점",
    cafeAddress: "서대문구 무슨로 220-32931",
    mapController: null,
    searchQueryController: TextEditingController(),
    freeQueryController: TextEditingController(),
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
