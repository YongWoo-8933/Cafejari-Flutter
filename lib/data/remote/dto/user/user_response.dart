import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

/// 서버에서 받아오는 사용자 객체 DTO
@JsonSerializable()
class UserResponse {
  final int id;
  final ProfileResponse? profile;
  final bool is_superuser, is_staff, is_active, authorization;
  final String last_login, date_joined, email;

  UserResponse({
    required this.id,
    required this.profile,
    required this.last_login,
    required this.is_superuser,
    required this.is_staff,
    required this.is_active,
    required this.date_joined,
    required this.email,
    required this.authorization
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);
}

@JsonSerializable()
class ProfileResponse {
  final int id, point, grade, recommended, activity;
  final String image, fcm_token;
  final String? nickname, phone_number;

  ProfileResponse({
    required this.id,
    required this.image,
    required this.nickname,
    required this.fcm_token,
    required this.phone_number,
    required this.point,
    required this.grade,
    required this.recommended,
    required this.activity
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) => _$ProfileResponseFromJson(json);
}

/// 로그인 완료 시 token 및 사용자 응답 DTO
@JsonSerializable()
class LoginResponse {
  final String access_token, refresh_token;
  final UserResponse user;

  LoginResponse({
    required this.access_token,
    required this.refresh_token,
    required this.user
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
}
