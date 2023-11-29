// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RankerResponse _$RankerResponseFromJson(Map<String, dynamic> json) =>
    RankerResponse(
      id: json['id'] as int,
      sharing_count: json['sharing_count'] as int,
      user: PartialUserResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RankerResponseToJson(RankerResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sharing_count': instance.sharing_count,
      'user': instance.user,
    };

MonthlyHotCafeLogResponse _$MonthlyHotCafeLogResponseFromJson(
        Map<String, dynamic> json) =>
    MonthlyHotCafeLogResponse(
      id: json['id'] as int,
      date: json['date'] as String,
      cafe_log:
          CafeLogResponse.fromJson(json['cafe_log'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MonthlyHotCafeLogResponseToJson(
        MonthlyHotCafeLogResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'cafe_log': instance.cafe_log,
    };
