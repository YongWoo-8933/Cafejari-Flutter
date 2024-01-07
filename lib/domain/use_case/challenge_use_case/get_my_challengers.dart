import 'package:cafejari_flutter/data/remote/dto/challenge/challenge_response.dart';
import 'package:cafejari_flutter/data/remote/dto/user/user_response.dart';
import 'package:cafejari_flutter/data/repository/challenge_repository.dart';
import 'package:cafejari_flutter/data/repository/user_repository.dart';
import 'package:cafejari_flutter/domain/entity/challenge/challenge.dart';
import 'package:cafejari_flutter/domain/use_case/util.dart';
import 'package:cafejari_flutter/core/exception.dart';

class GetMyChallengers {
  /// getMyChallengers의 실제 구현부
  Future<Challengers> call({
    required ChallengeRepository challengeRepository,
    required UserRepository userRepository,
    required String accessToken,
  }) async {
    try {
      List<ChallengerResponse> challengerResponseList = await challengeRepository.fetchMyChallengers(accessToken: accessToken);
      List<ProfileImageResponse> profileImages = await userRepository.fetchProfileImage();
      return challengerResponseList.map((challengerResponse) {
        return Challenger(
            id: challengerResponse.id,
            count: challengerResponse.count,
            progressRate: double.parse(challengerResponse.progress_rate),
            challenge: parseChallengeFromChallengeResponse(
              challengeResponse: challengerResponse.challenge,
              challengerProfileImages: profileImages.map((e) => e.image).toList()
            ),
            points: challengerResponse.challenge_point.map((
                challengePointResponse) {
              return ChallengePoint(
                  id: challengePointResponse.id,
                  point: challengePointResponse.point,
                  description: challengePointResponse.description,
                  rewardedAt: DateTime.parse(
                      challengePointResponse.rewarded_at));
            }).toList());
      }).toList();
    } on AccessTokenExpired {
      rethrow;
    } on ErrorWithMessage {
      rethrow;
    }
  }
}
