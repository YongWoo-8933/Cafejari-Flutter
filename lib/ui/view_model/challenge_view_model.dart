import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/domain/entity/challenge/challenge.dart';
import 'package:cafejari_flutter/domain/use_case/challenge_use_case.dart';
import 'package:cafejari_flutter/domain/use_case/user_use_case.dart';
import 'package:cafejari_flutter/ui/state/challenge_state/challenge_state.dart';
import 'package:cafejari_flutter/ui/view_model/global_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChallengeViewModel extends StateNotifier<ChallengeState> {
  final ChallengeUseCase _challengeUseCase;
  final UserUseCase _userUseCase;
  final GlobalViewModel globalViewModel;

  ChallengeViewModel({
    required ChallengeUseCase challengeUseCase,
    required UserUseCase userUseCase,
    required this.globalViewModel
  }): _challengeUseCase = challengeUseCase, _userUseCase = userUseCase, super(ChallengeState.empty());

  refreshChallenges() async {
    try {
      final Challenges challenges = await _challengeUseCase.getChallenges();
      final DateTime now = DateTime.now();
      final availableChallenges = challenges.where((element) {
        return now.compareTo(element.startAt) > 0 && now.compareTo(element.finishAt) < 0
            && element.available;
      }).toList();
      challenges.removeWhere((element) => availableChallenges.contains(element));
      state = state.copyWith(availableChallenges: availableChallenges, unavailableChallenges: challenges);
    } on ErrorWithMessage {
      // 에러 메시지 출력
    }
  }

  refreshChallengers() async {
    try {
      final Challengers challengers = await _challengeUseCase.getMyChallengers(
          accessToken: globalViewModel.state.accessToken);
      state = state.copyWith(myChallengers: challengers);
    } on ErrorWithMessage {
      // 에러 메시지 출력
    }
  }

  setProfileImages() async {
    try {
      final profileImageTuples = await _userUseCase.getDefaultProfileImages();
      profileImageTuples.shuffle();
      state = state.copyWith(profileImageUrls: profileImageTuples.map((e) => e.imageUrl).toList());
    } on ErrorWithMessage {
      // 에러 메시지 출력
    }
  }

  selectChallenge(Challenge challenge) => state = state.copyWith(selectedChallenge: challenge);

  setChallenger() {
    state = state.copyWith(selectedChallenger: state.myChallengers.firstWhere(
      (element) => element.challenge.id == state.selectedChallenge.id,
      orElse: () => Challenger.empty()
    ));
  }

  setDebugChallenger() {
    state = state.copyWith(selectedChallenger: state.myChallengers.firstWhere(
      (element) => element.challenge.id == state.selectedChallenge.id,
      orElse: () => Challenger(
          id: 2,
          count: 100,
          progressRate: 1.0,
          challenge: Challenge.empty(),
          points: [
            ChallengePoint(
              id: 1,
              point: 100,
              description: "묘사 1",
              rewardedAt: DateTime(2023, 10, 14)
            ),
            ChallengePoint(
              id: 2,
              point: 300,
              description: "묘사 2",
              rewardedAt: DateTime(2023, 10, 15)
            ),
            ChallengePoint(
              id: 3,
              point: 500,
              description: "묘사 3",
              rewardedAt: DateTime(2023, 10, 16)
            ),
          ]
      )
      )
    );
  }

  participate(Challenge challenge) async {
    try {
      final Challenge newChallenge = await _challengeUseCase.participateChallenge(
          accessToken: globalViewModel.state.accessToken, challengeId: challenge.id);
      Challenges currentAvailableChallenges = state.availableChallenges;
      currentAvailableChallenges.removeWhere((element) => element.id == challenge.id);
      currentAvailableChallenges.add(newChallenge);
      state = state.copyWith(availableChallenges: currentAvailableChallenges);
    } on RefreshTokenExpired {
      globalViewModel.logout();
    } on ErrorWithMessage {
      // 에러 메시지 출력
    }
  }
}
