// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeResponse _$ChallengeResponseFromJson(Map<String, dynamic> json) =>
    ChallengeResponse(
      id: json['id'] as int,
      participant_limit: json['participant_limit'] as int,
      goal: json['goal'] as int,
      name: json['name'] as String,
      url: json['url'] as String?,
      description: json['description'] as String,
      start: json['start'] as String,
      finish: json['finish'] as String,
      image: json['image'] as String,
      available: json['available'] as bool,
      challenger:
          (json['challenger'] as List<dynamic>).map((e) => e as int).toList(),
      challenge_milestone: (json['challenge_milestone'] as List<dynamic>)
          .map((e) =>
              ChallengeMilestoneResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChallengeResponseToJson(ChallengeResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'participant_limit': instance.participant_limit,
      'goal': instance.goal,
      'name': instance.name,
      'description': instance.description,
      'start': instance.start,
      'finish': instance.finish,
      'image': instance.image,
      'url': instance.url,
      'available': instance.available,
      'challenger': instance.challenger,
      'challenge_milestone': instance.challenge_milestone,
    };

ChallengeMilestoneResponse _$ChallengeMilestoneResponseFromJson(
        Map<String, dynamic> json) =>
    ChallengeMilestoneResponse(
      id: json['id'] as int,
      point: json['point'] as int,
      count: json['count'] as int,
      progress_rate: json['progress_rate'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$ChallengeMilestoneResponseToJson(
        ChallengeMilestoneResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'point': instance.point,
      'count': instance.count,
      'progress_rate': instance.progress_rate,
      'description': instance.description,
    };

ChallengerResponse _$ChallengerResponseFromJson(Map<String, dynamic> json) =>
    ChallengerResponse(
      id: json['id'] as int,
      count: json['count'] as int,
      progress_rate: json['progress_rate'] as String,
      challenge:
          ChallengeResponse.fromJson(json['challenge'] as Map<String, dynamic>),
      challenge_point: (json['challenge_point'] as List<dynamic>)
          .map(
              (e) => ChallengePointResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChallengerResponseToJson(ChallengerResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'count': instance.count,
      'progress_rate': instance.progress_rate,
      'challenge': instance.challenge,
      'challenge_point': instance.challenge_point,
    };

ChallengePointResponse _$ChallengePointResponseFromJson(
        Map<String, dynamic> json) =>
    ChallengePointResponse(
      id: json['id'] as int,
      point: json['point'] as int,
      rewarded_at: json['rewarded_at'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$ChallengePointResponseToJson(
        ChallengePointResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'point': instance.point,
      'rewarded_at': instance.rewarded_at,
      'description': instance.description,
    };
