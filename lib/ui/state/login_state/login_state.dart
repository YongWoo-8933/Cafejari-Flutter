
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'leaderboard_state.freezed.dart';

@freezed
class LeaderboardState with _$LeaderboardState {
  factory LeaderboardState(
      {required final PartialUsers monthRankers,
        required final PartialUsers weekRankers,
        required final PartialUsers totalRankers}) = _LeaderboardState;

  factory LeaderboardState.empty() => LeaderboardState(
      monthRankers: [], weekRankers: [], totalRankers: []);
}
