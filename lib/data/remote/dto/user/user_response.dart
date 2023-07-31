import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

/// 서버에서 받아오는 사용자 객체 DTO
@JsonSerializable()
class UserResponse {
  final int id;
  final ProfileResponse? profile;
  final bool is_superuser, is_active;
  final String date_joined, last_login, email;

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
  final int? gender;
  final String nickname;
  final GradeResponse grade;
  final ProfileImageResponse profile_image;
  final String? age_range, date_of_birth, phone_number, fcm_token;
  final bool marketing_push_enabled, occupancy_push_enabled, log_push_enabled;
  final List<int> favorite_cafe;

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
  final String image, name;
  final String? description, ;

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

class 	ProfileImageResponse {
  final int id;
  final String? image;
  final bool is_default;

  ProfileImageResponse({
    required this.id,
    required this.image,
    required this.is_default
  });

  factory ProfileImageResponse.fromJson(Map<String, dynamic> json) => _$ProfileImageResponseFromJson(json);
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
