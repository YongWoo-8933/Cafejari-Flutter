
import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/domain/entity/cafe_log/util.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cafe_log.freezed.dart';


typedef CafeLogs = List<CafeLog>;

/// cafe log 모델
@freezed
class CafeLog with _$CafeLog {
  factory CafeLog({
    required final int id,
    required final bool isVisible,
    required final bool isPrivate,
    required final String content,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    required final CafeLogTheme theme,
    required final PartialUser user,
    required final Cafe cafe,
    required final List<int> likeUserIds,
    required final List<int> reportUserIds,
    required final List<String> imageUrls,
  }) = _CafeLog;

  factory CafeLog.empty() => CafeLog(
      id: 0,
      isVisible: true,
      isPrivate: false,
      content: "",
      createdAt: DateTime(2022),
      updatedAt: DateTime(2022),
      theme: CafeLogTheme.free(),
      user: PartialUser.empty(),
      cafe: Cafe.empty(),
      likeUserIds: [],
      reportUserIds: [],
      imageUrls: []);
}

typedef Snapshots = List<Snapshot>;

/// snapshot 모델
@freezed
class Snapshot with _$Snapshot {
  factory Snapshot({
    required final int id,
    required final String imageUrl,
    required final CafeLogTheme theme,
  }) = _Snapshot;

  factory Snapshot.empty() => Snapshot(
      id: 0,
      imageUrl: "",
      theme: CafeLogTheme.free());
}
