
import 'package:cafejari_flutter/data/remote/dto/cafe_log/cafe_log_response.dart';
import 'package:cafejari_flutter/data/repository/cafe_log_repository.dart';
import 'package:cafejari_flutter/domain/entity/cafe_log/cafe_log.dart';
import 'package:cafejari_flutter/domain/entity/pagination.dart';
import 'package:cafejari_flutter/domain/use_case/util.dart';
import 'package:cafejari_flutter/core/exception.dart';


enum GetCafeLogType { recent, hot, my }

/// getCafeLogs의 실제 구현부
class GetCafeLogs {
  Future<Pagination<CafeLog>> call({
    required CafeLogRepository cafeLogRepository,
    required GetCafeLogType type,
    String accessToken = ""}) async {
    try {
      CafeLogPageResponse cafeLogPageResponse;
      switch(type) {
        case GetCafeLogType.recent:
          cafeLogPageResponse = await cafeLogRepository.fetchRecentCafeLog();
        case GetCafeLogType.hot:
          cafeLogPageResponse = await cafeLogRepository.fetchHotCafeLog();
        case GetCafeLogType.my:
          cafeLogPageResponse = await cafeLogRepository.fetchMyCafeLog(accessToken: accessToken);
      }
      return Pagination(
        count: cafeLogPageResponse.count,
        nextPageUrl: cafeLogPageResponse.next,
        previousPageUrl: cafeLogPageResponse.previous,
        results: cafeLogPageResponse.results.map((e) {
          return parseCafeLogFromCafeLogResponse(cafeLogResponse: e);}).toList()
      );
    } on AccessTokenExpired {
      rethrow;
    } on ErrorWithMessage {
      rethrow;
    }
  }
}