import 'package:cafejari_flutter/data/remote/dto/push/push_response.dart';
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/remote/api_service.dart';

/// push 알림 저장소
abstract interface class PushRepository {
  Future<List<PushResponse>> fetchMyPush({required String accessToken});
}

/// push repository의 구현부
class PushRepositoryImpl implements PushRepository {
  final APIService service;

  PushRepositoryImpl(this.service);

  @override
  Future<List<PushResponse>> fetchMyPush({required String accessToken}) async {
    try {
      final List<dynamic> response = await service.request(
          method: HttpMethod.get,
          appLabel: "push",
          endpoint: "",
          accessToken: accessToken);
      return response.map((dynamic e) => PushResponse.fromJson(e)).toList();
    } on ErrorWithMessage {
      rethrow;
    } on TokenExpired {
      throw AccessTokenExpired();
    }
  }
}
