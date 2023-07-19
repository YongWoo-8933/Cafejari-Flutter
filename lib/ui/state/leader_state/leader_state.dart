import 'package:cafejari_flutter/domain/entity/leader/leader_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'leader_state.freezed.dart';

@freezed
class LeaderState with _$LeaderState {
  factory LeaderState(
      {required final LeaderInfos monthLeaderInfos,
        required final LeaderInfos weekLeaderInfos,
        required final LeaderInfo selectedLeaderInfo}) = _LeaderState;

  factory LeaderState.empty() => LeaderState(
      monthLeaderInfos: [], weekLeaderInfos: [], selectedLeaderInfo: LeaderInfo.empty());
}
