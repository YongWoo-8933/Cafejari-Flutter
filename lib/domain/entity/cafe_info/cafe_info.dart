import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cafejari_flutter/core/util.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:cafejari_flutter/ui/util/n_location.dart';

part 'cafe_info.freezed.dart';

typedef CafeInfos = List<CafeInfo>;

/// cafe info 모델
@freezed
class CafeInfo with _$CafeInfo {
  factory CafeInfo({
    required final int id,
    required final int minCrowded,
    required final String name,
    required final String fullAddress,
    required final int totalFloor,
    required final int firstFloor,
    required final NLatLng latLng,
    required final String googlePlaceId,
    required final Cafes cafes,
    required final MoreInfo moreInfo,
  }) = _CafeInfo;

  factory CafeInfo.empty() => CafeInfo(
      id: 0,
      minCrowded: -1,
      name: none,
      fullAddress: none,
      totalFloor: 1,
      firstFloor: 1,
      latLng: NLocation.sinchon().cameraPosition.target,
      googlePlaceId: none,
      cafes: [],
      moreInfo: MoreInfo.empty());
}

typedef Cafes = List<Cafe>;

/// cafe info의 각 층 모델
@freezed
class Cafe with _$Cafe {
  factory Cafe(
      {required final int id,
      required final int floor,
      required final int crowded,
      required final User master,
      required final String wallSocket,
      required final String restroom}) = _Cafe;
}

/// cafe info의 각 층별 최근 혼잡도 로그 모델
@freezed
class RecentLog with _$RecentLog {
  factory RecentLog(
      {required final int id,
      required final int crowded,
      required final User master,
      required final DateTime update}) = _RecentLog;
}

typedef RecentLogs = List<RecentLog>;

/// cafe info의 추가정보(이벤트 + 공지) 모델
@freezed
class MoreInfo with _$MoreInfo {
  factory MoreInfo(
      {required final int id,
      required final String event1,
      required final String event2,
      required final String event3,
      required final String notice1,
      required final String notice2,
      required final String notice3}) = _MoreInfo;

  factory MoreInfo.empty() => MoreInfo(
      id: 0, event1: none, event2: none, event3: none, notice1: none, notice2: none, notice3: none);
}
