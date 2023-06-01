
import 'package:cafejari_flutter/ui/util/crowded.dart';

/// int value에서 Crowded 객체를 뽑아냄. (0~4 이외의 값은 -1로 처리)
extension GetCrowdedFromInt on int {
  Crowded toCrowded() {
    switch(this) {
      case 0:
        return Crowded.zero();
      case 1:
        return Crowded.one();
      case 2:
        return Crowded.two();
      case 3:
        return Crowded.three();
      case 4:
        return Crowded.four();
      default:
        return Crowded.minus();
    }
  }
}