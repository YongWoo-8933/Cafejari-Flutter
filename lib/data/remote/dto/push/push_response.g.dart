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
      body: json['body'] as String,
    );

Map<String, dynamic> _$PushResponseToJson(PushResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'pushed_at': instance.pushed_at,
      'type': instance.type,
    };
