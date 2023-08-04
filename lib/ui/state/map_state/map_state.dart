
import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

part 'map_state.freezed.dart';

@freezed
class MapState with _$MapState {
  factory MapState(
      {required final PanelController bottomSheetController,
      required final Cafes cafes,
      required final Cafe selectedCafe,
      required final CafeFloor selectedCafeFloor,
      required final NMarker? selectedMarker,
      required final NaverMapController? mapController,
      required final double updatedCrowded,
      required final IconData thumbIcons,
      required final PageController pageController,
      required final bool topVisible,
      required final bool topImageVisible,}) = _MapState;

  factory MapState.empty() => MapState(
      bottomSheetController: PanelController(),
      cafes: [],
      selectedCafe: Cafe.empty(),
      selectedCafeFloor: CafeFloor.empty(),
      selectedMarker: null,
      mapController: null,
      updatedCrowded: 0,
      thumbIcons: CupertinoIcons.xmark_circle,
      pageController: PageController(initialPage: 0),
      topVisible: true,
      topImageVisible: false);
}
