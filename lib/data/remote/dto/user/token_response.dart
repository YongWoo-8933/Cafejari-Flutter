import 'package:json_annotation/json_annotation.dart';

part 'token_response.g.dart';

/// access token DTO
@JsonSerializable()
class TokenResponse {

  final String access;

  TokenResponse({required this.access});

  factory TokenResponse.fromJson(Map<String, dynamic> json) => _$TokenResponseFromJson(json);
}