import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/remote/api_service.dart';
import 'package:cafejari_flutter/data/remote/dto/cafe_log/cafe_log_response.dart';

/// cafe log application api와 통신하는 저장소
abstract interface class CafeLogRepository {
  Future<CafeLogPageResponse> fetchRecentCafeLog();

  Future<CafeLogPageResponse> fetchHotCafeLog();

  Future<CafeLogPageResponse> fetchMyCafeLog({required String accessToken});
}

/// cafe log repository의 구현부
class CafeLogRepositoryImpl implements CafeLogRepository {
  APIService apiService;

  CafeLogRepositoryImpl(this.apiService);

  @override
  Future<CafeLogPageResponse> fetchRecentCafeLog() async {
    try {
      final dynamic response = await apiService.request(
        method: HttpMethod.get,
        appLabel: "cafe_log",
        endpoint: "",
      );
      return CafeLogPageResponse.fromJson(response);
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<CafeLogPageResponse> fetchHotCafeLog() async {
    try {
      final dynamic response = await apiService.request(
        method: HttpMethod.get,
        appLabel: "cafe_log",
        endpoint: "hot_cafe_log/"
      );
      return CafeLogPageResponse.fromJson(response);
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<CafeLogPageResponse> fetchMyCafeLog({required String accessToken}) async {
    try {
      final dynamic response = await apiService.request(
        method: HttpMethod.get,
        appLabel: "cafe_log",
        endpoint: "my_cafe_log/",
        accessToken: accessToken
      );
      return CafeLogPageResponse.fromJson(response);
    } on ErrorWithMessage {
      rethrow;
    } on TokenExpired {
      throw AccessTokenExpired();
    }
  }
}

