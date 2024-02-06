// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PushResponse _$PushResponseFromJson(Map<String, dynamic> json) => PushResponse(
      id: json['id'] as int,
      title: json['title'] as String,
      pushed_at: json['pushed_at'] as String,
      type: json['type'] as String,
      is_read: json['is_read'] as bool,
      body: json['body'] as String,
    );

Map<String, dynamic> _$PushResponseToJson(PushResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'pushed_at': instance.pushed_at,
      'type': instance.type,
      'is_read': instance.is_read,
    };

PopUpResponse _$PopUpResponseFromJson(Map<String, dynamic> json) =>
    PopUpResponse(
      id: json['id'] as int,
      in_app_route_target: json['in_app_route_target'] as int?,
      cafe: json['cafe'] as int?,
      challenge: json['challenge'] as int?,
      title: json['title'] as String,
      datetime: json['datetime'] as String,
      image: json['image'] as String,
      web_view_url: json['web_view_url'] as String?,
      external_url: json['external_url'] as String?,
      visible: json['visible'] as bool,
    );

Map<String, dynamic> _$PopUpResponseToJson(PopUpResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'in_app_route_target': instance.in_app_route_target,
      'cafe': instance.cafe,
      'challenge': instance.challenge,
      'title': instance.title,
      'datetime': instance.datetime,
      'image': instance.image,
      'web_view_url': instance.web_view_url,
      'external_url': instance.external_url,
      'visible': instance.visible,
    };
