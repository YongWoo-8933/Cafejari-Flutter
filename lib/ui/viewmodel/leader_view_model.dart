import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/domain/entity/leader/leaderboard.dart';
import 'package:cafejari_flutter/domain/use_case/leaderboard_use_case.dart';
import 'package:cafejari_flutter/ui/state/leader_state/leader_state.dart';
import 'package:cafejari_flutter/ui/viewmodel/global_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LeaderViewModel extends StateNotifier<LeaderState> {
  final LeaderboardUseCase _leaderUseCase;
  final GlobalViewModel globalViewModel;

  LeaderViewModel({required LeaderboardUseCase leaderUseCase, required this.globalViewModel})
      : _leaderUseCase = leaderUseCase,
        super(LeaderState.empty());

  refreshLeaderInfos() async {
    try {
      final List leaderInfos = await _leaderUseCase.getLeaderInfos(accessToken: globalViewModel.state.accessToken);
      final LeaderInfos monthLeaderInfo = leaderInfos.first;
      final LeaderInfos weekLeaderInfo = leaderInfos.last;


      state = state.copyWith(monthLeaderInfos: monthLeaderInfo, weekLeaderInfos: weekLeaderInfo);
    } on RefreshTokenExpired {
      globalViewModel.logout();
    } on ErrorWithMessage {
      // 에러 메시지 출력
    }
  }
}
