import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:cafejari_flutter/domain/use_case/leaderboard_use_case.dart';
import 'package:cafejari_flutter/ui/state/leaderboard_state/leaderboard_state.dart';
import 'package:cafejari_flutter/ui/view_model/global_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LeaderboardViewModel extends StateNotifier<LeaderboardState> {
  final LeaderboardUseCase _leaderboardUseCase;
  final GlobalViewModel globalViewModel;

  LeaderboardViewModel({required LeaderboardUseCase leaderboardUseCase, required this.globalViewModel})
      : _leaderboardUseCase = leaderboardUseCase,
        super(LeaderboardState.empty());

  refreshRankers() async {
    try {
      final totalRankers = await _leaderboardUseCase.getTotalRankers();
      final monthRankers = await _leaderboardUseCase.getMonthRankers();
      final weekRankers = await _leaderboardUseCase.getWeekRankers();
      state = state.copyWith(
        totalRankers: totalRankers,
        monthRankers: monthRankers,
        weekRankers: weekRankers,
        myTotalRanking: _findMyRankingFromRankers(totalRankers),
        myMonthRanking: _findMyRankingFromRankers(monthRankers),
        myWeekRanking: _findMyRankingFromRankers(weekRankers),
      );
    } on RefreshTokenExpired {
      globalViewModel.logout();
    } on ErrorWithMessage {
      // 에러 메시지 출력
    }
  }

  int? _findMyRankingFromRankers(PartialUsers rankers) {
    final int index = rankers.indexWhere((element) => element.userId == globalViewModel.state.user.userId);
    return index >= 0 ? index + 1 : null;
  }

  setRankingType(int rankingType) {
    state = state.copyWith(rankingType: rankingType);
  }
}
