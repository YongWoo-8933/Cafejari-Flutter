
import 'package:cafejari_flutter/core/util.dart';
import 'package:cafejari_flutter/data/repository/token_repository.dart';

/// 토큰 관련 data CRUD를 처리하는 use case
abstract interface class TokenUseCase {
  saveRefreshToken({required String newRefreshToken});
  deleteRefreshToken();
}

/// TokenUseCase 구현 부분
class TokenUseCaseImpl implements TokenUseCase {
  final TokenRepository tokenRepository;

  TokenUseCaseImpl(this.tokenRepository);

  @override
  saveRefreshToken({required String newRefreshToken}) {
    tokenRepository.putRefreshToken(newToken: newRefreshToken);
  }

  @override
  deleteRefreshToken() => tokenRepository.putRefreshToken(newToken: none);
}