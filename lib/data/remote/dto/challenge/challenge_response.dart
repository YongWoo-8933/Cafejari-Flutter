import 'package:json_annotation/json_annotation.dart';


part 'challenge_response.g.dart';

@JsonSerializable()
class ChallengeResponse {
  final int id, participant_limit, goal;
  final String name, description, start, finish, image;
  final String? url;
  final bool available;
  final List<int> challenger;
  final List<ChallengeMilestoneResponse> challenge_milestone;

  ChallengeResponse(
      {required this.id,
        required this.participant_limit,
        required this.goal,
        required this.name,
        required this.url,
        required this.description,
        required this.start,
        required this.finish,
        required this.image,
        required this.available,
        required this.challenger,
        required this.challenge_milestone});

  factory ChallengeResponse.fromJson(Map<String, dynamic> json) => _$ChallengeResponseFromJson(json);
}

@JsonSerializable()
class ChallengeMilestoneResponse {
  final int id, point, count;
  final String progress_rate, description;

  ChallengeMilestoneResponse(
      {required this.id,
        required this.point,
        required this.count,
        required this.progress_rate,
        required this.description});

  factory ChallengeMilestoneResponse.fromJson(Map<String, dynamic> json) => _$ChallengeMilestoneResponseFromJson(json);
}

@JsonSerializable()
class ChallengerResponse {
  final int id, count;
  final String progress_rate;
  final ChallengeResponse challenge;
  final List<ChallengePointResponse> challenge_point;

  ChallengerResponse(
      {required this.id,        required this.count,
        required this.progress_rate,
        required this.challenge,
        required this.challenge_point});

  factory ChallengerResponse.fromJson(Map<String, dynamic> json) => _$ChallengerResponseFromJson(json);
}

@JsonSerializable()
class ChallengePointResponse {
  final int id, point;
  final String rewarded_at, description;

  ChallengePointResponse(
      {required this.id,
        required this.point,
        required this.rewarded_at,
        required this.description});

  factory ChallengePointResponse.fromJson(Map<String, dynamic> json) => _$ChallengePointResponseFromJson(json);
}

