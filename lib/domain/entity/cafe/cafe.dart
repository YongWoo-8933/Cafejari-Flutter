import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:cafejari_flutter/ui/util/n_location.dart';

part 'cafe.freezed.dart';

typedef Cafes = List<Cafe>;

/// cafe 모델
@freezed
class Cafe with _$Cafe {
  factory Cafe({
    required final int id,
    required final int? minOccupancyFloor,
    required final double? minOccupancyRate, minOccupancyPrediction,
    required final bool isClosed,
    required final String name, address,
    required final NLatLng latLng,
    required final CafeFloors cafeFloors,
    required final OpeningHour? openingHour,
    required final List<String> imageUrls,
    required final List<PartialUser> vips,
  }) = _Cafe;

  factory Cafe.empty() => Cafe(
      id: 0,
      minOccupancyFloor: null,
      minOccupancyRate: null,
      minOccupancyPrediction: null,
      isClosed: false,
      name: "",
      address: "",
      latLng: NLocation.sinchon().cameraPosition.target,
      cafeFloors: [],
      openingHour: null,
      imageUrls: []);
}

typedef CafeFloors = List<CafeFloor>;

/// cafe의 각 층 모델
@freezed
class CafeFloor with _$CafeFloor {
  factory CafeFloor(
      {required final int id, floor,
      required final String? wallSocket, restroom,
      required final bool hasSeat,
      required final double? occupancyRatePrediction,
      required final OccupancyRateUpdates userUpdates, guestUpdates}) = _CafeFloor;

  factory CafeFloor.empty() => CafeFloor(
      id: 0,
      floor: 1,
      wallSocket: null,
      restroom: null,
      hasSeat: true,
      occupancyRatePrediction: null,
      userUpdates: [],
      guestUpdates: []);
}

typedef OccupancyRateUpdates = List<OccupancyRateUpdate>;

/// 혼잡도 업데이트 정보 모델
@freezed
class OccupancyRateUpdate with _$OccupancyRateUpdate {
  factory OccupancyRateUpdate(
      {required final int id,
      required final int point,
      required final double occupancyRate,
      required final DateTime update,
      required final PartialUser user}) = _OccupancyRateUpdate;
}

/// 영업 시간 정보 모델
@freezed
class OpeningHour with _$OpeningHour {
  factory OpeningHour(
      {required final String mon,
        required final String tue,
        required final String wed,
        required final String thu,
        required final String fri,
        required final String sat,
        required final String son}) = _OpeningHour;
}
