import 'package:cafejari_flutter/data/remote/dto/cafe/cafe_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'request_response.g.dart';

@JsonSerializable()
class CafeAdditionRequestResponse {
  final int id;
  final CafeRepResponse cafe;
  final bool is_approved, is_notified;
  final String requested_at, answered_at;
  final String? rejection_reason, etc;

  CafeAdditionRequestResponse(
      {required this.id,
        required this.cafe,
        required this.is_approved,
        required this.is_notified,
        required this.requested_at,
        required this.answered_at,
        required this.rejection_reason,
        required this.etc});

  factory CafeAdditionRequestResponse.fromJson(Map<String, dynamic> json) => _$CafeAdditionRequestResponseFromJson(json);
}


@JsonSerializable()
class CafeModificationRequestResponse {
  final int id;
  final CafeRepResponse cafe;
  final CafeRepResponse suggested_cafe;
  final bool is_approved, is_notified;
  final String requested_at, answered_at;
  final String? rejection_reason, etc;

  CafeModificationRequestResponse(
      {required this.id,
        required this.cafe,
        required this.suggested_cafe,
        required this.is_approved,
        required this.is_notified,
        required this.requested_at,
        required this.answered_at,
        required this.rejection_reason,
        required this.etc});

  factory CafeModificationRequestResponse.fromJson(Map<String, dynamic> json) => _$CafeModificationRequestResponseFromJson(json);
}

@JsonSerializable()
class UserMigrationRequestResponse {
  final int id;
  final bool is_completed, is_notified;
  final String requested_at, phone_number;

  UserMigrationRequestResponse(
      {required this.id,
        required this.is_completed,
        required this.is_notified,
        required this.requested_at,
        required this.phone_number});

  factory UserMigrationRequestResponse.fromJson(Map<String, dynamic> json) => _$UserMigrationRequestResponseFromJson(json);
}
