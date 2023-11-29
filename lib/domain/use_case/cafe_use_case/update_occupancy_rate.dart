import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/domain/use_case/util.dart';
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/repository/cafe_repository.dart';

/// update occupancy rate의 실제 구현부
class UpdateOccupancyRate {
  Future<OccupancyRateUpdate> call({
    required CafeRepository cafeRepository,
    required double occupancyRate,
    required int cafeFloorId,
    String? accessToken
  }) async {
    try {
      if(accessToken.isNull) {
        // 게스트 업데이트
        return parseOccupancyRateUpdateFromOccupancyRateUpdateResponse(
          updateResponse: await cafeRepository.postOccupancyRateAsGuest(
            occupancyRate: occupancyRate, cafeFloorId: cafeFloorId
          )
        );
      } else {
        // 유저 업데이트
        return parseOccupancyRateUpdateFromOccupancyRateUpdateResponse(
            updateResponse: await cafeRepository.postOccupancyRateAsUser(
              accessToken: accessToken!, occupancyRate: occupancyRate, cafeFloorId: cafeFloorId
            )
        );
      }
    } on ErrorWithMessage {
      rethrow;
    } on AccessTokenExpired {
      rethrow;
    }
  }
}