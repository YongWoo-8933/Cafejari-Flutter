import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/domain/repository.dart';


class TokenUseCase {
  final TokenRepository tokenRepository;

  TokenUseCase(this.tokenRepository);

  // REMOTE
  Future<String> getAccessToken() async {
    try {
      return await tokenRepository.fetchAccessToken();
    } on RefreshTokenExpired {
      rethrow;
    } on ErrorWithMessage {
      rethrow;
    }
  }

  // LOCAL
  saveRefreshToken({required String newRefreshToken}) {
    tokenRepository.putRefreshToken(newToken: newRefreshToken);
  }

  deleteRefreshToken() => tokenRepository.putRefreshToken(newToken: "");
}