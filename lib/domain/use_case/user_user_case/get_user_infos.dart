import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/remote/dto/user/user_response.dart';
import 'package:cafejari_flutter/data/repository/push_repository.dart';
import 'package:cafejari_flutter/data/repository/user_repository.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';


/// getLeaderInfos의 실제 구현부
class GetUserInfos {
  Future call(
      {required UserRepository userRepository,
        required TokenRepository tokenRepository,
        required String accessToken}) async {
    try {
      UserResponse userInfoResponse = await userRepository.fetchUserProfile(
          accessToken: accessToken
      );

      User userInfo = User(
        userId: userInfoResponse.id,
        isAdmin: userInfoResponse.is_superuser,
        dateJoined: DateTime.parse(userInfoResponse.date_joined),
        lastLogin: DateTime.parse(userInfoResponse.last_login),

        profileId: userInfoResponse.profile?.id,
        fcmToken: userInfoResponse.profile?.fcm_token,
        phoneNumber: userInfoResponse.profile?.phone_number,
        imageUrl: userInfoResponse.profile?.image,
        point: userInfoResponse.profile?.point,
        grade: userInfoResponse.profile?.grade,
        activitySeconds: userInfoResponse.profile?.activity,
      );


      return userInfo;
    } on ErrorWithMessage {
      rethrow;
    } on AccessTokenExpired {
      rethrow;
    }
  }
}
