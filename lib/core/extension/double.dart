
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/ui/util/occupancy_level.dart';

/// double value에서 OccupancyLevel 객체를 뽑아냄.
extension GetOccupancyLevelFromDouble on double? {
  OccupancyLevel toOccupancyLevel() {
    if(this.isNull) {
      return OccupancyLevel.minus();
    } else {
      if(this! > 0.75) {
        return OccupancyLevel.three();
      } else if(this! > 0.5) {
        return OccupancyLevel.two();
      } else if(this! > 0.25) {
        return OccupancyLevel.one();
      } else {
        return OccupancyLevel.zero();
      }
    }
  }
}