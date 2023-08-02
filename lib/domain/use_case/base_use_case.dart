import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/repository/push_repository.dart';

/// 모든 use case가 공통적으로 가지는 method, construct 부분
class BaseUseCase {
  Future<String> getNewAccessToken({required TokenRepository tokenRepository}) async {
    try {
      final tokenResponse = await tokenRepository.fetchAccessToken();
      return tokenResponse.access;
    } on RefreshTokenExpired {
      rethrow;
    } on ErrorWithMessage {
      rethrow;
    }
  }
}
