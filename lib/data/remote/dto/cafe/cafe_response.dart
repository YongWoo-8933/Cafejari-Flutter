
import 'dart:ffi';

import 'package:cafejari_flutter/data/remote/dto/shop/shop_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cafejari_flutter/data/remote/dto/user/user_response.dart';

part 'cafe_response.g.dart';

/// cafe 관련 DTO
@JsonSerializable()
class CafeResponse {
  final int id;
  final String name, address;
  final double latitude, longitude;
  final bool is_visible, is_closed;
  final OpeningHourResponse opening_hour;
  final BrandResponse? brand;
  final List<CafeFloorCafeRepResponse> cafe_floor;
  final List<CafeVIPResponse> cafe_vip;
  final List<CafeImageResponse> cafe_image;

  CafeResponse(
      {required this.id,
      required this.name,
      required this.address,
      required this.latitude,
      required this.longitude,
      required this.is_visible,
      required this.is_closed,
      required this.opening_hour,
      required this.brand,
      required this.cafe_floor,
      required this.cafe_vip,
      required this.cafe_image});

  factory CafeResponse.fromJson(Map<String, dynamic> json) => _$CafeResponseFromJson(json);
}

@JsonSerializable()
class CafeSearchResponse {
  final int id;
  final String name, address;
  final double latitude, longitude;

  CafeSearchResponse(
      {required this.id,
      required this.name,
      required this.latitude,
      required this.longitude,
      required this.address});

  factory CafeSearchResponse.fromJson(Map<String, dynamic> json) => _$CafeSearchResponseFromJson(json);
}

@JsonSerializable()
class CafeFloorCafeRepResponse {
  final int id, floor;
  final String? wall_socket_rate, restroom;
  final bool has_seat;
  final OccupancyRatePredictionResponse? occupancy_rate_prediction;
  final List<OccupancyRateUpdateRepResponse> recent_updated_log;

  CafeFloorCafeRepResponse(
      {required this.id,
        required this.floor,
        required this.wall_socket_rate,
        required this.restroom,
        required this.has_seat,
        required this.occupancy_rate_prediction,
        required this.recent_updated_log});

  factory CafeFloorCafeRepResponse.fromJson(Map<String, dynamic> json) =>
      _$CafeFloorCafeRepResponseFromJson(json);
}

@JsonSerializable()
class OccupancyRateUpdateRepResponse {
  final int id, point;
  final String occupancy_rate, update;
  final PartialUserResponse? user;

  OccupancyRateUpdateRepResponse(
      {required this.id,
        required this.point,
        required this.occupancy_rate,
        required this.update,
        required this.user});

  factory OccupancyRateUpdateRepResponse.fromJson(Map<String, dynamic> json) =>
      _$OccupancyRateUpdateRepResponseFromJson(json);
}

@JsonSerializable()
class OccupancyRatePredictionResponse {
  final int id;
  final String occupancy_rate, update;

  OccupancyRatePredictionResponse(
      {required this.id,
        required this.occupancy_rate,
        required this.update});

  factory OccupancyRatePredictionResponse.fromJson(Map<String, dynamic> json) =>
      _$OccupancyRatePredictionResponseFromJson(json);
}

@JsonSerializable()
class CafeVIPResponse {
  final int id, update_count;
  final PartialUserResponse user;

  CafeVIPResponse(
      {required this.id,
      required this.update_count,
      required this.user});

  factory CafeVIPResponse.fromJson(Map<String, dynamic> json) =>
      _$CafeVIPResponseFromJson(json);
}

@JsonSerializable()
class CafeImageResponse {
  final int id;
  final String image;
  final bool is_visible;

  CafeImageResponse(
      {required this.id,
        required this.image,
        required this.is_visible});

  factory CafeImageResponse.fromJson(Map<String, dynamic> json) =>
      _$CafeImageResponseFromJson(json);
}

@JsonSerializable()
class OpeningHourResponse {
  final int id;
  final String mon, tue, wed, thu, fri, sat, sun;

  OpeningHourResponse(
      {required this.id,
        required this.mon,
        required this.tue,
        required this.wed,
        required this.thu,
        required this.fri,
        required this.sat,
        required this.sun});

  factory OpeningHourResponse.fromJson(Map<String, dynamic> json) =>
      _$OpeningHourResponseFromJson(json);
}

@JsonSerializable()
class CafePageResponse {
  final int count;
  final String? next, previous;
  final List<CafeResponse> results;

  CafePageResponse(
      {required this.count,
        required this.next,
        required this.previous,
        required this.results});

  factory CafePageResponse.fromJson(Map<String, dynamic> json) =>
      _$CafePageResponseFromJson(json);
}

@JsonSerializable()
class OccupancyRateUpdateResponse {
  final int id, point;
  final CafeFloorOccupancyRepResponse cafe_floor;
  final String occupancy_rate, update;

  OccupancyRateUpdateResponse(
      {required this.id,
        required this.cafe_floor,
        required this.point,
        required this.occupancy_rate,
        required this.update});

  factory OccupancyRateUpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$OccupancyRateUpdateResponseFromJson(json);
}

@JsonSerializable()
class CafeFloorOccupancyRepResponse {
  final int id, floor;
  final CafeRepResponse cafe;
  final String? wall_socket_rate, restroom;
  final bool has_seat;

  CafeFloorOccupancyRepResponse(
      {required this.id,
        required this.floor,
        required this.cafe,
        required this.wall_socket_rate,
        required this.restroom,
        required this.has_seat});

  factory CafeFloorOccupancyRepResponse.fromJson(Map<String, dynamic> json) =>
      _$CafeFloorOccupancyRepResponseFromJson(json);
}


@JsonSerializable()
class CafeRepResponse {
  final int id;
  final String name, address;
  final double latitude, longitude;
  final bool is_visible, is_closed;

  CafeRepResponse(
      {required this.id,
        required this.name,
        required this.address,
        required this.latitude,
        required this.longitude,
        required this.is_visible,
        required this.is_closed});

  factory CafeRepResponse.fromJson(Map<String, dynamic> json) => _$CafeRepResponseFromJson(json);
}

@JsonSerializable()
class NaverSearchCafeResponse {
  final List<NaverSearchCafeItemResponse> items;

  NaverSearchCafeResponse({required this.items});

  factory NaverSearchCafeResponse.fromJson(Map<String, dynamic> json) => _$NaverSearchCafeResponseFromJson(json);
}

@JsonSerializable()
class NaverSearchCafeItemResponse {
  final String title;
  final String address;
  final String roadAddress;
  final String mapx;
  final String mapy;

  NaverSearchCafeItemResponse({
    required this.title,
    required this.address,
    required this.roadAddress,
    required this.mapx,
    required this.mapy,
  });

  factory NaverSearchCafeItemResponse.fromJson(Map<String, dynamic> json) => _$NaverSearchCafeItemResponseFromJson(json);
}
