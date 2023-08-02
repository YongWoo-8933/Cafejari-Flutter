import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/repository/push_repository.dart';
import 'package:cafejari_flutter/data/repository/user_repository.dart';
import 'package:cafejari_flutter/domain/use_case/base_use_case.dart';

import 'user_user_case/get_user_infos.dart';

abstract class UserUseCase {
  Future getUserInfos(
      {required String accessToken});
}

class UserUseCaseImpl extends BaseUseCase implements UserUseCase {
  final TokenRepository tokenRepository;
  final UserRepository userRepository;

  UserUseCaseImpl({required this.tokenRepository, required this.userRepository});

  @override
  Future getUserInfos(
      {required String accessToken}) async {
    final f = GetUserInfos();
    try{
      return f(
          accessToken: accessToken,
          tokenRepository: tokenRepository,
          userRepository: userRepository
      );
    } on AccessTokenExpired {
      final String newToken = await getNewAccessToken(tokenRepository: tokenRepository);
      try{
        return f(
            accessToken: newToken,
            tokenRepository: tokenRepository,
            userRepository: userRepository
        );
      } on AccessTokenExpired{
        throw ErrorWithMessage("원인 모를 에러 발생, 앱을 재시작 해보세요");
      } on ErrorWithMessage{
        rethrow;
      }
    }on RefreshTokenExpired{
      rethrow;
    }on ErrorWithMessage{
      rethrow;
    }
  }

}