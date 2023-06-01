import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/core/util.dart';
import 'package:cafejari_flutter/data/remote/dto/cafe/cafe_response.dart';
import 'package:cafejari_flutter/data/repository/cafe_repository.dart';
import 'package:cafejari_flutter/data/repository/token_repository.dart';
import 'package:cafejari_flutter/domain/entity/cafe_info/cafe_info.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:cafejari_flutter/domain/entity/util.dart';

/// getCafeInfos의 실제 구현부
class GetCafeInfos {
  Future<CafeInfos> call(
      {required CafeRepository cafeRepository,
      required TokenRepository tokenRepository,
      required String accessToken,
      required NCameraPosition cameraPosition}) async {
    try {
      List<CafeInfoResponse> cafeInfoResponseList = await cafeRepository.fetchCafeInfo(
          accessToken: accessToken,
          latitude: cameraPosition.target.latitude,
          longitude: cameraPosition.target.longitude,
          zoomLevel: cameraPosition.zoom._calculateZoomLevel()
      );

      CafeInfos cafeInfos = [];
      for (CafeInfoResponse cafeInfoResponse in cafeInfoResponseList) {
        Cafes cafes = [];
        for (CafeInfoCafeResponse cafeResponse in cafeInfoResponse.cafe) {
          RecentLogs recentLogs = [];
          for (RecentUpdatedLogResponse recentLogResponse in cafeResponse.recent_updated_log) {
            recentLogs.add(RecentLog(
                id: recentLogResponse.id,
                crowded: recentLogResponse.cafe_detail_log.crowded,
                master:
                    parseUserFromUserResponse(recentLogResponse.cafe_detail_log.cafe_log.master),
                update: DateTime.parse(recentLogResponse.update)));
          }
          cafes.add(Cafe(
              id: cafeResponse.id,
              floor: cafeResponse.floor,
              crowded: recentLogs.isNotEmpty ? recentLogs.first.crowded : -1,
              master: cafeResponse.master.isNotNull
                  ? parseUserFromUserResponse(cafeResponse.master!)
                  : User.empty(),
              wallSocket: cafeResponse.wall_socket ?? none,
              restroom: cafeResponse.restroom ?? none));
        }
        int minCrowded = -1;
        for(Cafe cafe in cafes) {
          if(cafe.crowded != -1) {
            if(minCrowded == -1) {
              minCrowded = cafe.crowded;
            } else {
              if(cafe.crowded < minCrowded) minCrowded = cafe.crowded;
            }
          }
        }
        final String gu = cafeInfoResponse.gu.length < 2 ? "" : cafeInfoResponse.gu;
        cafeInfos.add(CafeInfo(
            id: cafeInfoResponse.id,
            minCrowded: minCrowded,
            name: cafeInfoResponse.name,
            fullAddress: "${cafeInfoResponse.city} $gu ${cafeInfoResponse.address}",
            totalFloor: cafeInfoResponse.total_floor,
            firstFloor: cafeInfoResponse.floor,
            latLng: NLatLng(cafeInfoResponse.latitude, cafeInfoResponse.longitude),
            googlePlaceId: cafeInfoResponse.google_place_id,
            cafes: cafes,
            moreInfo: cafeInfoResponse.more_info.isNotEmpty
                ? MoreInfo(
                    id: cafeInfoResponse.more_info.first.id,
                    event1: cafeInfoResponse.more_info.first.event1,
                    event2: cafeInfoResponse.more_info.first.event2,
                    event3: cafeInfoResponse.more_info.first.event3,
                    notice1: cafeInfoResponse.more_info.first.notice1,
                    notice2: cafeInfoResponse.more_info.first.notice2,
                    notice3: cafeInfoResponse.more_info.first.notice3)
                : MoreInfo.empty()));
      }
      return cafeInfos;
    } on ErrorWithMessage {
      rethrow;
    } on AccessTokenExpired {
      rethrow;
    }
  }
}

extension ZoomLevel on double {
  int _calculateZoomLevel() {
    if(this >= 14.0) {
      return 1;
    } else if(this >= 12.0) {
      return 2;
    } else if(this >= 11.0) {
      return 4;
    } else if(this >= 10.0) {
      return 8;
    } else {
      return 16;
    }
  }
}
