import 'package:cafejari_flutter/core/util.dart';
import 'package:cafejari_flutter/data/remote/dto/user/user_response.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';

/// user response로부터 User 객체를 뽑아내는 함수
User parseUserFromUserResponse(UserResponse userResponse) {
  return User(
      userId: userResponse.id,
      profileId: userResponse.profile?.id ?? 0,
      isAdmin: userResponse.is_superuser,
      dateJoined: DateTime.parse(userResponse.date_joined),
      lastLogin: DateTime.parse(userResponse.last_login),
      fcmToken: userResponse.profile?.fcm_token ?? none,
      phoneNumber: userResponse.profile?.phone_number ?? none,
      imageUrl: userResponse.profile?.image ?? none,
      point: userResponse.profile?.point ?? 0,
      grade: userResponse.profile?.grade ?? 0,
      activitySeconds: userResponse.profile?.activity ?? 0
  );
}