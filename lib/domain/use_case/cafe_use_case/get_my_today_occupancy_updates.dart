
import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/remote/dto/cafe/cafe_response.dart';
import 'package:cafejari_flutter/data/repository/cafe_repository.dart';
import 'package:cafejari_flutter/domain/use_case/util.dart';


/// getMyOccupancyUpdates의 실제 구현부
class GetMyOccupancyUpdates {
  Future<Map<int, OccupancyRateUpdates>> call({
    required CafeRepository cafeRepository,
    required String accessToken
  }) async {
    try {
      List<OccupancyRateUpdateResponse> updateResponseList;
      updateResponseList = await cafeRepository.fetchMyTodayOccupancyUpdate(accessToken: accessToken);
      Map<int, OccupancyRateUpdates> categorizedOccupancies = {};

      for (OccupancyRateUpdateResponse response in updateResponseList) {
        final int cafeFloorId = response.cafe_floor.id;
        if (!categorizedOccupancies.containsKey(cafeFloorId)) {
          categorizedOccupancies[cafeFloorId] = [];
        }
        categorizedOccupancies[cafeFloorId]?.add(
          parseOccupancyRateUpdateFromOccupancyRateUpdateResponse(updateResponse: response)
        );
      }
      return categorizedOccupancies;
    } on ErrorWithMessage {
      rethrow;
    } on AccessTokenExpired {
      rethrow;
    }
  }
}