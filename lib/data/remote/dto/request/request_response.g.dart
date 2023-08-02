// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CafeAdditionRequestResponse _$CafeAdditionRequestResponseFromJson(
        Map<String, dynamic> json) =>
    CafeAdditionRequestResponse(
      id: json['id'] as int,
      cafe: CafeRepResponse.fromJson(json['cafe'] as Map<String, dynamic>),
      is_approved: json['is_approved'] as bool,
      is_notified: json['is_notified'] as bool,
      request_at: json['request_at'] as String,
      answered_at: json['answered_at'] as String,
      rejection_reason: json['rejection_reason'] as String?,
    );

Map<String, dynamic> _$CafeAdditionRequestResponseToJson(
        CafeAdditionRequestResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cafe': instance.cafe,
      'is_approved': instance.is_approved,
      'is_notified': instance.is_notified,
      'request_at': instance.request_at,
      'answered_at': instance.answered_at,
      'rejection_reason': instance.rejection_reason,
    };
