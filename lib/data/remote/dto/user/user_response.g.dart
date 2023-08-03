// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenResponse _$TokenResponseFromJson(Map<String, dynamic> json) =>
    TokenResponse(
      access: json['access'] as String,
    );

Map<String, dynamic> _$TokenResponseToJson(TokenResponse instance) =>
    <String, dynamic>{
      'access': instance.access,
    };

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      id: json['id'] as int,
      profile: json['profile'] == null
          ? null
          : ProfileResponse.fromJson(json['profile'] as Map<String, dynamic>),
      last_login: json['last_login'] as String,
      is_superuser: json['is_superuser'] as bool,
      is_active: json['is_active'] as bool,
      date_joined: json['date_joined'] as String,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'profile': instance.profile,
      'is_superuser': instance.is_superuser,
      'is_active': instance.is_active,
      'date_joined': instance.date_joined,
      'last_login': instance.last_login,
      'email': instance.email,
    };

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    ProfileResponse(
      id: json['id'] as int,
      point: json['point'] as int,
      gender: json['gender'] as int?,
      nickname: json['nickname'] as String,
      grade: GradeResponse.fromJson(json['grade'] as Map<String, dynamic>),
      profile_image: ProfileImageResponse.fromJson(
          json['profile_image'] as Map<String, dynamic>),
      age_range: json['age_range'] as String?,
      date_of_birth: json['date_of_birth'] as String?,
      phone_number: json['phone_number'] as String?,
      fcm_token: json['fcm_token'] as String?,
      marketing_push_enabled: json['marketing_push_enabled'] as bool,
      occupancy_push_enabled: json['occupancy_push_enabled'] as bool,
      log_push_enabled: json['log_push_enabled'] as bool,
      favorite_cafe: (json['favorite_cafe'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
    );

Map<String, dynamic> _$ProfileResponseToJson(ProfileResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'point': instance.point,
      'nickname': instance.nickname,
      'gender': instance.gender,
      'age_range': instance.age_range,
      'date_of_birth': instance.date_of_birth,
      'phone_number': instance.phone_number,
      'fcm_token': instance.fcm_token,
      'marketing_push_enabled': instance.marketing_push_enabled,
      'occupancy_push_enabled': instance.occupancy_push_enabled,
      'log_push_enabled': instance.log_push_enabled,
      'grade': instance.grade,
      'profile_image': instance.profile_image,
      'favorite_cafe': instance.favorite_cafe,
    };

GradeResponse _$GradeResponseFromJson(Map<String, dynamic> json) =>
    GradeResponse(
      id: json['id'] as int,
      step: json['step'] as int,
      sharing_count_requirement: json['sharing_count_requirement'] as int,
      sharing_restriction_per_cafe: json['sharing_restriction_per_cafe'] as int,
      activity_stack_restriction_per_day:
          json['activity_stack_restriction_per_day'] as int,
      image: json['image'] as String?,
      name: json['name'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$GradeResponseToJson(GradeResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'step': instance.step,
      'sharing_count_requirement': instance.sharing_count_requirement,
      'sharing_restriction_per_cafe': instance.sharing_restriction_per_cafe,
      'activity_stack_restriction_per_day':
          instance.activity_stack_restriction_per_day,
      'name': instance.name,
      'image': instance.image,
      'description': instance.description,
    };

ProfileImageResponse _$ProfileImageResponseFromJson(
        Map<String, dynamic> json) =>
    ProfileImageResponse(
      id: json['id'] as int,
      image: json['image'] as String,
      is_default: json['is_default'] as bool,
    );

Map<String, dynamic> _$ProfileImageResponseToJson(
        ProfileImageResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'is_default': instance.is_default,
    };

PartialUserResponse _$PartialUserResponseFromJson(Map<String, dynamic> json) =>
    PartialUserResponse(
      id: json['id'] as int,
      profile: PartialProfileResponse.fromJson(
          json['profile'] as Map<String, dynamic>),
      date_joined: json['date_joined'] as String,
    );

Map<String, dynamic> _$PartialUserResponseToJson(
        PartialUserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'profile': instance.profile,
      'date_joined': instance.date_joined,
    };

PartialProfileResponse _$PartialProfileResponseFromJson(
        Map<String, dynamic> json) =>
    PartialProfileResponse(
      id: json['id'] as int,
      nickname: json['nickname'] as String,
      grade: GradeResponse.fromJson(json['grade'] as Map<String, dynamic>),
      profile_image: ProfileImageResponse.fromJson(
          json['profile_image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PartialProfileResponseToJson(
        PartialProfileResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'grade': instance.grade,
      'profile_image': instance.profile_image,
    };

NicknameResponse _$NicknameResponseFromJson(Map<String, dynamic> json) =>
    NicknameResponse(
      nickname: json['nickname'] as String,
    );

Map<String, dynamic> _$NicknameResponseToJson(NicknameResponse instance) =>
    <String, dynamic>{
      'nickname': instance.nickname,
    };

LoginCallbackResponse _$LoginCallbackResponseFromJson(
        Map<String, dynamic> json) =>
    LoginCallbackResponse(
      code: json['code'] as String,
      access_token: json['access_token'] as String,
      user_exists: json['user_exists'] as bool,
    );

Map<String, dynamic> _$LoginCallbackResponseToJson(
        LoginCallbackResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'access_token': instance.access_token,
      'user_exists': instance.user_exists,
    };

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      access: json['access'] as String,
      refresh: json['refresh'] as String,
      user: UserResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'access': instance.access,
      'refresh': instance.refresh,
      'user': instance.user,
    };
