// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConflictErrorResponse _$ConflictErrorResponseFromJson(
        Map<String, dynamic> json) =>
    ConflictErrorResponse(
      error_code: json['error_code'] as int,
      error_message: json['error_message'] as String,
    );

Map<String, dynamic> _$ConflictErrorResponseToJson(
        ConflictErrorResponse instance) =>
    <String, dynamic>{
      'error_code': instance.error_code,
      'error_message': instance.error_message,
    };

ValidationErrorResponse _$ValidationErrorResponseFromJson(
        Map<String, dynamic> json) =>
    ValidationErrorResponse(
      non_field_errors: (json['non_field_errors'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      nickname: (json['nickname'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      phone_number: (json['phone_number'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ValidationErrorResponseToJson(
        ValidationErrorResponse instance) =>
    <String, dynamic>{
      'non_field_errors': instance.non_field_errors,
      'nickname': instance.nickname,
      'phone_number': instance.phone_number,
    };
