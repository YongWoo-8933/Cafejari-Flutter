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


@JsonSerializable()
class PopUpResponse {
  final int id;
  final int? in_app_route_target, cafe, challenge;
  final String title, datetime, image;
  final String? web_view_url, external_url;
  final bool visible;

  PopUpResponse(
      {required this.id,
        required this.in_app_route_target,
        required this.cafe,
        required this.challenge,
        required this.title,
        required this.datetime,
        required this.image,
        required this.web_view_url,
        required this.external_url,
        required this.visible});

  factory PopUpResponse.fromJson(Map<String, dynamic> json) => _$PopUpResponseFromJson(json);
}
