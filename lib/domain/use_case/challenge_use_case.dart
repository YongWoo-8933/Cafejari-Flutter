import 'dart:math';

import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/remote/dto/challenge/challenge_response.dart';
import 'package:cafejari_flutter/data/remote/dto/user/user_response.dart';
import 'package:cafejari_flutter/data/repository/challenge_repository.dart';
import 'package:cafejari_flutter/data/repository/token_repository.dart';
import 'package:cafejari_flutter/data/repository/user_repository.dart';
import 'package:cafejari_flutter/domain/entity/challenge/challenge.dart';
import 'package:cafejari_flutter/domain/use_case/base_use_case.dart';
import 'package:cafejari_flutter/domain/use_case/challenge_use_case/get_my_challengers.dart';
import 'package:cafejari_flutter/domain/use_case/util.dart';

abstract class ChallengeUseCase {
  Future<Challenges> getChallenges();
  Future<Challengers> getMyChallengers({required String accessToken});
  Future<Challenge> participateChallenge({required String accessToken, required int challengeId});
}

class ChallengeUseCaseImpl extends BaseUseCase implements ChallengeUseCase {
  final TokenRepository tokenRepository;
  final ChallengeRepository challengeRepository;
  final UserRepository userRepository;

  ChallengeUseCaseImpl({
    required this.tokenRepository,
    required this.challengeRepository,
    required this.userRepository
  });

  @override
  Future<Challenges> getChallenges() async {
    try {
      List<ChallengeResponse> challengeResponseList = await challengeRepository.fetchChallenges();
      List<ProfileImageResponse> profileImages = await userRepository.fetchProfileImage();
      return challengeResponseList.map((e) => parseChallengeFromChallengeResponse(
        challengeResponse: e,
        challengerProfileImages: profileImages.map((e) => e.image).toList()
      )).toList();
    } on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<Challengers> getMyChallengers({required String accessToken}) async {
    final f = GetMyChallengers();
    try {
      return f(
        challengeRepository: challengeRepository,
        userRepository: userRepository,
        accessToken: accessToken,
      );
    } on AccessTokenExpired {
      final String newToken = await getNewAccessToken(tokenRepository: tokenRepository);
      try {
        return f(
          challengeRepository: challengeRepository,
          userRepository: userRepository,
          accessToken: newToken,
        );
      } on AccessTokenExpired{
        throw ErrorWithMessage(code: 0, message: "원인 모를 에러 발생, 앱을 재시작 해보세요");
      }
    } on RefreshTokenExpired{
      rethrow;
    }  on ErrorWithMessage {
      rethrow;
    }
  }

  @override
  Future<Challenge> participateChallenge({required String accessToken, required int challengeId}) async {
    try {
      ChallengeResponse challengeResponse = await challengeRepository.participate(
          accessToken: accessToken, challengeId: challengeId);
      List<ProfileImageResponse> profileImages = await userRepository.fetchProfileImage();
      return parseChallengeFromChallengeResponse(
        challengeResponse: challengeResponse,
        challengerProfileImages: profileImages.map((e) => e.image).toList()
      );
    } on AccessTokenExpired {
      final String newToken = await getNewAccessToken(tokenRepository: tokenRepository);
      try {
        ChallengeResponse challengeResponse = await challengeRepository.participate(
            accessToken: newToken, challengeId: challengeId);
        List<ProfileImageResponse> profileImages = await userRepository.fetchProfileImage();
        return parseChallengeFromChallengeResponse(
            challengeResponse: challengeResponse,
            challengerProfileImages: profileImages.map((e) => e.image).toList()
        );
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