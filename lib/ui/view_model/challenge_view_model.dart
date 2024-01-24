import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/domain/entity/challenge/challenge.dart';
import 'package:cafejari_flutter/domain/use_case/challenge_use_case.dart';
import 'package:cafejari_flutter/ui/components/custom_snack_bar.dart';
import 'package:cafejari_flutter/ui/state/challenge_state/challenge_state.dart';
import 'package:cafejari_flutter/ui/view_model/global_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChallengeViewModel extends StateNotifier<ChallengeState> {
  final ChallengeUseCase _challengeUseCase;
  final GlobalViewModel globalViewModel;

  ChallengeViewModel({
    required ChallengeUseCase challengeUseCase,
    required this.globalViewModel
  }): _challengeUseCase = challengeUseCase, super(ChallengeState.empty());

  refreshChallenges() async {
    try {
      final Challenges challenges = await _challengeUseCase.getChallenges();
      challenges.sort((a, b) => b.id.compareTo(a.id));
      final int lastViewedChallengeId = await _challengeUseCase.getLastViewedChallengeId();
      final int recentChallengeId = challenges.firstOrNull?.id ?? 0;
      if(recentChallengeId > lastViewedChallengeId) {
        await _challengeUseCase.setLastViewedChallengeId(recentChallengeId);
        globalViewModel.setChallengeBadgeVisible(true);
      }
      final DateTime now = DateTime.now();
      final availableChallenges = challenges.where((element) {
        return now.compareTo(element.startAt) > 0 && now.compareTo(element.finishAt) < 0
            && element.available;
      }).toList();
      challenges.removeWhere((element) => availableChallenges.contains(element));
      state = state.copyWith(
        availableChallenges: availableChallenges,
        unavailableChallenges: challenges
      );
    } on ErrorWithMessage catch (e) {
      globalViewModel.showSnackBar(content: e.message, type: SnackBarType.error);
    }
  }

  selectChallenge(Challenge challenge) => state = state.copyWith(selectedChallenge: challenge);

  participate({required Challenge challenge, required BuildContext context}) async {
    try {
      final Challenge newChallenge = await _challengeUseCase.participateChallenge(
        accessToken: globalViewModel.state.accessToken,
        challengeId: challenge.id,
        onAccessTokenRefresh: globalViewModel.setAccessToken
      );
      Challenges currentAvailableChallenges = List.from(state.availableChallenges);
      currentAvailableChallenges.removeWhere((element) => element.id == challenge.id);
      currentAvailableChallenges.add(newChallenge);
      state = state.copyWith(
        availableChallenges: currentAvailableChallenges,
        selectedChallenge: newChallenge
      );
      await globalViewModel.init(accessToken: globalViewModel.state.accessToken, user: globalViewModel.state.user);
      globalViewModel.showSnackBar(content: "참여됨", type: SnackBarType.complete);
    } on ErrorWithMessage catch (e) {
      globalViewModel.showSnackBar(content: e.message, type: SnackBarType.error);
    } on RefreshTokenExpired {
      if(context.mounted) await globalViewModel.expireRefreshToken(context: context);
    }
  }

  getLastViewedChallengeId() async => await _challengeUseCase.getLastViewedChallengeId();

  setLastViewedChallengeId(int id) async => await _challengeUseCase.setLastViewedChallengeId(id);
}
