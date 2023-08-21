import 'package:cafejari_flutter/domain/entity/challenge/challenge.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'challenge_state.freezed.dart';

@freezed
class ChallengeState with _$ChallengeState {
  factory ChallengeState(
      {required final Challenges availableChallenges,
        required final Challenges unavailableChallenges,
        required final Challenge selectedChallenge,
        required final List<String> profileImageUrls,
        required final Challengers myChallengers,
        required final Challenger selectedChallenger}) = _ChallengeState;

  factory ChallengeState.empty() => ChallengeState(
      availableChallenges: [],
      unavailableChallenges: [],
      selectedChallenge: Challenge.empty(),
      profileImageUrls: [],
      myChallengers: [],
      selectedChallenger: Challenger.empty());
}