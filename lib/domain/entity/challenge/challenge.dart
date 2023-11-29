
import 'package:freezed_annotation/freezed_annotation.dart';

part 'challenge.freezed.dart';


typedef Challenges = List<Challenge>;

/// challenge 모델
@freezed
class Challenge with _$Challenge {
  factory Challenge({
    required final int id,
    required final int participantLimit,
    required final int goal,
    required final int totalPoint,
    required final String name,
    required final String description,
    required final String imageUrl,
    required final DateTime startAt,
    required final DateTime finishAt,
    required final bool available,
    required final List<int> challengerUserIds,
    required final List<String> challengerProfileImages,
    required final ChallengeMilestones challengeMilestones,
  }) = _Challenge;

  factory Challenge.empty() => Challenge(
      id: 0,
      participantLimit: 0,
      goal: 0,
      totalPoint: 0,
      name: "",
      description: "",
      imageUrl: "",
      startAt: DateTime(2022),
      finishAt: DateTime(2022),
      available: false,
      challengerUserIds: [],
      challengerProfileImages: [],
      challengeMilestones: []);
}

typedef ChallengeMilestones = List<ChallengeMilestone>;

/// challenge milestone 모델
@freezed
class ChallengeMilestone with _$ChallengeMilestone {
  factory ChallengeMilestone({
    required final int id,
    required final int point,
    required final int count,
    required final double progressRate,
    required final String description,
  }) = _ChallengeMilestone;

  factory ChallengeMilestone.empty() => ChallengeMilestone(
      id: 0,
      point: 0,
      count: 0,
      progressRate: 0.0,
      description: "");
}

typedef Challengers = List<Challenger>;

/// challenger 모델
@freezed
class Challenger with _$Challenger{
  factory Challenger({
    required final int id,
    required final int count,
    required final double progressRate,
    required final Challenge challenge,
    required final ChallengePoints points,
  }) = _Challenger;

  factory Challenger.empty() => Challenger(
      id: 0,
      count: 0,
      progressRate: 0.0,
      challenge: Challenge.empty(),
      points: []);
}

typedef ChallengePoints = List<ChallengePoint>;

/// challenge point 모델
@freezed
class ChallengePoint with _$ChallengePoint{
  factory ChallengePoint({
    required final int id,
    required final int point,
    required final String description,
    required final DateTime rewardedAt
  }) = _ChallengePoint;

  factory ChallengePoint.empty() => ChallengePoint(
      id: 0,
      point: 0,
      description: "",
      rewardedAt: DateTime(2022));
}
