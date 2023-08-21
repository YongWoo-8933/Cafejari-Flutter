import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/remote/api_service.dart';
import 'package:cafejari_flutter/data/remote/dto/cafe/cafe_response.dart';

/// cafe application api와 통신하는 저장소
abstract interface class CafeRepository {
  Future<List<CafeResponse>> fetchMapCafe(
      {required double latitude,
      required double longitude,
      required int zoomLevel});

  Future<List<CafeSearchResponse>> fetchSearchCafe(
      {required String query});

  Future<List<OccupancyRateUpdateResponse>> fetchMyOccupancyUpdate(
      {required String accessToken});

  Future<List<OccupancyRateUpdateResponse>> fetchMyRecentOccupancyUpdate(
      {required String accessToken});
}

/// cafe repository의 구현부
class CafeRepositoryImpl implements CafeRepository {
  APIService apiService;

  CafeRepositoryImpl(this.apiService);

  @override
  Future<List<CafeResponse>> fetchMapCafe(
      {required double latitude,
      required double longitude,
      required int zoomLevel}) async {
    try {
      final List<dynamic> response = await apiService.request(
        method: HttpMethod.get,
        appLabel: "cafe",
        endpoint: "",
        query: {"latitude": latitude, "longitude": longitude, "zoom_level": zoomLevel},
      );
      return response.map((dynamic e) => CafeResponse.fromJson(e)).toList();
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<List<CafeSearchResponse>> fetchSearchCafe({required String query}) async {
    try {
      final List<dynamic> response = await apiService.request(
        method: HttpMethod.get,
        appLabel: "cafe",
        endpoint: "search/",
        query: {"query": query},
      );
      return response.map((dynamic e) => CafeSearchResponse.fromJson(e)).toList();
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<List<OccupancyRateUpdateResponse>> fetchMyOccupancyUpdate({required String accessToken}) async {
    try {
      final List<dynamic> response = await apiService.request(
        method: HttpMethod.get,
        appLabel: "cafe",
        endpoint: "occupancy_update_log/",
        accessToken: accessToken);
      return response.map((dynamic e) => OccupancyRateUpdateResponse.fromJson(e)).toList();
    } on ErrorWithMessage {
      rethrow;
    } on TokenExpired {
      throw AccessTokenExpired();
    }
  }

  @override
  Future<List<OccupancyRateUpdateResponse>> fetchMyRecentOccupancyUpdate({required String accessToken}) async {
    try {
      final List<dynamic> response = await apiService.request(
          method: HttpMethod.get,
          appLabel: "cafe",
          endpoint: "occupancy_update_log/recent_update_log/",
          accessToken: accessToken);
      return response.map((dynamic e) => OccupancyRateUpdateResponse.fromJson(e)).toList();
    } on ErrorWithMessage {
      rethrow;
    } on TokenExpired {
      throw AccessTokenExpired();
    }
  }
}

