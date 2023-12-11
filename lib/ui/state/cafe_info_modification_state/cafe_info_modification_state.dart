import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/ui/util/day_of_week_opening_info.dart';
import 'package:cafejari_flutter/ui/util/n_location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'cafe_info_modification_state.freezed.dart';

@freezed
class CafeInfoModificationState with _$CafeInfoModificationState {
  factory CafeInfoModificationState(
      {required final NaverMapController? mapController,
        required final TextEditingController freeQueryController,
        required final bool isCoordinateEdited,
        required final bool isFloorEdited,
        required final bool isWallSocketEdited,
        required final bool isOpeningHourEdited,
        required final bool isRestroomEdited,

        required final bool isClosingPartExpanded,
        required final bool isFloorPartExpanded,
        required final bool isCoordinatePartExpanded,
        required final bool isCafeClosePartExpanded,
        required final bool isWallSocketPartExpanded,
        required final bool isOpeningHourPartExpanded,
        required final bool isRestroomPartExpanded,
        required final bool isFreePartExpanded,

        required final bool isCafeClosed,
        required final NLatLng latLng,
        required final int selectedMaxFloor,
        required final int selectedMinFloor,
        required final List<({int floor, double rate})> wallSocketRates,
        required final List<DayOfWeekOpeningInfo> openingInfos,
        required final List<String> selectedDaysOfWeek,
        required final DayOfWeekOpeningInfo selectedOpeningInfo,
        required final OpeningHour openingHour,
        required final OpeningHour clickedDay,
        required final List<({int floor, String text})> restroomInfos,
      }) = _CafeInfoModificationState;

  factory CafeInfoModificationState.empty() => CafeInfoModificationState(
    mapController: null,
    freeQueryController: TextEditingController(),
    isCoordinateEdited: false,
    isFloorEdited: false,
    isWallSocketEdited: false,
    isOpeningHourEdited: false,
    isRestroomEdited: false,

    isClosingPartExpanded: false,
    isFloorPartExpanded: false,
    isCoordinatePartExpanded: false,
    isCafeClosePartExpanded: false,
    isWallSocketPartExpanded: false,
    isOpeningHourPartExpanded: false,
    isRestroomPartExpanded: false,
    isFreePartExpanded: false,

    isCafeClosed: false,
    latLng: NLocation.sinchon().cameraPosition.target,
    selectedMaxFloor: 1,
    selectedMinFloor: 1,
    wallSocketRates: [(floor: 1, rate: 0.0)],
    openingInfos: [
      DayOfWeekOpeningInfo.empty(shortText: "월", fullText: "월요일"),
      DayOfWeekOpeningInfo.empty(shortText: "화", fullText: "화요일"),
      DayOfWeekOpeningInfo.empty(shortText: "수", fullText: "수요일"),
      DayOfWeekOpeningInfo.empty(shortText: "목", fullText: "목요일"),
      DayOfWeekOpeningInfo.empty(shortText: "금", fullText: "금요일"),
      DayOfWeekOpeningInfo.empty(shortText: "토", fullText: "토요일"),
      DayOfWeekOpeningInfo.empty(shortText: "일", fullText: "일요일")
    ],
    selectedDaysOfWeek: [],
    selectedOpeningInfo: DayOfWeekOpeningInfo.empty(shortText: "", fullText: ""),
    openingHour: OpeningHour.empty(),
    clickedDay: OpeningHour.empty(),
    restroomInfos: [(floor: 1, text: "남/여 화장실")],
  );
}
