
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/remote/api_service.dart';
import 'package:cafejari_flutter/data/remote/dto/request/request_response.dart';

/// 각종 request 저장소
abstract interface class RequestRepository {
  Future<List<CafeAdditionRequestResponse>> fetchMyCafeAdditionRequest({required String accessToken});
}

/// request repository의 구현부
class RequestRepositoryImpl implements RequestRepository {
  final APIService service;

  RequestRepositoryImpl(this.service);

  @override
  Future<List<CafeAdditionRequestResponse>> fetchMyCafeAdditionRequest({required String accessToken}) async {
    try {
      final List<dynamic> response = await service.request(
          method: HttpMethod.get,
          appLabel: "request",
          endpoint: "cafe_addition/",
          accessToken: accessToken);
      return response.map((dynamic e) => CafeAdditionRequestResponse.fromJson(e)).toList();
    } on ErrorWithMessage {
      rethrow;
    } on TokenExpired {
      throw AccessTokenExpired();
    }
  }
}