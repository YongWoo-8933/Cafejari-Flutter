
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/remote/api_service.dart';
import 'package:cafejari_flutter/data/remote/dto/leaderboard/leaderboard_response.dart';

/// leader application api와 통신하는 저장소
abstract class LeaderboardRepository {
  Future<List<RankerResponse>> fetchMonthRanker();
  Future<List<RankerResponse>> fetchWeekRanker();
  Future<List<RankerResponse>> fetchTotalRanker();
  Future<List<MonthlyHotCafeLogResponse>> fetchMonthlyHotCafeLog();
}

/// leader repository의 구현부
class LeaderboardRepositoryImpl implements LeaderboardRepository {
  APIService apiService;

  LeaderboardRepositoryImpl(this.apiService);

  @override
  Future<List<RankerResponse>> fetchMonthRanker() async {
    try {
      final List<dynamic> response = await apiService.request(
        method: HttpMethod.get,
        appLabel: "leaderboard",
        endpoint: "month_sharing_ranker/"
      );
      return response.map((dynamic e) => RankerResponse.fromJson(e)).toList();
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<List<MonthlyHotCafeLogResponse>> fetchMonthlyHotCafeLog() async {
    try {
      final List<dynamic> response = await apiService.request(
          method: HttpMethod.get,
          appLabel: "leaderboard",
          endpoint: "monthly_hot_cafe_log/"
      );
      return response.map((dynamic e) => MonthlyHotCafeLogResponse.fromJson(e)).toList();
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<List<RankerResponse>> fetchTotalRanker() async {
    try {
      final List<dynamic> response = await apiService.request(
          method: HttpMethod.get,
          appLabel: "leaderboard",
          endpoint: "total_sharing_ranker/"
      );
      return response.map((dynamic e) => RankerResponse.fromJson(e)).toList();
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<List<RankerResponse>> fetchWeekRanker() async {
    try {
      final List<dynamic> response = await apiService.request(
          method: HttpMethod.get,
          appLabel: "leaderboard",
          endpoint: "week_sharing_ranker/"
      );
      return response.map((dynamic e) => RankerResponse.fromJson(e)).toList();
    } on ErrorWithMessage {
      rethrow;
    }
  }
}
