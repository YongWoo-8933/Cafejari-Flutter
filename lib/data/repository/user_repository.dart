
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/remote/api_service.dart';
import 'package:cafejari_flutter/data/remote/dto/user/user_response.dart';

/// user application api와 통신하는 저장소
abstract class UserRepository {
  // GET
  Future<KakaoLoginCallbackResponse> kakaoLogin({required String accessToken});
  Future<LoginResponse> kakaoLoginFinish({required String accessToken});
  Future<List<GradeResponse>> fetchGrade();
  Future<NicknameResponse> validateNickname({required String nickname});
  Future<NicknameResponse> autoGenerateNickname();
  Future<UserResponse> fetchUser({required String accessToken});
  Future<List<ProfileImageResponse>> fetchProfileImage();
  // POST
  Future<UserResponse> makeNewProfile({
    required String accessToken,
    required String fcmToken,
    required String nickname,
    required int userId,
    required int profileImageId
  });
}

/// user repository의 구현부
class UserRepositoryImpl implements UserRepository {
  APIService apiService;

  UserRepositoryImpl(this.apiService);

  // GET
  @override
  Future<KakaoLoginCallbackResponse> kakaoLogin({required String accessToken}) async {
    try {
      dynamic response = await apiService.request(
          method: HttpMethod.post,
          appLabel: "user",
          endpoint: "kakao/login/callback/",
          body: {"access_token": accessToken}
      );
      return KakaoLoginCallbackResponse.fromJson(response);
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<LoginResponse> kakaoLoginFinish({required String accessToken}) async {
    try {
      dynamic response = await apiService.request(
          method: HttpMethod.post,
          appLabel: "user",
          endpoint: "kakao/login/finish/",
          body: {"access_token": accessToken}
      );
      return LoginResponse.fromJson(response);
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<List<GradeResponse>> fetchGrade() async {
    try {
      List<dynamic> response = await apiService.request(
          method: HttpMethod.get,
          appLabel: "user",
          endpoint: "grade/"
      );
      return response.map((dynamic e) => GradeResponse.fromJson(e)).toList();
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<UserResponse> fetchUser({required String accessToken}) async {
    try {
      dynamic response = await apiService.request(
          method: HttpMethod.get,
          appLabel: "user",
          endpoint: "user/",
          accessToken: accessToken
      );
      return UserResponse.fromJson(response);
    } on ErrorWithMessage {
      rethrow;
    } on TokenExpired {
      throw AccessTokenExpired();
    }
  }

  @override
  Future<NicknameResponse> validateNickname({required String nickname}) async {
    try {
      dynamic response = await apiService.request(
          method: HttpMethod.get,
          appLabel: "user",
          endpoint: "profile/validate_nickname/",
          query: {"nickname": nickname}
      );
      return NicknameResponse.fromJson(response);
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<NicknameResponse> autoGenerateNickname() async {
    try {
      dynamic response = await apiService.request(
          method: HttpMethod.get,
          appLabel: "user",
          endpoint: "profile/auto_generate_nickname/"
      );
      return NicknameResponse.fromJson(response);
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<List<ProfileImageResponse>> fetchProfileImage() async {
    try {
      List<dynamic> response = await apiService.request(
          method: HttpMethod.get,
          appLabel: "user",
          endpoint: "profile_image/"
      );
      return response.map((dynamic e) => ProfileImageResponse.fromJson(e)).toList();
    } on ErrorWithMessage {
      rethrow;
    }
  }

  // POST
  @override
  Future<UserResponse> makeNewProfile({
    required String accessToken,
    required String fcmToken,
    required String nickname,
    required int userId,
    required int profileImageId}) async {
    try {
      dynamic response = await apiService.request(
        method: HttpMethod.post,
        appLabel: "user",
        endpoint: "$userId/make_new_profile/",
        accessToken: accessToken,
        body: {"nickname": nickname, "profile_image_id": profileImageId, "fcm_token": fcmToken}
      );
      return UserResponse.fromJson(response);
    } on ErrorWithMessage {
      rethrow;
    } on TokenExpired {
      throw AccessTokenExpired();
    }
  }
}