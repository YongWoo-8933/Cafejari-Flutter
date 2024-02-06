import 'package:cafejari_flutter/data/remote/dto/push/push_response.dart';
import 'package:cafejari_flutter/data/repository/push_repository.dart';
import 'package:cafejari_flutter/data/repository/token_repository.dart';
import 'package:cafejari_flutter/domain/entity/push/push.dart';
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/domain/use_case/base_use_case.dart';
import 'package:cafejari_flutter/domain/use_case/util.dart';

/// 알림 관련 data를 처리하는 use case
abstract interface class PushUseCase {
  Future<PopUps> getPopUps();
  Future<Pushes> getMyPushes({
    required String accessToken,
    required Function(String) onAccessTokenRefresh
  });
  Future<Push> readPush({
    required String accessToken,
    required int pushId,
    required Function(String) onAccessTokenRefresh
  });
}

/// PushUseCase 구현 부분
class PushUseCaseImpl extends BaseUseCase implements PushUseCase {
  final TokenRepository tokenRepository;
  final PushRepository pushRepository;

  PushUseCaseImpl({required this.tokenRepository, required this.pushRepository});

  @override
  Future<PopUps> getPopUps() async {
    try {
      List<PopUpResponse> popUpResponseList = await pushRepository.fetchPopUp();
      PopUps resList = popUpResponseList.map((e) => parsePopUpFromPopUpResponse(popUpResponse: e)).toList();
      return resList;
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<Pushes> getMyPushes({
    required String accessToken,
    required Function(String) onAccessTokenRefresh
  }) async {
    try {
      List<PushResponse> pushResponseList = await pushRepository.fetchMyPush(accessToken: accessToken);
      Pushes resList =  pushResponseList.map((e) => parsePushFromPushResponse(pushResponse: e)).toList();
      resList.sort((a, b) => b.pushedAt.compareTo(a.pushedAt));
      return resList;
    } on AccessTokenExpired {
      final String newToken = await getNewAccessToken(tokenRepository: tokenRepository);
      onAccessTokenRefresh(newToken);
      try {
        List<PushResponse> pushResponseList = await pushRepository.fetchMyPush(accessToken: newToken);
        Pushes resList =  pushResponseList.map((e) => parsePushFromPushResponse(pushResponse: e)).toList();
        resList.sort((a, b) => b.pushedAt.compareTo(a.pushedAt));
        return resList;
      } on AccessTokenExpired {
        throw ErrorWithMessage(code: 0, message: "원인 모를 에러 발생, 앱을 재시작 해보세요");
      }
    } on RefreshTokenExpired {
      rethrow;
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<Push> readPush({
    required String accessToken,
    required int pushId,
    required Function(String) onAccessTokenRefresh
  }) async {
    try {
      final PushResponse pushResponse = await pushRepository.readPush(accessToken: accessToken, pushId: pushId);
      return parsePushFromPushResponse(pushResponse: pushResponse);
    } on AccessTokenExpired {
      final String newToken = await getNewAccessToken(tokenRepository: tokenRepository);
      onAccessTokenRefresh(newToken);
      try {
        final PushResponse pushResponse = await pushRepository.readPush(accessToken: newToken, pushId: pushId);
        return parsePushFromPushResponse(pushResponse: pushResponse);
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
