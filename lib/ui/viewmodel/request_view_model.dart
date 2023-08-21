
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:cafejari_flutter/domain/use_case/user_use_case.dart';
import 'package:cafejari_flutter/ui/state/my_page_state/my_page_state.dart';
import 'package:cafejari_flutter/ui/state/request_state/request_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/ui/viewmodel/global_view_model.dart';

class RequestViewModel extends StateNotifier<RequestState> {

  RequestViewModel() : super(RequestState.empty());

  setFloor() async {
    final maxfloors = ['B3', 'B2', 'B1', '1', '2', '3', '4', '5', '6'];
    final minfloors = ['B3', 'B2', 'B1', '1', '2', '3', '4', '5', '6'];
    state = state.copyWith(
        maxFloor: maxfloors,
        minFloor: minfloors,
        maxFloorIndex: 8,
        minFloorIndex: 0,
        openingHour: OpeningHour(
            mon: "07:00 - 22:00",
            tue: "07:00 - 22:00",
            wed: "07:00 - 22:00",
            thu: "07:00 - 22:00",
            fri: "07:00 - 22:00",
            sat: "07:00 - 22:00",
            sun: "08:00 - 21:00"),
      clickedDay: OpeningHour(mon: "true", tue: "false", wed: "false", thu: "false", fri: "false", sat: "false", sun: "false")
    );
  }

  // setCafe() async {
  //   // state = state.copyWith(cafeAddress: , cafeName: , floor: )
  // }


  minusMaxFloor(int minusFloor) => state = state.copyWith(maxFloorIndex: minusFloor);
  plusMaxFloor(int plusFloor) => state = state.copyWith(maxFloorIndex: plusFloor);
  minusMinFloor(int minusFloor) => state = state.copyWith(minFloorIndex: minusFloor);
  plusMinFloor(int plusFloor) => state = state.copyWith(minFloorIndex: plusFloor);
  selectMaxFloor(int selectedFloor){
    state = state.copyWith(maxFloorIndex: selectedFloor);
  }
  selectMinFloor(int selectedFloor){
    state = state.copyWith(minFloorIndex: selectedFloor);
  }
  setTileExpand(bool expand){
    state = state.copyWith(tileExpand: expand);
  }
  setOpeningHour(OpeningHour setHour){
    state = state.copyWith(openingHour: setHour);
  }
  setDayClicked(OpeningHour setClicked){
    state = state.copyWith(clickedDay: setClicked);
  }

}
