import 'dart:convert';

import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/remote/api_service.dart';
import 'package:cafejari_flutter/data/remote/dto/leader/leaderboard_response.dart';
import 'package:http/http.dart';

/// leader application api와 통신하는 저장소
abstract class LeaderRepository {
  Future<List<LeaderResponse>> fetchMonthLeaderBoard({
    required String accessToken,
  });
  Future<List<LeaderResponse>> fetchWeekLeaderBoard({
    required String accessToken,
  });
}

/// leader repository의 구현부
class LeaderRepositoryImpl implements LeaderRepository {
  APIService apiService;

  LeaderRepositoryImpl(this.apiService);

  @override
  Future<List<LeaderResponse>> fetchMonthLeaderBoard({
    required String accessToken,
  }) async {
    try {
      final List<dynamic> response = await apiService.request(
        method: HttpMethod.get,
        appLabel: "user",
        endpoint: "month_leader/",
        accessToken: accessToken,
      );
      return response.map((dynamic e) => LeaderResponse.fromJson(e)).toList();
    } on ErrorWithMessage {
      rethrow;
    } on TokenExpired {
      throw AccessTokenExpired();
    }
  }

  Future<List<LeaderResponse>> fetchWeekLeaderBoard({
    required String accessToken,
  }) async {
    try {
      final List<dynamic> response = await apiService.request(
        method: HttpMethod.get,
        appLabel: "user",
        endpoint: "week_leader/",
        accessToken: accessToken,
      );
      return response.map((dynamic e) => LeaderResponse.fromJson(e)).toList();
    } on ErrorWithMessage {
      rethrow;
    } on TokenExpired {
      throw AccessTokenExpired();
    }
  }

}
