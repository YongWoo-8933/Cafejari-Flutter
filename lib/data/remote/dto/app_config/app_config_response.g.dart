// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VersionResponse _$VersionResponseFromJson(Map<String, dynamic> json) =>
    VersionResponse(
      id: json['id'] as int,
      major: json['major'] as int,
      minor: json['minor'] as int,
      patch: json['patch'] as int,
      updated_at: json['updated_at'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$VersionResponseToJson(VersionResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'major': instance.major,
      'minor': instance.minor,
      'patch': instance.patch,
      'updated_at': instance.updated_at,
      'description': instance.description,
    };
