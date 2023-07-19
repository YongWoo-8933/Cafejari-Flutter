// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leader_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaderResponse _$LeaderResponseFromJson(Map<String, dynamic> json) =>
    LeaderResponse(
      id: json['id'] as int,
      ranking: json['ranking'] as int,
      activity: json['activity'] as int,
      user: UserResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LeaderResponseToJson(LeaderResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ranking': instance.ranking,
      'activity': instance.activity,
      'user': instance.user,
    };
