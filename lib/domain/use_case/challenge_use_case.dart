import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/domain/entity/challenge/challenge.dart';
import 'package:cafejari_flutter/domain/repository.dart';


class ChallengeUseCase {
  final TokenRepository tokenRepository;
  final ChallengeRepository challengeRepository;
  final UserRepository userRepository;

  ChallengeUseCase({
    required this.tokenRepository,
    required this.challengeRepository,
    required this.userRepository
  });

  Future<int> getLastViewedChallengeId() async => await challengeRepository.getLastViewedChallengeId();

  setLastViewedChallengeId(int id) async => await challengeRepository.putLastViewedChallengeId(id);

  Future<Challenges> getChallenges() async {
    try {
      return challengeRepository.fetchChallenges();
    } on ErrorWithMessage {
      rethrow;
    }
  }

  Future<Challengers> getMyChallengers({
    required String accessToken,
    required Function(String) onAccessTokenRefresh
  }) async {
    try {
      return await challengeRepository.fetchMyChallengers(accessToken: accessToken);
    } on AccessTokenExpired {
      final String newToken = await tokenRepository.fetchAccessToken();
      onAccessTokenRefresh(newToken);
      try {
        return await challengeRepository.fetchMyChallengers(accessToken: newToken);
      } on AccessTokenExpired {
        throw ErrorWithMessage(code: 0, message: "원인 모를 에러 발생, 앱을 재시작 해보세요");
      }
    } on RefreshTokenExpired{
      rethrow;
    }  on ErrorWithMessage {
      rethrow;
    }
  }

  Future<Challenge> participateChallenge({
    required String accessToken,
    required int challengeId,
    required Function(String) onAccessTokenRefresh
  }) async {
    try {
      return await challengeRepository.participate(accessToken: accessToken, challengeId: challengeId);
    } on AccessTokenExpired {
      final String newToken = await tokenRepository.fetchAccessToken();
      onAccessTokenRefresh(newToken);
      try {
        return await challengeRepository.participate(accessToken: newToken, challengeId: challengeId);
      } on AccessTokenExpired{
        throw ErrorWithMessage(code: 0, message: "원인 모를 에러 발생, 앱을 재시작 해보세요");
      }
    } on RefreshTokenExpired{
      rethrow;
    }  on ErrorWithMessage {
      rethrow;
    }
  }
}