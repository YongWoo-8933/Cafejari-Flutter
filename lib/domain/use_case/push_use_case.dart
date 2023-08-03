
import 'package:cafejari_flutter/data/repository/push_repository.dart';
import 'package:cafejari_flutter/data/repository/token_repository.dart';
import 'package:cafejari_flutter/domain/entity/push/push.dart';
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/domain/use_case/base_use_case.dart';
import 'package:cafejari_flutter/domain/use_case/push_use_case/get_my_pushes.dart';

/// 알림 관련 data를 처리하는 use case
abstract interface class PushUseCase {
  Future<Pushes> getMyPushes({required String accessToken});
}

/// PushUseCase 구현 부분
class PushUseCaseImpl extends BaseUseCase implements PushUseCase {
  final TokenRepository tokenRepository;
  final PushRepository pushRepository;

  PushUseCaseImpl({required this.tokenRepository, required this.pushRepository});

  @override
  Future<Pushes> getMyPushes({required String accessToken}) async {
    final f = GetPushes();
    try {
      return await f(
        pushRepository: pushRepository,
        accessToken: accessToken
      );
    } on AccessTokenExpired {
      final String newToken = await getNewAccessToken(tokenRepository: tokenRepository);
      try {
        return await f(
            pushRepository: pushRepository,
            accessToken: newToken
        );
      } on AccessTokenExpired {
        throw ErrorWithMessage(code: 0, message: "원인 모를 에러 발생, 앱을 재시작 해보세요");
      }
    } on RefreshTokenExpired {
      rethrow;
    } on ErrorWithMessage {
      rethrow;
    }
  }
}
