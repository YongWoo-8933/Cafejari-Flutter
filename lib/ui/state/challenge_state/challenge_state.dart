import 'package:cafejari_flutter/domain/entity/challenge/challenge.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'challenge_state.freezed.dart';

@freezed
class ChallengeState with _$ChallengeState {
  factory ChallengeState(
      {required final Challenges availableChallenges,
        required final Challenges unavailableChallenges,
        required final Challenge selectedChallenge}) = _ChallengeState;

  factory ChallengeState.empty() => ChallengeState(
      availableChallenges: [],
      unavailableChallenges: [],
      selectedChallenge: Challenge.empty());
}