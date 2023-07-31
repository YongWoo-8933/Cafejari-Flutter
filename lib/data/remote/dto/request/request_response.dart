import 'package:cafejari_flutter/data/remote/dto/cafe/cafe_response.dart';
import 'package:cafejari_flutter/domain/entity/cafe_info/cafe_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'request_response.g.dart';

@JsonSerializable()
class CafeAdditionRequestResponse {
  final int id, user;
  final Cafe cafe;
  final bool is_approved, is_notified;
  final String request_at, answered_at;
  final String? body;

  CafeAdditionRequestResponse(
      {required this.id,
        required this.cafe,
        required this.is_approved,
        required this.is_notified,
        required this.request_at,
        required this.answered_at,
        required this.body});

  factory CafeAdditionRequestResponse.fromJson(Map<String, dynamic> json) => _$PCafeAdditionRequestResponseFromJson(json);
}
