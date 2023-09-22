
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/repository/token_repository.dart';

/// 토큰 관련 data CRUD를 처리하는 use case
abstract interface class TokenUseCase {
  Future<String> getAccessToken();
  saveRefreshToken({required String newRefreshToken});
  deleteRefreshToken();
}

/// TokenUseCase 구현 부분
class TokenUseCaseImpl implements TokenUseCase {
  final TokenRepository tokenRepository;

  TokenUseCaseImpl(this.tokenRepository);

  @override
  Future<String> getAccessToken() async {
    try {
      final tokenRes = await tokenRepository.fetchAccessToken();
      return tokenRes.access;
    } on RefreshTokenExpired {
      rethrow;
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  saveRefreshToken({required String newRefreshToken}) {
    tokenRepository.putRefreshToken(newToken: newRefreshToken);
  }

  @override
  deleteRefreshToken() => tokenRepository.putRefreshToken(newToken: "");
}