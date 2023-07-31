
import 'package:flutter/cupertino.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cafejari_flutter/domain/entity/cafe_info/cafe_info.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

part 'map_state.freezed.dart';

@freezed
class MapState with _$MapState {
  factory MapState(
      {required final PanelController bottomSheetController,
      required final CafeInfos cafeInfos,
      required final NMarker? selectedMarker,
      required final CafeInfo selectedCafeInfo,
      required final Cafe selectedCafe,
      required final NaverMapController? mapController,
      required final double updatedCrowded,
      required final IconData thumbIcons,
      required final PageController pageController,
      required final bool topVisible,
      required final bool topImageVisible,}) = _MapState;

  factory MapState.empty() => MapState(
      bottomSheetController: PanelController(),
      cafeInfos: [],
      selectedMarker: null,
      selectedCafeInfo: CafeInfo.empty(),
      selectedCafe: Cafe.empty(),
      mapController: null,
      updatedCrowded: 0,
      thumbIcons: CupertinoIcons.xmark_circle,
      pageController: PageController(initialPage: 0),
      topVisible: true,
      topImageVisible: false);
}
