import 'package:json_annotation/json_annotation.dart';

part 'push_response.g.dart';

@JsonSerializable()
class PushResponse {
  final int id;
  final String title, body, pushed_at, type;
  final bool is_read;

  PushResponse(
      {required this.id,
        required this.title,
        required this.pushed_at,
        required this.type,
        required this.is_read,
        required this.body});

  factory PushResponse.fromJson(Map<String, dynamic> json) => _$PushResponseFromJson(json);
}
