import 'package:cafejari_flutter/domain/entity/push/push.dart';
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/domain/repository.dart';


class PushUseCase {
  final TokenRepository tokenRepository;
  final PushRepository pushRepository;

  PushUseCase({required this.tokenRepository, required this.pushRepository});

  Future<PopUps> getPopUps() async {
    try {
      return await pushRepository.fetchPopUp();
    } on ErrorWithMessage {
      rethrow;
    }
  }

  Future<Pushes> getMyPushes({
    required String accessToken,
    required Function(String) onAccessTokenRefresh
  }) async {
    try {
      return await pushRepository.fetchMyPush(accessToken: accessToken);
    } on AccessTokenExpired {
      final String newToken = await tokenRepository.fetchAccessToken();
      onAccessTokenRefresh(newToken);
      try {
        return await pushRepository.fetchMyPush(accessToken: newToken);
      } on AccessTokenExpired {
        throw ErrorWithMessage(code: 0, message: "원인 모를 에러 발생, 앱을 재시작 해보세요");
      }
    } on RefreshTokenExpired {
      rethrow;
    } on ErrorWithMessage {
      rethrow;
    }
  }

  Future<Push> readPush({
    required String accessToken,
    required int pushId,
    required Function(String) onAccessTokenRefresh
  }) async {
    try {
      return await pushRepository.readPush(accessToken: accessToken, pushId: pushId);
    } on AccessTokenExpired {
      final String newToken = await tokenRepository.fetchAccessToken();
      onAccessTokenRefresh(newToken);
      try {
        return await pushRepository.readPush(accessToken: newToken, pushId: pushId);
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
