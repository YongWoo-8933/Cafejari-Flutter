import 'package:cafejari_flutter/domain/entity/cafe_info/cafe_info.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cafejari_flutter/data/remote/dto/user/user_response.dart';

part 'cafe_response.g.dart';

/// cafe info 관련 DTO
@JsonSerializable()
class CafeResponse { //완 	SwaggerCafeResponse
  final int id;
  final int? district;
  final String name, address;
  final double latitude, longitude;
  final bool is_visible, is_closed;
  final CafeFloorRepresentation cafe_floor;
  final List<CafeVIPRepresentation> cafe_vip;
  final List<CafeImageResponse> cafe_image;
  final List<BrandResponse> brand;
  final List<int> congestion_area;

  CafeResponse(
      {required this.id,
      required this.district,
      required this.name,
      required this.address,
      required this.latitude,
      required this.longitude,
      required this.is_visible,
      required this.is_closed,
      required this.cafe_floor,
      required this.cafe_vip,
      required this.cafe_image,
      required this.brand,
      required this.congestion_area});

  factory CafeResponse.fromJson(Map<String, dynamic> json) => _$CafeResponseFromJson(json);
}

@JsonSerializable()
class CafeFloorRepresentation { //완 	SwaggerCafeFloorCafeRepresentation
  final int id, floor, cafe;
  final List<CafeFloorUpdateLog> recent_user_updated_log, recent_guest_updated_log;
  final String? wall_socket_rate, restroom;
  final OccupancyRatePrediction occupancy_rate_prediction;
  final bool has_seat;

  CafeFloorRepresentation(
      {required this.id,
        required this.floor,
        required this.cafe,
        required this.recent_user_updated_log,
        required this.recent_guest_updated_log,
        required this.wall_socket_rate,
        required this.restroom,
        required this.occupancy_rate_prediction,
        required this.has_seat});

  factory CafeFloorRepresentation.fromJson(Map<String, dynamic> json) =>
      _$CafeFloorRepresentationResponseFromJson(json);
}

@JsonSerializable()
class CafeFloorUpdateLog { // 완 	OccupancyRateUpdateLogCafeFloorRepresentation
  final int id, cafe_floor, point;
  final PartialUser? user;
  final String? occupancy_rate, update;
  final bool is_notified;

  CafeFloorUpdateLog(
      {required this.id,
        required this.cafe_floor,
        required this.point,
        required this.user,
        required this.occupancy_rate,
        required this.update,
        required this.is_notified});

  factory CafeFloorUpdateLog.fromJson(Map<String, dynamic> json) =>
      _$CafeFloorUpdateLogResponseFromJson(json);
}

@JsonSerializable() //완
class PartialUser {
  final int id ;
  final PartialProfile profile;
  final String date_joined;

  PartialUser(
      {required this.id,
        required this.profile,
        required this.date_joined});

  factory PartialUser.fromJson(Map<String, dynamic> json) =>
      _$PartialUserResponseFromJson(json);
}


@JsonSerializable() // 완
class PartialProfile {
  final int id ;
  final String nickname;
  final GradeResponse grade;
  final ProfileImageResponse profile_image;

  PartialProfile(
      {required this.id,
        required this.nickname,
        required this.grade,
        required this.profile_image});

  factory PartialProfile.fromJson(Map<String, dynamic> json) =>
      _$PartialProfileResponseFromJson(json);
}

@JsonSerializable() // 완
class OccupancyRatePrediction {
  final int id, cafe_floor;
  final String occupancy_rate, update;

  OccupancyRatePrediction(
      {required this.id,
        required this.cafe_floor,
        required this.occupancy_rate,
        required this.update});

  factory OccupancyRatePrediction.fromJson(Map<String, dynamic> json) =>
      _$OccupancyRatePredictionFromJson(json);
}

@JsonSerializable() // 완
class CafeVIPRepresentation {
  final int id, update_count, cafe;
  final PartialUser user;

  CafeVIPRepresentation(
      {required this.id,
      required this.update_count,
      required this.cafe,
      required this.user});

  factory CafeVIPRepresentation.fromJson(Map<String, dynamic> json) =>
      _$CafeVIPRepresentationResponseFromJson(json);
}

@JsonSerializable() //완
class CafeImageResponse {
  final int id, cafe;
  final String? image;
  final bool is_visible;

  CafeImageResponse(
      {required this.id,
        required this.cafe,
        required this.image,
        required this.is_visible});

  factory CafeImageResponse.fromJson(Map<String, dynamic> json) =>
      _$CafeImageResponseFromJson(json);
}

@JsonSerializable() // 완
class OpeningHour {
  final int id, cafe;
  final String mon, tue, wed, thu, fri, sat, son;

  OpeningHour(
      {required this.id,
        required this.cafe,
        required this.mon,
        required this.tue,
        required this.wed,
        required this.thu,
        required this.fri,
        required this.sat,
        required this.son});

  factory OpeningHour.fromJson(Map<String, dynamic> json) =>
      _$OpeningHourFromJson(json);
}

@JsonSerializable() //완
class BrandResponse {
  final int id;
  final String? image, name;
  final bool has_item;

  BrandResponse(
      {required this.id,
        required this.image,
        required this.name,
        required this.has_item});

  factory BrandResponse.fromJson(Map<String, dynamic> json) =>
      _$BrandResponseFromJson(json);
}

@JsonSerializable() //완
class CafeSearchResponse {
  final int count;
  final String? next, previous;
  final CafeResponse results;

  CafeSearchResponse(
      {required this.count,
        required this.next,
        required this.previous,
        required this.results});

  factory CafeSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$CafeSearchResponseFromJson(json);
}

@JsonSerializable() // 완
class OccupancyRateUpdateLogResponse {
  final int id, point, user;
  final CafeFloorLogRepresentation cafe_floor;
  final String? occupancy_rate, update;
  final bool is_notified;

  OccupancyRateUpdateLogResponse(
      {required this.id,
        required this.cafe_floor,
        required this.point,
        required this.user,
        required this.occupancy_rate,
        required this.update,
        required this.is_notified});

  factory OccupancyRateUpdateLogResponse.fromJson(Map<String, dynamic> json) =>
      _$OccupancyRateUpdateLogResponseFromJson(json);
}


@JsonSerializable() // 완
class CafeFloorLogRepresentation {
  final int id, floor;
  final Cafe cafe;
  final String? wall_socket_rate, restroom;
  final bool has_seat;

  CafeFloorLogRepresentation(
      {required this.id,
        required this.floor,
        required this.cafe,
        required this.wall_socket_rate,
        required this.restroom,
        required this.has_seat});

  factory CafeFloorLogRepresentation.fromJson(Map<String, dynamic> json) =>
      _$CafeFloorLogRepresentationFromJson(json);
}


@JsonSerializable()
class Cafe { //완
  final int id;
  final int? district, brand;
  final String name, address;
  final double latitude, longitude;
  final bool is_visible, is_closed;
  final List<int> congestion_area;

  Cafe(
      {required this.id,
        required this.district,
        required this.brand,
        required this.name,
        required this.address,
        required this.latitude,
        required this.longitude,
        required this.is_visible,
        required this.is_closed,
        required this.congestion_area});

  factory Cafe.fromJson(Map<String, dynamic> json) => _$CafeFromJson(json);
}
