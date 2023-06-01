import 'package:json_annotation/json_annotation.dart';
import 'package:cafejari_flutter/data/remote/dto/user/user_response.dart';

part 'cafe_response.g.dart';

/// cafe info 관련 DTO
@JsonSerializable()
class CafeInfoResponse {
  final int id, total_floor, floor;
  final String name, city, gu, address, google_place_id;
  final double latitude, longitude;
  final List<CafeInfoCafeResponse> cafe;
  final List<MoreInfoResponse> more_info;

  CafeInfoResponse(
      {required this.id,
      required this.name,
      required this.city,
      required this.gu,
      required this.address,
      required this.total_floor,
      required this.floor,
      required this.latitude,
      required this.longitude,
      required this.google_place_id,
      required this.cafe,
      required this.more_info});

  factory CafeInfoResponse.fromJson(Map<String, dynamic> json) => _$CafeInfoResponseFromJson(json);
}

@JsonSerializable()
class CafeInfoCafeResponse {
  final int id, floor;
  final List<RecentUpdatedLogResponse> recent_updated_log;
  final String? restroom, wall_socket;
  final UserResponse? master;

  CafeInfoCafeResponse(
      {required this.id,
      required this.recent_updated_log,
      required this.floor,
      required this.restroom,
      required this.wall_socket,
      required this.master});

  factory CafeInfoCafeResponse.fromJson(Map<String, dynamic> json) =>
      _$CafeInfoCafeResponseFromJson(json);
}

@JsonSerializable()
class RecentUpdatedLogResponse {
  final int id;
  final String update;
  final CafeInfoDetailLogResponse cafe_detail_log;

  RecentUpdatedLogResponse({
    required this.id,
    required this.update,
    required this.cafe_detail_log,
  });

  factory RecentUpdatedLogResponse.fromJson(Map<String, dynamic> json) =>
      _$RecentUpdatedLogResponseFromJson(json);
}

@JsonSerializable()
class CafeInfoDetailLogResponse {
  final int id, crowded;
  final String update;
  final CafeInfoCafeLogResponse cafe_log;

  CafeInfoDetailLogResponse({
    required this.id,
    required this.crowded,
    required this.update,
    required this.cafe_log,
  });

  factory CafeInfoDetailLogResponse.fromJson(Map<String, dynamic> json) =>
      _$CafeInfoDetailLogResponseFromJson(json);
}

@JsonSerializable()
class CafeInfoCafeLogResponse {
  final int id, point, update_period;
  final String start, finish;
  final bool expired, notified;
  final UserResponse master;

  CafeInfoCafeLogResponse(
      {required this.id,
      required this.start,
      required this.finish,
      required this.expired,
      required this.notified,
      required this.point,
      required this.update_period,
      required this.master});

  factory CafeInfoCafeLogResponse.fromJson(Map<String, dynamic> json) =>
      _$CafeInfoCafeLogResponseFromJson(json);
}

@JsonSerializable()
class MoreInfoResponse {
  final int id;
  final String image, event1, event2, event3, notice1, notice2, notice3;

  MoreInfoResponse({
    required this.id,
    required this.image,
    required this.event1,
    required this.event2,
    required this.event3,
    required this.notice1,
    required this.notice2,
    required this.notice3,
  });

  factory MoreInfoResponse.fromJson(Map<String, dynamic> json) => _$MoreInfoResponseFromJson(json);
}
