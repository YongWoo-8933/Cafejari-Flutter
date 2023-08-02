import 'package:freezed_annotation/freezed_annotation.dart';


part 'leader_info.freezed.dart';

typedef LeaderInfos = List<LeaderInfo>;

/// cafe info 모델
@freezed
class LeaderInfo with _$LeaderInfo {
  factory LeaderInfo({
    required final int id,
    required final int activity,
    required final int ranking,
    required final String? nickname,
    required final String? image,

  }) = _LeaderInfo;

  factory LeaderInfo.empty() => LeaderInfo(
      id: 0,
      activity: 0,
      ranking: 0,
      nickname: null,
      image: null
  );

}
