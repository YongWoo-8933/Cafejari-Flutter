
import 'package:json_annotation/json_annotation.dart';

part 'app_config_response.g.dart';

/// 앱 기본 설정관련 DTO
@JsonSerializable()
class VersionResponse {
  final int id, major, minor, patch;
  final String updated_at, description;

  VersionResponse(
      {required this.id,
      required this.major,
      required this.minor,
      required this.patch,
      required this.updated_at,
      required this.description});

  factory VersionResponse.fromJson(Map<String, dynamic> json) => _$VersionResponseFromJson(json);
}

