import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

/// 기본 유저 모델
@freezed
class User with _$User {
  factory User({
    required final int userId,
    required final int profileId,
    required final int point,
    required final bool isAdmin,
    required final bool isActive,
    required final bool isMarketingPushEnabled,
    required final bool isOccupancyPushEnabled,
    required final bool isLogPushEnabled,
    required final DateTime dateJoined,
    required final DateTime lastLogin,
    required final String nickname,
    required final String fcmToken,
    required final String imageUrl,
    required final String? email,
    required final String? phoneNumber,
    required final String? ageRange,
    required final String? dateOfBirth,
    required final int? gender,
    required final Grade grade,
    required final List<Cafe> favoriteCafes}) = _User;

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
      fcmToken: "",
      imageUrl: "",
      email: null,
      phoneNumber: null,
      ageRange: null,
      dateOfBirth: null,
      gender: null,
      grade: Grade.empty(),
      favoriteCafes: []);
}

typedef PartialUsers = List<PartialUser>;

/// 정보가 제한된 유저 모델
@freezed
class PartialUser with _$PartialUser {
  factory PartialUser({
    required final int userId,
    required final int profileId,
    required final int updateCount,
    required final DateTime dateJoined,
    required final String imageUrl,
    required final String nickname,
    required final Grade grade}) = _PartialUser;

  factory PartialUser.empty() => PartialUser(
      userId: 0,
      profileId: 0,
      updateCount: 0,
      dateJoined: DateTime(2022),
      imageUrl: "",
      nickname: "",
      grade: Grade.empty());
}

typedef Grades = List<Grade>;

/// Grade(유저 등급) 모델
@freezed
class Grade with _$Grade {
  factory Grade({
    required final int id,
    required final int step,
    required final int updateCountRequirement,
    required final int updateRestrictionPerCafe,
    required final int stackRestrictionPerDay,
    required final String name,
    required final String imageUrl,
    required final String description}) = _Grade;

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
