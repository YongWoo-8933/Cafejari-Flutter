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
      requested_at: json['requested_at'] as String,
      answered_at: json['answered_at'] as String,
      rejection_reason: json['rejection_reason'] as String?,
      etc: json['etc'] as String?,
    );

Map<String, dynamic> _$CafeAdditionRequestResponseToJson(
        CafeAdditionRequestResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cafe': instance.cafe,
      'is_approved': instance.is_approved,
      'is_notified': instance.is_notified,
      'requested_at': instance.requested_at,
      'answered_at': instance.answered_at,
      'rejection_reason': instance.rejection_reason,
      'etc': instance.etc,
    };

CafeModificationRequestResponse _$CafeModificationRequestResponseFromJson(
        Map<String, dynamic> json) =>
    CafeModificationRequestResponse(
      id: json['id'] as int,
      cafe: CafeRepResponse.fromJson(json['cafe'] as Map<String, dynamic>),
      suggested_cafe: CafeRepResponse.fromJson(
          json['suggested_cafe'] as Map<String, dynamic>),
      is_approved: json['is_approved'] as bool,
      is_notified: json['is_notified'] as bool,
      requested_at: json['requested_at'] as String,
      answered_at: json['answered_at'] as String,
      rejection_reason: json['rejection_reason'] as String?,
      etc: json['etc'] as String?,
    );

Map<String, dynamic> _$CafeModificationRequestResponseToJson(
        CafeModificationRequestResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cafe': instance.cafe,
      'suggested_cafe': instance.suggested_cafe,
      'is_approved': instance.is_approved,
      'is_notified': instance.is_notified,
      'requested_at': instance.requested_at,
      'answered_at': instance.answered_at,
      'rejection_reason': instance.rejection_reason,
      'etc': instance.etc,
    };

UserMigrationRequestResponse _$UserMigrationRequestResponseFromJson(
        Map<String, dynamic> json) =>
    UserMigrationRequestResponse(
      id: json['id'] as int,
      is_completed: json['is_completed'] as bool,
      is_notified: json['is_notified'] as bool,
      requested_at: json['requested_at'] as String,
      phone_number: json['phone_number'] as String,
    );

Map<String, dynamic> _$UserMigrationRequestResponseToJson(
        UserMigrationRequestResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_completed': instance.is_completed,
      'is_notified': instance.is_notified,
      'requested_at': instance.requested_at,
      'phone_number': instance.phone_number,
    };
