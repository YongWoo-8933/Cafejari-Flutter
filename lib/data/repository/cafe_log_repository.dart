import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/remote/api_service.dart';
import 'package:cafejari_flutter/data/remote/dto/cafe/cafe_response.dart';

/// cafe application api와 통신하는 저장소
abstract interface class CafeRepository {
  Future<List<CafeInfoResponse>> fetchCafeInfo(
      {required String accessToken,
      required double latitude,
      required double longitude,
      required int zoomLevel});
}

/// cafe repository의 구현부
class CafeRepositoryImpl implements CafeRepository {
  APIService apiService;

  CafeRepositoryImpl(this.apiService);

  @override
  Future<List<CafeInfoResponse>> fetchCafeInfo(
      {required String accessToken,
      required double latitude,
      required double longitude,
      required int zoomLevel}) async {
    try {
      final List<dynamic> response = await apiService.request(
        method: HttpMethod.get,
        appLabel: "cafe",
        endpoint: "cafe_info/nearby_cafe_info/",
        accessToken: accessToken,
        query: {"latitude": latitude, "longitude": longitude, "zoom_level": zoomLevel},
      );
      return response.map((dynamic e) => CafeInfoResponse.fromJson(e)).toList();
    } on ErrorWithMessage {
      rethrow;
    } on TokenExpired {
      throw AccessTokenExpired();
    }
  }
}

