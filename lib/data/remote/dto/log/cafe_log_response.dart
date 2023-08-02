import 'package:cafejari_flutter/data/remote/dto/cafe/cafe_response.dart';
import 'package:cafejari_flutter/data/remote/dto/user/user_response.dart';
import 'package:json_annotation/json_annotation.dart';


part 'cafe_log_response.g.dart';

@JsonSerializable()
class CafeLogPageResponse {
  final int count;
  final String? next, previous;
  final List<CafeLogResponse> results;

  CafeLogPageResponse(
      {required this.count,
        required this.next,
        required this.previous,
        required this.results});

  factory CafeLogPageResponse.fromJson(Map<String, dynamic> json) => _$CafeLogPageResponseFromJson(json);
}

@JsonSerializable()
class CafeLogResponse {
  final int id;
  final PartialUserResponse user;
  final CafeRepResponse cafe;
  final bool is_private, is_visible;
  final String theme, content, created_at, updated_at;
  final List<CafeLogLikeResponse> like;
  final List<CafeLogReportResponse> report;
  final List<SnapshotResponse> snapshot;

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
class CafeLogLikeResponse {
  final int id, user;

  CafeLogLikeResponse(
      {required this.id,
        required this.user});

  factory CafeLogLikeResponse.fromJson(Map<String, dynamic> json) => _$CafeLogLikeResponseFromJson(json);
}

@JsonSerializable()
class CafeLogReportResponse {
  final int id, user;
  final String reason;

  CafeLogReportResponse(
      {required this.id,
        required this.user,
        required this.reason});

  factory CafeLogReportResponse.fromJson(Map<String, dynamic> json) => _$CafeLogReportResponseFromJson(json);
}

@JsonSerializable()
class SnapshotResponse {
  final int id;
  final String image, theme;

  SnapshotResponse(
      {required this.id,
        required this.image,
        required this.theme});

  factory SnapshotResponse.fromJson(Map<String, dynamic> json) => _$SnapshotResponseFromJson(json);
}

