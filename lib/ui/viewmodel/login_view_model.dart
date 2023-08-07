import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/domain/use_case/leaderboard_use_case.dart';
import 'package:cafejari_flutter/ui/state/leaderboard_state/leaderboard_state.dart';
import 'package:cafejari_flutter/ui/viewmodel/global_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LeaderboardViewModel extends StateNotifier<LeaderboardState> {
  final LeaderboardUseCase _leaderboardUseCase;
  final GlobalViewModel globalViewModel;

  LeaderboardViewModel({required LeaderboardUseCase leaderboardUseCase, required this.globalViewModel})
      : _leaderboardUseCase = leaderboardUseCase,
        super(LeaderboardState.empty());

  refreshRankers() async {
    try {
      state = state.copyWith(
          totalRankers: await _leaderboardUseCase.getTotalRankers(),
          monthRankers: await _leaderboardUseCase.getMonthRankers(),
          weekRankers: await _leaderboardUseCase.getWeekRankers()
      );
    } on RefreshTokenExpired {
      globalViewModel.logout();
    } on ErrorWithMessage {
      // 에러 메시지 출력
    }
  }
}
