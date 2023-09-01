
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'leaderboard_state.freezed.dart';

@freezed
class LeaderboardState with _$LeaderboardState {
  factory LeaderboardState(
      {required final PartialUsers monthRankers,
      required final PartialUsers weekRankers,
      required final PartialUsers totalRankers,
      required final int? myMonthRanking,
      required final int? myWeekRanking,
      required final int? myTotalRanking,
      required final int rankingType,
      required final List<int?> myRanking}) = _LeaderboardState;

  factory LeaderboardState.empty() => LeaderboardState(
      monthRankers: [],
      weekRankers: [],
      totalRankers: [],
      myMonthRanking: null,
      myWeekRanking: null,
      myTotalRanking: null,
      rankingType: 0,
      myRanking: []
  );
}
