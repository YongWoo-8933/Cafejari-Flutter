import 'package:cafejari_flutter/data/remote/dto/push/push_response.dart';
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/remote/api_service.dart';

/// push 알림 저장소
abstract interface class PushRepository {
  Future<List<PopUpResponse>> fetchPopUp();
  Future<List<PushResponse>> fetchMyPush({required String accessToken});
  Future<PushResponse> readPush({required String accessToken, required int pushId});
}

/// push repository의 구현부
class PushRepositoryImpl implements PushRepository {
  final APIService service;

  PushRepositoryImpl(this.service);

  @override
  Future<List<PopUpResponse>> fetchPopUp() async {
    try {
      final List<dynamic> response = await service.request(
          method: HttpMethod.get,
          appLabel: "push",
          endpoint: "pop_up/");
      return response.map((dynamic e) => PopUpResponse.fromJson(e)).toList();
    } on ErrorWithMessage {
      rethrow;
    }
  }

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

  @override
  Future<PushResponse> readPush({required String accessToken, required int pushId}) async {
    try {
      final dynamic response = await service.request(
          method: HttpMethod.put,
          appLabel: "push",
          endpoint: "$pushId/read/",
          accessToken: accessToken);
      return PushResponse.fromJson(response);
    } on ErrorWithMessage {
      rethrow;
    } on TokenExpired {
      throw AccessTokenExpired();
    }
  }
}
