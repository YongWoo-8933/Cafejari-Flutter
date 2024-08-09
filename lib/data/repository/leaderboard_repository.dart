import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/remote/api_service.dart';
import 'package:cafejari_flutter/data/remote/dto/leaderboard/leaderboard_response.dart';
import 'package:cafejari_flutter/data/repository/util.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:cafejari_flutter/domain/repository.dart';

/// leader repository의 구현부
class LeaderboardRepositoryImpl implements LeaderboardRepository {
  APIService apiService;

  LeaderboardRepositoryImpl(this.apiService);

  @override
  Future<PartialUsers> fetchMonthRanker() async {
    try {
      final List<dynamic> response = await apiService.request(
        method: HttpMethod.get,
        appLabel: "leaderboard",
        endpoint: "month_sharing_ranker/"
      );
      final res = response.map((dynamic e) => RankerResponse.fromJson(e)).toList();
      return res.map((e) {
        return parsePartialUserFromPartialUserResponse(
          partialUserResponse: e.user,
          updateCount: e.sharing_count
        );
      }).toList();
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<PartialUsers> fetchTotalRanker() async {
    try {
      final List<dynamic> response = await apiService.request(
          method: HttpMethod.get,
          appLabel: "leaderboard",
          endpoint: "total_sharing_ranker/"
      );
      final res = response.map((dynamic e) => RankerResponse.fromJson(e)).toList();
      return res.map((e) {
        return parsePartialUserFromPartialUserResponse(
          partialUserResponse: e.user,
          updateCount: e.sharing_count
        );
      }).toList();
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<PartialUsers> fetchWeekRanker() async {
    try {
      final List<dynamic> response = await apiService.request(
          method: HttpMethod.get,
          appLabel: "leaderboard",
          endpoint: "week_sharing_ranker/"
      );
      final res = response.map((dynamic e) => RankerResponse.fromJson(e)).toList();
      return res.map((e) {
        return parsePartialUserFromPartialUserResponse(
          partialUserResponse: e.user,
          updateCount: e.sharing_count
        );
      }).toList();
    } on ErrorWithMessage {
      rethrow;
    }
  }
}
