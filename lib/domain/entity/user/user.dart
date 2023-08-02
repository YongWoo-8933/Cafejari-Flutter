import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

/// 기본 유저 모델
@freezed
class User with _$User {
  factory User(
      {required final int userId, profileId, point,
      required final bool isAdmin, isActive,
      required final bool isMarketingPushEnabled, isOccupancyPushEnabled, isLogPushEnabled,
      required final DateTime dateJoined, lastLogin,
      required final String nickname, email, fcmToken, imageUrl,
      required final String? phoneNumber, ageRange, dateOfBirth,
      required final int? gender,
      required final Grade grade,
      required final List<int> favoriteCafes}) = _User;

  factory User.empty() => User(
      userId: 0,
      profileId: 0,
      point: 0,
      isAdmin: false,
      isActive: true,
      isMarketingPushEnabled: true,
      isOccupancyPushEnabled: true,
      isLogPushEnabled: true,
      dateJoined: DateTime(2022),
      lastLogin: DateTime(2022),
      nickname: "",
      email: "",
      fcmToken: "",
      imageUrl: "",
      phoneNumber: null,
      ageRange: null,
      dateOfBirth: null,
      gender: null,
      grade: Grade.empty(),
      favoriteCafes: []);
}

/// 정보가 제한된 유저 모델
@freezed
class PartialUser with _$PartialUser {
  factory PartialUser(
      {required final int userId, profileId, updateCount,
      required final DateTime dateJoined,
      required final String imageUrl,
      required final Grade grade}) = _PartialUser;

  factory PartialUser.empty() => PartialUser(
      userId: 0,
      profileId: 0,
      updateCount: 0,
      dateJoined: DateTime(2022),
      imageUrl: "",
      grade: Grade.empty());
}

/// Grade(유저 등급) 모델
@freezed
class Grade with _$Grade {
  factory Grade(
      {required final int id, step,
      required final int updateCountRequirement, updateRestrictionPerCafe, stackRestrictionPerDay,
      required final String name, imageUrl, description}) = _Grade;

  factory Grade.empty() => Grade(
      id: 0,
      step: 0,
      updateCountRequirement: 0,
      updateRestrictionPerCafe: 0,
      stackRestrictionPerDay: 0,
      name: "",
      imageUrl: "",
      description: "");
}
