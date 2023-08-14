
import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/remote/dto/cafe/cafe_response.dart';
import 'package:cafejari_flutter/data/repository/cafe_repository.dart';
import 'package:cafejari_flutter/domain/use_case/util.dart';

enum GetMyOccupancyUpdateType { recent, all }

/// getMyOccupancyUpdates의 실제 구현부
class GetMyOccupancyUpdates {
  Future<OccupancyRateUpdates> call({
    required CafeRepository cafeRepository,
    required String accessToken,
    required GetMyOccupancyUpdateType type}) async {
    try {
      List<OccupancyRateUpdateResponse> updateResponseList;
      switch(type) {
        case GetMyOccupancyUpdateType.all:
          updateResponseList = await cafeRepository.fetchMyOccupancyUpdate(accessToken: accessToken);
        case GetMyOccupancyUpdateType.recent:
          updateResponseList = await cafeRepository.fetchMyRecentOccupancyUpdate(accessToken: accessToken);
      }
      return updateResponseList.map((e) {
        return parseOccupancyRateUpdateFromOccupancyRateUpdateResponse(updateResponse: e);
      }).toList();
    } on ErrorWithMessage {
      rethrow;
    }
  }
}