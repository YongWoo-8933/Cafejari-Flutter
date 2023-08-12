import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/repository/user_repository.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:cafejari_flutter/domain/use_case/util.dart';


/// makeNewProfile의 실제 구현부
class MakeNewProfile {
  Future<User> call({
    required UserRepository userRepository,
    required String accessToken,
    required String fcmToken,
    required String nickname,
    required int userId,
    required int profileImageId,
  }) async {
    try {
      return parseUserFromUserResponse(
        await userRepository.makeNewProfile(
          accessToken: accessToken,
          fcmToken: fcmToken,
          nickname: nickname,
          userId: userId,
          profileImageId: profileImageId)
      );
    } on ErrorWithMessage {
      rethrow;
    }
  }
}
