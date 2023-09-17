import 'dart:convert';

import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/remote/api_service.dart';
import 'package:cafejari_flutter/data/remote/dto/cafe/cafe_response.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

/// cafe application api와 통신하는 저장소
abstract interface class CafeRepository {
  Future<List<CafeResponse>> fetchMapCafe(
      {required double latitude,
      required double longitude,
      required int zoomLevel});
  Future<CafeResponse> retrieveCafe({required int cafeId});
  Future<List<CafeSearchResponse>> fetchSearchCafe(
      {required String query});
  Future<List<OccupancyRateUpdateResponse>> fetchMyOccupancyUpdate(
      {required String accessToken});
  Future<List<OccupancyRateUpdateResponse>> fetchMyRecentOccupancyUpdate(
      {required String accessToken});
  Future<NaverSearchCafeResponse> fetchNaverSearchResult(
      {required String query});
  Future<List<LocationResponse>> fetchLocation();
  Future<List<CATIResponse>> fetchCATI({required int cafeId});

  Future<OccupancyRateUpdateResponse> postOccupancyRateAsUser(
      {required String accessToken,
      required double occupancyRate,
      required int cafeFloorId});
  Future<OccupancyRateUpdateResponse> postOccupancyRateAsGuest(
      {required double occupancyRate,
      required int cafeFloorId});
  Future<CATIResponse> postCATI(
      {required String accessToken,
      required int cafeId,
      required int openness,
      required int coffee,
      required int workspace,
      required int acidity});
}

/// cafe repository의 구현부
class CafeRepositoryImpl implements CafeRepository {
  APIService apiService;

  CafeRepositoryImpl(this.apiService);

  // get ///////////////////////////////////////////////////////////////////////////////////////////
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
  Future<CafeResponse> retrieveCafe({required int cafeId}) async {
    try {
      final dynamic response = await apiService.request(
        method: HttpMethod.get,
        appLabel: "cafe",
        endpoint: "$cafeId/",
      );
      return CafeResponse.fromJson(response);
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

  @override
  Future<NaverSearchCafeResponse> fetchNaverSearchResult({required String query}) async {
    try {
      Map<String, String> headers = {
        "Content-Type": "plain/text",
        "X-Naver-Client-Id": dotenv.env['NAVER_SEARCH_CLIENT_ID']!,
        "X-Naver-Client-Secret": dotenv.env['NAVER_SEARCH_SECRET']!
      };
      final stringQuery = {"query": query, "sort": "sim", "display": "10"};

      Response response = await get(
        Uri.https("openapi.naver.com", "/v1/search/local", stringQuery),
        headers: headers,
      );

      if (response.statusCode == 200) {
        dynamic res = jsonDecode(utf8.decode(response.bodyBytes));
        return NaverSearchCafeResponse.fromJson(res);
      } else {
        throw ErrorWithMessage(code: 0, message: "원인 모를 에러 발생");
      }
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<List<LocationResponse>> fetchLocation() async {
    try {
      final List<dynamic> response = await apiService.request(
        method: HttpMethod.get,
        appLabel: "cafe",
        endpoint: "location/"
      );
      return response.map((dynamic e) => LocationResponse.fromJson(e)).toList();
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<List<CATIResponse>> fetchCATI({required int cafeId}) async {
    try {
      final List<dynamic> response = await apiService.request(
        method: HttpMethod.get,
        appLabel: "cafe",
        endpoint: "cati/",
        query: {"cafe_id": cafeId}
      );
      return response.map((dynamic e) => CATIResponse.fromJson(e)).toList();
    } on ErrorWithMessage {
      rethrow;
    }
  }

  // post //////////////////////////////////////////////////////////////////////////////////////////
  @override
  Future<OccupancyRateUpdateResponse> postOccupancyRateAsUser({
    required String accessToken, required double occupancyRate, required int cafeFloorId
  }) async {
    try {
      final dynamic response = await apiService.request(
        method: HttpMethod.post,
        appLabel: "cafe",
        endpoint: "occupancy_update_log/user_registration/",
        accessToken: accessToken,
        body: {"occupancy_rate": occupancyRate, "cafe_floor_id": cafeFloorId}
      );
      return OccupancyRateUpdateResponse.fromJson(response);
    } on ErrorWithMessage {
      rethrow;
    } on TokenExpired {
      throw AccessTokenExpired();
    }
  }

  @override
  Future<OccupancyRateUpdateResponse> postOccupancyRateAsGuest({
    required double occupancyRate, required int cafeFloorId
  }) async {
    try {
      final dynamic response = await apiService.request(
          method: HttpMethod.post,
          appLabel: "cafe",
          endpoint: "occupancy_update_log/guest_registration/",
          body: {"occupancy_rate": occupancyRate, "cafe_floor_id": cafeFloorId}
      );
      return OccupancyRateUpdateResponse.fromJson(response);
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<CATIResponse> postCATI({
    required String accessToken,
    required int cafeId,
    required int openness,
    required int coffee,
    required int workspace,
    required int acidity
  }) async {
    try {
      final dynamic response = await apiService.request(
        method: HttpMethod.post,
        appLabel: "cafe",
        endpoint: "cati/",
        accessToken: accessToken,
        body: {
          "cafe_id": cafeId,
          "openness": openness,
          "coffee": coffee,
          "workspace": workspace,
          "acidity": acidity,
        }
      );
      return CATIResponse.fromJson(response);
    } on TokenExpired {
      throw AccessTokenExpired();
    } on ErrorWithMessage {
      rethrow;
    }
  }
}

