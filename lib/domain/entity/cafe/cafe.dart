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
    required final int? recentUpdatedFloor,
    required final double? recentUpdatedOccupancyRate,
    required final double? maximumWallSocketRate,
    required final int? maximumWallSocketFloor,
    required final bool isClosed,
    required final String name,
    required final String address,
    required final String? brandName,
    required final String? brandImageUrl,
    required final NLatLng latLng,
    required final CafeFloors cafeFloors,
    required final OpeningHour? openingHour,
    required final List<String> imageUrls,
    required final List<PartialUser> vips,
  }) = _Cafe;

  factory Cafe.empty() => Cafe(
      id: 0,
      recentUpdatedFloor: null,
      recentUpdatedOccupancyRate: null,
      maximumWallSocketRate: null,
      maximumWallSocketFloor: null,
      isClosed: false,
      name: "",
      address: "",
      brandName: null,
      brandImageUrl: null,
      latLng: NLocation.sinchon().cameraPosition.target,
      cafeFloors: [],
      openingHour: null,
      imageUrls: [],
      vips: []);
}

typedef CafeFloors = List<CafeFloor>;

/// cafe의 각 층 모델
@freezed
class CafeFloor with _$CafeFloor {
  factory CafeFloor(
      {required final int id,
      required final int floor,
      required final String? restroom,
      required final bool hasSeat,
      required final double? wallSocketRate,
      required final double? occupancyRatePrediction,
      required final Cafe cafe,
      required final OccupancyRateUpdates recentUpdates}) = _CafeFloor;

  factory CafeFloor.empty() => CafeFloor(
      id: 0,
      floor: 1,
      restroom: null,
      hasSeat: true,
      wallSocketRate: null,
      occupancyRatePrediction: null,
      cafe: Cafe.empty(),
      recentUpdates: []);
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
      required final CafeFloor cafeFloor,
      required final PartialUser? user}) = _OccupancyRateUpdate;

  factory OccupancyRateUpdate.empty() => OccupancyRateUpdate(
      id: 0,
      point: 0,
      occupancyRate: 0.0,
      update: DateTime(2022),
      cafeFloor: CafeFloor.empty(),
      user: null);
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
        required final String sun}) = _OpeningHour;

  factory OpeningHour.empty() => OpeningHour(
      mon: "",
      tue: "",
      wed: "",
      thu: "",
      fri: "",
      sat: "",
      sun: "");
}

typedef NaverSearchCafes = List<NaverSearchCafe>;

/// 네이버 카페 검색 결과 모델
@freezed
class NaverSearchCafe with _$NaverSearchCafe {
  factory NaverSearchCafe(
      {required final String name,
        required final String roadAddress,
        required final String dongAddress,
        required final double latitude,
        required final double longitude,
      }) = _NaverSearchCafe;

  factory NaverSearchCafe.empty() => NaverSearchCafe(
    name: "",
    roadAddress: "",
    dongAddress: "",
    latitude: 37.0,
    longitude: 127.0
  );
}

typedef Locations = List<Location>;

/// 지역 정보 결과 모델
@freezed
class Location with _$Location {
  factory Location(
      {required final String name,
        required final String imageUrl,
        required final double latitude,
        required final double longitude,
      }) = _Location;

  factory Location.empty() => Location(
    name: "",
    imageUrl: "",
    latitude: 37.0,
    longitude: 127.0
  );
}
