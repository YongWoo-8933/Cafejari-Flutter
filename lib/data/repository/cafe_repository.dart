import 'dart:convert';
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/data/remote/api_service.dart';
import 'package:cafejari_flutter/data/remote/dto/cafe/cafe_response.dart';
import 'package:cafejari_flutter/data/repository/util.dart';
import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/domain/repository.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:http/http.dart';

final String _naverSearchClientId = dotenv.env['NAVER_SEARCH_CLIENT_ID']!;
final String _naverSearchSecret = dotenv.env['NAVER_SEARCH_SECRET']!;

/// cafe repository의 구현부
class CafeRepositoryImpl implements CafeRepository {
  APIService apiService;

  CafeRepositoryImpl(this.apiService);

  // get ///////////////////////////////////////////////////////////////////////////////////////////
  @override
  Future<Cafes> fetchMapCafe(
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
      final res = response.map((dynamic e) => CafeResponse.fromJson(e)).toList();
      return res.map((e) => parseCafeFromCafeResponse(e)).toList();
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<Cafe> retrieveCafe({required int cafeId}) async {
    try {
      final dynamic response = await apiService.request(
        method: HttpMethod.get,
        appLabel: "cafe",
        endpoint: "$cafeId/",
      );
      final res = CafeResponse.fromJson(response);
      return parseCafeFromCafeResponse(res);
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<Cafes> fetchSearchCafe({required String query, double? latitude, double? longitude}) async {
    try {
      var queryMap = {"query": query};
      if(latitude.isNotNull && longitude.isNotNull) {
        queryMap.addAll({"latitude": latitude!.toString(), "longitude": longitude!.toString()});
      }
      final List<dynamic> response = await apiService.request(
        method: HttpMethod.get,
        appLabel: "cafe",
        endpoint: "search/",
        query: queryMap
      );
      final res = response.map((dynamic e) => CafeSearchResponse.fromJson(e)).toList();
      return res.map((cafeSearchResponse) {
        return Cafe.empty().copyWith(
          id: cafeSearchResponse.id,
          name: cafeSearchResponse.name,
          address: cafeSearchResponse.address,
          latLng: NLatLng(cafeSearchResponse.latitude, cafeSearchResponse.longitude)
        );
      }).toList();
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<Cafes> fetchRecommendedCafe({required double latitude, required double longitude}) async {
    try {
      final List<dynamic> response = await apiService.request(
        method: HttpMethod.get,
        appLabel: "cafe",
        endpoint: "recommendation/",
        query: {"latitude": latitude, "longitude": longitude},
      );
      final res = response.map((dynamic e) => CafeResponse.fromJson(e)).toList();
      return res.map((cafeResponse) {
        return parseCafeFromCafeResponse(cafeResponse);
      }).toList();
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<OccupancyRateUpdates> fetchMyOccupancyUpdate({required String accessToken}) async {
    try {
      final List<dynamic> response = await apiService.request(
        method: HttpMethod.get,
        appLabel: "cafe",
        endpoint: "occupancy_update_log/",
        accessToken: accessToken);
      final res = response.map((dynamic e) => OccupancyRateUpdateResponse.fromJson(e)).toList();
      return res.map((e) {
        return parseOccupancyRateUpdateFromOccupancyRateUpdateResponse(updateResponse: e);
      }).toList();
    } on ErrorWithMessage {
      rethrow;
    } on TokenExpired {
      throw AccessTokenExpired();
    }
  }

  @override
  Future<Map<int, OccupancyRateUpdates>> fetchMyTodayOccupancyUpdate({required String accessToken}) async {
    try {
      final List<dynamic> response = await apiService.request(
        method: HttpMethod.get,
        appLabel: "cafe",
        endpoint: "occupancy_update_log/today_updated_log/",
        accessToken: accessToken);
      final res = response.map((dynamic e) => OccupancyRateUpdateResponse.fromJson(e)).toList();
      Map<int, OccupancyRateUpdates> categorizedOccupancies = {};
      for (OccupancyRateUpdateResponse response in res) {
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
    } on TokenExpired {
      throw AccessTokenExpired();
    }
  }

  @override
  Future<NaverSearchCafes> fetchNaverSearchResult({required String query}) async {
    try {
      Map<String, String> headers = {
        "Content-Type": "plain/text",
        "X-Naver-Client-Id": _naverSearchClientId,
        "X-Naver-Client-Secret": _naverSearchSecret
      };
      final stringQuery = {"query": query, "sort": "sim", "display": "10"};

      Response response = await get(
        Uri.https("openapi.naver.com", "/v1/search/local", stringQuery),
        headers: headers,
      );
      if (response.statusCode == 200) {
        NaverSearchCafeResponse res = NaverSearchCafeResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        return res.items.map((e) {
          return NaverSearchCafe(
            name: e.title,
            roadAddress: e.roadAddress,
            dongAddress: e.address,
            latitude: double.parse(e.mapy.substring(0, 2)) + double.parse("0.${e.mapy.substring(2)}"),
            longitude: double.parse(e.mapx.substring(0, 3)) + double.parse("0.${e.mapx.substring(3)}")
          );
        }).toList();
      } else {
        throw ErrorWithMessage(code: 0, message: "원인 모를 에러 발생");
      }
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<Locations> fetchLocation() async {
    try {
      final List<dynamic> response = await apiService.request(
        method: HttpMethod.get,
        appLabel: "cafe",
        endpoint: "location/"
      );
      final res = response.map((dynamic e) => LocationResponse.fromJson(e)).toList();
      final Locations locations = res.map((e) {
        return Location(
          name: e.name,
          imageUrl: e.image,
          latitude: e.latitude,
          longitude: e.longitude
        );
      }).toList();
      locations.sort((a, b) => a.name.compareTo(b.name));
      return locations;
    } on ErrorWithMessage {
      rethrow;
    }
  }

  // post //////////////////////////////////////////////////////////////////////////////////////////
  @override
  Future<OccupancyRateUpdate> postOccupancyRateAsUser({
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
      final res = OccupancyRateUpdateResponse.fromJson(response);
      return parseOccupancyRateUpdateFromOccupancyRateUpdateResponse(updateResponse: res);
    } on ErrorWithMessage {
      rethrow;
    } on TokenExpired {
      throw AccessTokenExpired();
    }
  }

  @override
  Future<OccupancyRateUpdate> postOccupancyRateAsGuest({
    required double occupancyRate, required int cafeFloorId
  }) async {
    try {
      final dynamic response = await apiService.request(
          method: HttpMethod.post,
          appLabel: "cafe",
          endpoint: "occupancy_update_log/guest_registration/",
          body: {"occupancy_rate": occupancyRate, "cafe_floor_id": cafeFloorId}
      );
      final res = OccupancyRateUpdateResponse.fromJson(response);
      return parseOccupancyRateUpdateFromOccupancyRateUpdateResponse(updateResponse: res);
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<void> postCATI({
    required String accessToken,
    required int cafeId,
    required int openness,
    required int coffee,
    required int workspace,
    required int acidity
  }) async {
    try {
      await apiService.request(
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
    } on TokenExpired {
      throw AccessTokenExpired();
    } on ErrorWithMessage {
      rethrow;
    }
  }
}

