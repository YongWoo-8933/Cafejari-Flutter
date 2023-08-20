import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_state.freezed.dart';

@freezed
class RequestState with _$RequestState {
  factory RequestState(
      {required final String cafeName,
        required final String cafeAddress,
        required final List<String> maxFloor,
        required final List<String> minFloor,
        required final int maxFloorIndex,
        required final int minFloorIndex,
        required final bool tileExpand,
        required final OpeningHour openingHour,
        required final OpeningHour clickedDay
      }) = _RequestState;

  factory RequestState.empty() => RequestState(
    cafeName: "",
    cafeAddress: "",
      maxFloor: [],
      minFloor: [],
      maxFloorIndex: 1,
      minFloorIndex: 0,
      tileExpand: false,
      openingHour: OpeningHour.empty(),
      clickedDay: OpeningHour.empty());
}
