import 'dart:convert';

import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/remote/api_service.dart';
import 'package:cafejari_flutter/data/remote/dto/user/user_response.dart';
import 'package:http/http.dart';

/// user application api와 통신하는 저장소
abstract class UserRepository {
  Future<UserResponse> fetchUserProfile({
    required String accessToken,
  });
}

/// user repository의 구현부
class UserRepositoryImpl implements UserRepository {
  APIService apiService;
  UserRepositoryImpl(this.apiService);

  @override
  Future<UserResponse> fetchUserProfile({
    required String accessToken,
  }) async {
    try {
      dynamic response = await apiService.request(
        method: HttpMethod.get,
        appLabel: "user",
        endpoint: "user/",
        accessToken: accessToken,
      );
      return UserResponse.fromJson(response);
    } on ErrorWithMessage {
      rethrow;
    } on TokenExpired {
      throw AccessTokenExpired();
    }
  }

}
