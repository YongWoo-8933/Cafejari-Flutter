import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:cafejari_flutter/domain/use_case/util.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/data/remote/dto/cafe/cafe_response.dart';
import 'package:cafejari_flutter/data/repository/cafe_repository.dart';

/// getMapCafes의 실제 구현부
class GetMapCafes {
  Future<Cafes> call({
    required CafeRepository cafeRepository, required NCameraPosition cameraPosition}) async {
    try {
      List<CafeResponse> cafeResponseList = await cafeRepository.fetchMapCafe(
          latitude: cameraPosition.target.latitude,
          longitude: cameraPosition.target.longitude,
          zoomLevel: cameraPosition.zoom._calculateZoomLevel()
      );
      Cafes cafes = [];
      for (CafeResponse cafeResponse in cafeResponseList) {
        CafeFloors cafeFloors = [];
        for (CafeFloorCafeRepResponse cafeFloorResponse in cafeResponse.cafe_floor) {
          OccupancyRateUpdates recentUpdates = [];
          for (OccupancyRateUpdateRepResponse updateResponse in cafeFloorResponse.recent_updated_log) {
            recentUpdates.add(
                parseOccupancyRateUpdateFromOccupancyRateUpdateRepResponse(updateResponse: updateResponse));
          }
          double? wallSocketRate;
          double? occupancyRatePrediction;
          if (cafeFloorResponse.wall_socket_rate.isNotNull) {
            wallSocketRate = double.parse(cafeFloorResponse.wall_socket_rate!);
          }
          if (cafeFloorResponse.occupancy_rate_prediction.isNotNull) {
            occupancyRatePrediction = double.parse(cafeFloorResponse.occupancy_rate_prediction.occupancy_rate);
          }
          cafeFloors.add(CafeFloor(
              id: cafeFloorResponse.id,
              floor: cafeFloorResponse.floor,
              restroom: cafeFloorResponse.restroom,
              hasSeat: cafeFloorResponse.has_seat,
              wallSocketRate: wallSocketRate,
              occupancyRatePrediction: occupancyRatePrediction,
              cafe: Cafe.empty(),
              recentUpdates: recentUpdates
          ));
        }
        int? recentUpdatedFloor;
        double? recentUpdatedOccupancyRate;
        // recent update 검토
        OccupancyRateUpdate? recentUpdate;
        for(CafeFloor cafeFloor in cafeFloors) {
          if(cafeFloor.recentUpdates.isNotEmpty) {
            final OccupancyRateUpdate update = cafeFloor.recentUpdates[0];
            if(recentUpdate.isNull) {
              recentUpdate = update;
              recentUpdatedFloor = cafeFloor.floor;
              recentUpdatedOccupancyRate = update.occupancyRate;
            } else {
              // 현재 floor의 업데이트 시간이 더 최근일 때만 갱신
              if(update.update.compareTo(recentUpdate!.update) < 0) {
                recentUpdate = update;
                recentUpdatedFloor = cafeFloor.floor;
                recentUpdatedOccupancyRate = update.occupancyRate;
              }
            }
          }
        }
        // 최근 업데이트가 없으면 prediction 검토
        if(recentUpdate.isNull) {
          double? minOccupancyPrediction;
          for(CafeFloor cafeFloor in cafeFloors) {
            if(cafeFloor.occupancyRatePrediction.isNotNull) {
              if(minOccupancyPrediction.isNull) {
                minOccupancyPrediction = cafeFloor.occupancyRatePrediction;
                recentUpdatedFloor = cafeFloor.floor;
                recentUpdatedOccupancyRate = cafeFloor.occupancyRatePrediction;
              } else {
                // 현재 floor의 예상 혼잡도가 더 낮을 때만 갱신
                if(cafeFloor.occupancyRatePrediction! < minOccupancyPrediction!) {
                  minOccupancyPrediction = cafeFloor.occupancyRatePrediction;
                  recentUpdatedFloor = cafeFloor.floor;
                  recentUpdatedOccupancyRate = cafeFloor.occupancyRatePrediction;
                }
              }
            }
          }
        }
        // 이미지 정리
        List<String> imageUrls = [];
        for(CafeImageResponse cafeImageResponse in cafeResponse.cafe_image) {
          imageUrls.add(cafeImageResponse.image);
        }
        // vip 정리
        List<PartialUser> vips = [];
        for(CafeVIPResponse cafeVIPResponse in cafeResponse.cafe_vip) {
          vips.add(parsePartialUserFromPartialUserResponse(partialUserResponse: cafeVIPResponse.user, updateCount: 0));
        }
        // 최종 입력
        cafes.add(Cafe(
            id: cafeResponse.id,
            recentUpdatedFloor: recentUpdatedFloor,
            recentUpdatedOccupancyRate: recentUpdatedOccupancyRate,
            isClosed: cafeResponse.is_closed,
            name: cafeResponse.name,
            address: cafeResponse.address,
            latLng: NLatLng(cafeResponse.latitude, cafeResponse.longitude),
            cafeFloors: cafeFloors,
            openingHour: OpeningHour(
                mon: cafeResponse.opening_hour.mon,
                tue: cafeResponse.opening_hour.tue,
                wed: cafeResponse.opening_hour.wed,
                thu: cafeResponse.opening_hour.thu,
                fri: cafeResponse.opening_hour.fri,
                sat: cafeResponse.opening_hour.sat,
                son: cafeResponse.opening_hour.son),
            imageUrls: imageUrls,
            vips: vips));
      }
      return cafes;
    } on ErrorWithMessage {
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
    } else {
      return 3;
    }
  }
}
