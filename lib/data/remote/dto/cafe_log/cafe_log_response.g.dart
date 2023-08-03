// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cafe_log_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CafeLogPageResponse _$CafeLogPageResponseFromJson(Map<String, dynamic> json) =>
    CafeLogPageResponse(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => CafeLogResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CafeLogPageResponseToJson(
        CafeLogPageResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

CafeLogResponse _$CafeLogResponseFromJson(Map<String, dynamic> json) =>
    CafeLogResponse(
      id: json['id'] as int,
      like: (json['like'] as List<dynamic>)
          .map((e) => CafeLogLikeResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      report: (json['report'] as List<dynamic>)
          .map((e) => CafeLogReportResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: PartialUserResponse.fromJson(json['user'] as Map<String, dynamic>),
      cafe: CafeRepResponse.fromJson(json['cafe'] as Map<String, dynamic>),
      snapshot: (json['snapshot'] as List<dynamic>)
          .map((e) => SnapshotResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      is_private: json['is_private'] as bool,
      is_visible: json['is_visible'] as bool,
      theme: json['theme'] as String,
      content: json['content'] as String,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
    );

Map<String, dynamic> _$CafeLogResponseToJson(CafeLogResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'cafe': instance.cafe,
      'is_private': instance.is_private,
      'is_visible': instance.is_visible,
      'theme': instance.theme,
      'content': instance.content,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'like': instance.like,
      'report': instance.report,
      'snapshot': instance.snapshot,
    };

CafeLogLikeResponse _$CafeLogLikeResponseFromJson(Map<String, dynamic> json) =>
    CafeLogLikeResponse(
      id: json['id'] as int,
      user: json['user'] as int,
    );

Map<String, dynamic> _$CafeLogLikeResponseToJson(
        CafeLogLikeResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
    };

CafeLogReportResponse _$CafeLogReportResponseFromJson(
        Map<String, dynamic> json) =>
    CafeLogReportResponse(
      id: json['id'] as int,
      user: json['user'] as int,
      reason: json['reason'] as String,
    );

Map<String, dynamic> _$CafeLogReportResponseToJson(
        CafeLogReportResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'reason': instance.reason,
    };

SnapshotResponse _$SnapshotResponseFromJson(Map<String, dynamic> json) =>
    SnapshotResponse(
      id: json['id'] as int,
      image: json['image'] as String,
      theme: json['theme'] as String,
    );

Map<String, dynamic> _$SnapshotResponseToJson(SnapshotResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'theme': instance.theme,
    };
