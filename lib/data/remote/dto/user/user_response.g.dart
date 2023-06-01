// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      id: json['id'] as int,
      profile: json['profile'] == null
          ? null
          : ProfileResponse.fromJson(json['profile'] as Map<String, dynamic>),
      last_login: json['last_login'] as String,
      is_superuser: json['is_superuser'] as bool,
      is_staff: json['is_staff'] as bool,
      is_active: json['is_active'] as bool,
      date_joined: json['date_joined'] as String,
      email: json['email'] as String,
      authorization: json['authorization'] as bool,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'profile': instance.profile,
      'is_superuser': instance.is_superuser,
      'is_staff': instance.is_staff,
      'is_active': instance.is_active,
      'authorization': instance.authorization,
      'last_login': instance.last_login,
      'date_joined': instance.date_joined,
      'email': instance.email,
    };

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    ProfileResponse(
      id: json['id'] as int,
      image: json['image'] as String,
      nickname: json['nickname'] as String?,
      fcm_token: json['fcm_token'] as String,
      phone_number: json['phone_number'] as String?,
      point: json['point'] as int,
      grade: json['grade'] as int,
      recommended: json['recommended'] as int,
      activity: json['activity'] as int,
    );

Map<String, dynamic> _$ProfileResponseToJson(ProfileResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'point': instance.point,
      'grade': instance.grade,
      'recommended': instance.recommended,
      'activity': instance.activity,
      'image': instance.image,
      'fcm_token': instance.fcm_token,
      'nickname': instance.nickname,
      'phone_number': instance.phone_number,
    };

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      access_token: json['access_token'] as String,
      refresh_token: json['refresh_token'] as String,
      user: UserResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'access_token': instance.access_token,
      'refresh_token': instance.refresh_token,
      'user': instance.user,
    };
