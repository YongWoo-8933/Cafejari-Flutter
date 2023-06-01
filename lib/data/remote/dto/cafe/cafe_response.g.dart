// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cafe_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CafeInfoResponse _$CafeInfoResponseFromJson(Map<String, dynamic> json) =>
    CafeInfoResponse(
      id: json['id'] as int,
      name: json['name'] as String,
      city: json['city'] as String,
      gu: json['gu'] as String,
      address: json['address'] as String,
      total_floor: json['total_floor'] as int,
      floor: json['floor'] as int,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      google_place_id: json['google_place_id'] as String,
      cafe: (json['cafe'] as List<dynamic>)
          .map((e) => CafeInfoCafeResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      more_info: (json['more_info'] as List<dynamic>)
          .map((e) => MoreInfoResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CafeInfoResponseToJson(CafeInfoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'total_floor': instance.total_floor,
      'floor': instance.floor,
      'name': instance.name,
      'city': instance.city,
      'gu': instance.gu,
      'address': instance.address,
      'google_place_id': instance.google_place_id,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'cafe': instance.cafe,
      'more_info': instance.more_info,
    };

CafeInfoCafeResponse _$CafeInfoCafeResponseFromJson(
        Map<String, dynamic> json) =>
    CafeInfoCafeResponse(
      id: json['id'] as int,
      recent_updated_log: (json['recent_updated_log'] as List<dynamic>)
          .map((e) =>
              RecentUpdatedLogResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      floor: json['floor'] as int,
      restroom: json['restroom'] as String?,
      wall_socket: json['wall_socket'] as String?,
      master: json['master'] == null
          ? null
          : UserResponse.fromJson(json['master'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CafeInfoCafeResponseToJson(
        CafeInfoCafeResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'floor': instance.floor,
      'recent_updated_log': instance.recent_updated_log,
      'restroom': instance.restroom,
      'wall_socket': instance.wall_socket,
      'master': instance.master,
    };

RecentUpdatedLogResponse _$RecentUpdatedLogResponseFromJson(
        Map<String, dynamic> json) =>
    RecentUpdatedLogResponse(
      id: json['id'] as int,
      update: json['update'] as String,
      cafe_detail_log: CafeInfoDetailLogResponse.fromJson(
          json['cafe_detail_log'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecentUpdatedLogResponseToJson(
        RecentUpdatedLogResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'update': instance.update,
      'cafe_detail_log': instance.cafe_detail_log,
    };

CafeInfoDetailLogResponse _$CafeInfoDetailLogResponseFromJson(
        Map<String, dynamic> json) =>
    CafeInfoDetailLogResponse(
      id: json['id'] as int,
      crowded: json['crowded'] as int,
      update: json['update'] as String,
      cafe_log: CafeInfoCafeLogResponse.fromJson(
          json['cafe_log'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CafeInfoDetailLogResponseToJson(
        CafeInfoDetailLogResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'crowded': instance.crowded,
      'update': instance.update,
      'cafe_log': instance.cafe_log,
    };

CafeInfoCafeLogResponse _$CafeInfoCafeLogResponseFromJson(
        Map<String, dynamic> json) =>
    CafeInfoCafeLogResponse(
      id: json['id'] as int,
      start: json['start'] as String,
      finish: json['finish'] as String,
      expired: json['expired'] as bool,
      notified: json['notified'] as bool,
      point: json['point'] as int,
      update_period: json['update_period'] as int,
      master: UserResponse.fromJson(json['master'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CafeInfoCafeLogResponseToJson(
        CafeInfoCafeLogResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'point': instance.point,
      'update_period': instance.update_period,
      'start': instance.start,
      'finish': instance.finish,
      'expired': instance.expired,
      'notified': instance.notified,
      'master': instance.master,
    };

MoreInfoResponse _$MoreInfoResponseFromJson(Map<String, dynamic> json) =>
    MoreInfoResponse(
      id: json['id'] as int,
      image: json['image'] as String,
      event1: json['event1'] as String,
      event2: json['event2'] as String,
      event3: json['event3'] as String,
      notice1: json['notice1'] as String,
      notice2: json['notice2'] as String,
      notice3: json['notice3'] as String,
    );

Map<String, dynamic> _$MoreInfoResponseToJson(MoreInfoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'event1': instance.event1,
      'event2': instance.event2,
      'event3': instance.event3,
      'notice1': instance.notice1,
      'notice2': instance.notice2,
      'notice3': instance.notice3,
    };
