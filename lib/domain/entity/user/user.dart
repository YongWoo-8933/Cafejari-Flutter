import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cafejari_flutter/core/util.dart';

part 'user.freezed.dart';

/// 기본 유저 모델
@freezed
class User with _$User {
  factory User(
      {required final int userId,
      required final int profileId,
      required final bool isAdmin,
      required final DateTime dateJoined,
      required final DateTime lastLogin,
      required final String fcmToken,
      required final String phoneNumber,
      required final String imageUrl,
      required final int point,
      required final int grade,
      required final int activitySeconds}) = _User;

  factory User.empty() => User(
      userId: 0,
      profileId: 0,
      isAdmin: false,
      dateJoined: DateTime(2022),
      lastLogin: DateTime(2022),
      fcmToken: none,
      phoneNumber: "",
      imageUrl: "",
      point: 0,
      grade: 0,
      activitySeconds: 0);
}
