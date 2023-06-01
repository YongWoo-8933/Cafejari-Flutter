import 'package:json_annotation/json_annotation.dart';

part 'error_response.g.dart';

/// http status 409번 에러 응답 DTO
@JsonSerializable()
class ConflictErrorResponse {
  final int error_code;
  final String? detail;

  ConflictErrorResponse({required this.error_code, required this.detail});

  factory ConflictErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ConflictErrorResponseFromJson(json);
}

/// http status 400번 validation 관련 에러 응답 DTO
@JsonSerializable()
class ValidationErrorResponse {
  final List<String>? non_field_errors, nickname, phone_number;

  ValidationErrorResponse(
      {required this.non_field_errors,
      required this.nickname,
      required this.phone_number});

  factory ValidationErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ValidationErrorResponseFromJson(json);
}
