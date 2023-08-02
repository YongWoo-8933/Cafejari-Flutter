import 'package:cafejari_flutter/data/remote/dto/cafe/cafe_response.dart';
import 'package:cafejari_flutter/domain/entity/cafe_info/cafe.dart';
import 'package:json_annotation/json_annotation.dart';

part 'request_response.g.dart';

@JsonSerializable()
class CafeAdditionRequestResponse {
  final int id;
  final CafeRepResponse cafe;
  final bool is_approved, is_notified;
  final String request_at, answered_at;
  final String? rejection_reason;

  CafeAdditionRequestResponse(
      {required this.id,
        required this.cafe,
        required this.is_approved,
        required this.is_notified,
        required this.request_at,
        required this.answered_at,
        required this.rejection_reason});

  factory CafeAdditionRequestResponse.fromJson(Map<String, dynamic> json) => _$CafeAdditionRequestResponseFromJson(json);
}
