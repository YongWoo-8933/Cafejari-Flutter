
import 'package:cafejari_flutter/data/remote/dto/challenge/challenge_response.dart';
import 'package:cafejari_flutter/data/repository/challenge_repository.dart';
import 'package:cafejari_flutter/domain/entity/challenge/challenge.dart';
import 'package:cafejari_flutter/domain/use_case/util.dart';
import 'package:cafejari_flutter/core/exception.dart';

/// getMyChallengers의 실제 구현부
class GetMyChallengers {
  Future<Challengers> call({
    required ChallengeRepository challengeRepository, required String accessToken}) async {
    try {
      List<ChallengerResponse> challengerResponseList =
      await challengeRepository.fetchMyChallengers(accessToken: accessToken);
      return challengerResponseList.map((challengerResponse) {
        return Challenger(
            id: challengerResponse.id,
            count: challengerResponse.count,
            progressRate: double.parse(challengerResponse.progress_rate),
            challenge: parseChallengeFromChallengeResponse(
                challengeResponse: challengerResponse.challenge),
            points: challengerResponse.challenge_point.map((challengePointResponse) {
              return ChallengePoint(
                  id: challengePointResponse.id,
                  point: challengePointResponse.point,
                  description: challengePointResponse.description,
                  rewardedAt: DateTime.parse(challengePointResponse.rewarded_at));
            }).toList());
      }).toList();
    } on TokenExpired {
      throw AccessTokenExpired();
    } on ErrorWithMessage {
      rethrow;
    }
  }
}
