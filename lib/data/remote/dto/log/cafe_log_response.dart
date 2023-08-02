import 'package:cafejari_flutter/data/remote/dto/cafe/cafe_response.dart';
import 'package:cafejari_flutter/domain/entity/cafe_info/cafe_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cafe_log_response.g.dart';

@JsonSerializable()
class CafeLogListResponse {
  final int count;
  final String? next, previous;
  final CafeLogResponse results;

  CafeLogListResponse(
      {required this.count,
        required this.next,
        required this.previous,
        required this.results});

  factory CafeLogListResponse.fromJson(Map<String, dynamic> json) => _$CafeLogListResponseFromJson(json);
}

@JsonSerializable()
class CafeLogResponse {
  final int id;
  final List<CafeLogLike> like;
  final List<CafeLogReport> report;
  final PartialUser user;
  final Cafe cafe;
  final List<SnapShotResponse> snapshot;
  final bool is_private, is_visible;
  final String theme, content, created_at, updated_at;


  CafeLogResponse(
      {required this.id,
        required this.like,
        required this.report,
        required this.user,
        required this.cafe,
        required this.snapshot,
        required this.is_private,
        required this.is_visible,
        required this.theme,
        required this.content,
        required this.created_at,
        required this.updated_at});

  factory CafeLogResponse.fromJson(Map<String, dynamic> json) => _$CafeLogResponseFromJson(json);
}

@JsonSerializable()
class CafeLogLike { //완 	SwaggerCafeResponse
  final int id, cafe_log, user;


  CafeLogLike(
      {required this.id,
        required this.cafe_log,
        required this.user,});

  factory CafeLogLike.fromJson(Map<String, dynamic> json) => _$CafeLogLikeFromJson(json);
}

@JsonSerializable()
class CafeLogReport { //완 	SwaggerCafeResponse
  final int id, cafe_log, user;
  final String? reason;

  CafeLogReport(
      {required this.id,
        required this.cafe_log,
        required this.user,
        required this.reason});

  factory CafeLogReport.fromJson(Map<String, dynamic> json) => _$CafeLogReportFromJson(json);
}

@JsonSerializable()
class SnapShotResponse { //완 	SwaggerCafeResponse
  final int id;
  final String? image, theme;

  SnapShotResponse(
      {required this.id,
        required this.image,
        required this.theme});

  factory SnapShotResponse.fromJson(Map<String, dynamic> json) => _$SnapShotResponseFromJson(json);
}

