import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_cafe_state.freezed.dart';

@freezed
class MyCafeState with _$MyCafeState {
  factory MyCafeState({
    required final int catiOpennessSliderValue,
    required final int catiCoffeeSliderValue,
    required final int catiWorkspaceSliderValue,
    required final int catiAciditySliderValue,
    required final Cafes recommendedCafes
  }) = _MyCafeState;

  factory MyCafeState.empty() => MyCafeState(
    catiOpennessSliderValue: CATI.empty().openness,
    catiCoffeeSliderValue: CATI.empty().coffee,
    catiWorkspaceSliderValue: CATI.empty().workspace,
    catiAciditySliderValue: CATI.empty().acidity,
    recommendedCafes: [],
  );
}
