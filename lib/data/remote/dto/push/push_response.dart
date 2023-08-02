import 'package:cafejari_flutter/data/remote/dto/cafe/cafe_response.dart';
import 'package:cafejari_flutter/domain/entity/cafe_info/cafe_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'push_response.g.dart';

@JsonSerializable()
class PushNotification {
  final int id;
  final String title, pushed_at, type;
  final String? body;

  PushNotification(
      {required this.id,
        required this.title,
        required this.pushed_at,
        required this.type,
        required this.body});

  factory PushNotification.fromJson(Map<String, dynamic> json) => _$PushNotificationFromJson(json);
}
