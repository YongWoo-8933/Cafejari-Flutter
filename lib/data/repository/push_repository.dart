import 'package:cafejari_flutter/data/remote/dto/push/push_response.dart';
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/remote/api_service.dart';
import 'package:cafejari_flutter/data/repository/util.dart';
import 'package:cafejari_flutter/domain/entity/push/push.dart';
import 'package:cafejari_flutter/domain/repository.dart';

/// push repository의 구현부
class PushRepositoryImpl implements PushRepository {
  final APIService service;

  PushRepositoryImpl(this.service);

  @override
  Future<PopUps> fetchPopUp() async {
    try {
      final List<dynamic> response = await service.request(
          method: HttpMethod.get,
          appLabel: "push",
          endpoint: "pop_up/");
      final res = response.map((dynamic e) => PopUpResponse.fromJson(e)).toList();
      return res.map((e) => parsePopUpFromPopUpResponse(popUpResponse: e)).toList();
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<Pushes> fetchMyPush({required String accessToken}) async {
    try {
      final List<dynamic> response = await service.request(
        method: HttpMethod.get,
        appLabel: "push",
        endpoint: "",
        accessToken: accessToken);
      final res = response.map((dynamic e) => PushResponse.fromJson(e)).toList();
      return res.map((e) => parsePushFromPushResponse(pushResponse: e)).toList();
    } on ErrorWithMessage {
      rethrow;
    } on TokenExpired {
      throw AccessTokenExpired();
    }
  }

  @override
  Future<Push> readPush({required String accessToken, required int pushId}) async {
    try {
      final dynamic response = await service.request(
          method: HttpMethod.put,
          appLabel: "push",
          endpoint: "$pushId/read/",
          accessToken: accessToken);
      final res = PushResponse.fromJson(response);
      return parsePushFromPushResponse(pushResponse: res);
    } on ErrorWithMessage {
      rethrow;
    } on TokenExpired {
      throw AccessTokenExpired();
    }
  }
}
