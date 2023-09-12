import 'package:cafejari_flutter/data/remote/dto/cafe/cafe_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

/// 토큰 관련 DTO
@JsonSerializable()
class TokenResponse {

  final String access;

  TokenResponse({required this.access});

  factory TokenResponse.fromJson(Map<String, dynamic> json) => _$TokenResponseFromJson(json);
}

/// 서버에서 받아오는 사용자 객체 DTO
@JsonSerializable()
class UserResponse {
  final int id;
  final ProfileResponse? profile;
  final bool is_superuser, is_active;
  final String date_joined, last_login;
  final String? email;

  UserResponse({
    required this.id,
    required this.profile,
    required this.last_login,
    required this.is_superuser,
    required this.is_active,
    required this.date_joined,
    required this.email
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);
}

@JsonSerializable()
class ProfileResponse {
  final int id, point;
  final String nickname;
  final int? gender;
  final String? age_range, date_of_birth, phone_number, fcm_token;
  final bool marketing_push_enabled, occupancy_push_enabled, log_push_enabled;
  final GradeResponse grade;
  final ProfileImageResponse profile_image;
  final List<CafeResponse> favorite_cafe;

  ProfileResponse({
    required this.id,
    required this.point,
    required this.gender,
    required this.nickname,
    required this.grade,
    required this.profile_image,
    required this.age_range,
    required this.date_of_birth,
    required this.phone_number,
    required this.fcm_token,
    required this.marketing_push_enabled,
    required this.occupancy_push_enabled,
    required this.log_push_enabled,
    required this.favorite_cafe,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) => _$ProfileResponseFromJson(json);
}


@JsonSerializable()
class GradeResponse {
  final int id, step, sharing_count_requirement, sharing_restriction_per_cafe, activity_stack_restriction_per_day;
  final String name;
  final String? image, description;

  GradeResponse({
    required this.id,
    required this.step,
    required this.sharing_count_requirement,
    required this.sharing_restriction_per_cafe,
    required this.activity_stack_restriction_per_day,
    required this.image,
    required this.name,
    required this.description,
  });

  factory GradeResponse.fromJson(Map<String, dynamic> json) => _$GradeResponseFromJson(json);
}

@JsonSerializable()
class ProfileImageResponse {
  final int id;
  final String image;
  final bool is_default;

  ProfileImageResponse({
    required this.id,
    required this.image,
    required this.is_default
  });

  factory ProfileImageResponse.fromJson(Map<String, dynamic> json) => _$ProfileImageResponseFromJson(json);
}

@JsonSerializable()
class PartialUserResponse {
  final int id ;
  final PartialProfileResponse profile;
  final String date_joined;

  PartialUserResponse(
      {required this.id,
        required this.profile,
        required this.date_joined});

  factory PartialUserResponse.fromJson(Map<String, dynamic> json) =>
      _$PartialUserResponseFromJson(json);
}

@JsonSerializable()
class PartialProfileResponse {
  final int id ;
  final String nickname;
  final GradeResponse grade;
  final ProfileImageResponse profile_image;

  PartialProfileResponse(
      {required this.id,
        required this.nickname,
        required this.grade,
        required this.profile_image});

  factory PartialProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$PartialProfileResponseFromJson(json);
}

@JsonSerializable()
class NicknameResponse {
  final String nickname;

  NicknameResponse(
      {required this.nickname});

  factory NicknameResponse.fromJson(Map<String, dynamic> json) =>
      _$NicknameResponseFromJson(json);
}

/// 로그인, 회원가입에 필요한 응답 DTO
@JsonSerializable()
class KakaoLoginCallbackResponse {
  final String access_token;
  final bool user_exists;
  final bool is_inactive;

  KakaoLoginCallbackResponse({
    required this.access_token,
    required this.user_exists,
    required this.is_inactive,
  });

  factory KakaoLoginCallbackResponse.fromJson(Map<String, dynamic> json) => _$KakaoLoginCallbackResponseFromJson(json);
}

@JsonSerializable()
class AppleLoginCallbackResponse {
  final String id_token;
  final String code;
  final bool user_exists;
  final bool is_inactive;

  AppleLoginCallbackResponse({
    required this.id_token,
    required this.code,
    required this.user_exists,
    required this.is_inactive,
  });

  factory AppleLoginCallbackResponse.fromJson(Map<String, dynamic> json) => _$AppleLoginCallbackResponseFromJson(json);
}

@JsonSerializable()
class LoginResponse {
  final String access, refresh;
  final UserResponse user;

  LoginResponse({
    required this.access,
    required this.refresh,
    required this.user
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
}
