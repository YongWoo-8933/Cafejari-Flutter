// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cafe_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CafeResponse _$CafeResponseFromJson(Map<String, dynamic> json) => CafeResponse(
      id: json['id'] as int,
      name: json['name'] as String,
      address: json['address'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      is_visible: json['is_visible'] as bool,
      is_closed: json['is_closed'] as bool,
      opening_hour: OpeningHourResponse.fromJson(
          json['opening_hour'] as Map<String, dynamic>),
      cafe_floor: (json['cafe_floor'] as List<dynamic>)
          .map((e) =>
              CafeFloorCafeRepResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      cafe_vip: (json['cafe_vip'] as List<dynamic>)
          .map((e) => CafeVIPResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      cafe_image: (json['cafe_image'] as List<dynamic>)
          .map((e) => CafeImageResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CafeResponseToJson(CafeResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'is_visible': instance.is_visible,
      'is_closed': instance.is_closed,
      'opening_hour': instance.opening_hour,
      'cafe_floor': instance.cafe_floor,
      'cafe_vip': instance.cafe_vip,
      'cafe_image': instance.cafe_image,
    };

CafeSearchResponse _$CafeSearchResponseFromJson(Map<String, dynamic> json) =>
    CafeSearchResponse(
      id: json['id'] as int,
      name: json['name'] as String,
      address: json['address'] as String,
    );

Map<String, dynamic> _$CafeSearchResponseToJson(CafeSearchResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
    };

CafeFloorCafeRepResponse _$CafeFloorCafeRepResponseFromJson(
        Map<String, dynamic> json) =>
    CafeFloorCafeRepResponse(
      id: json['id'] as int,
      floor: json['floor'] as int,
      wall_socket_rate: json['wall_socket_rate'] as String?,
      restroom: json['restroom'] as String?,
      has_seat: json['has_seat'] as bool,
      occupancy_rate_prediction: OccupancyRatePredictionResponse.fromJson(
          json['occupancy_rate_prediction'] as Map<String, dynamic>),
      recent_updated_log: (json['recent_updated_log'] as List<dynamic>)
          .map((e) => OccupancyRateUpdateRepResponse.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CafeFloorCafeRepResponseToJson(
        CafeFloorCafeRepResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'floor': instance.floor,
      'wall_socket_rate': instance.wall_socket_rate,
      'restroom': instance.restroom,
      'has_seat': instance.has_seat,
      'occupancy_rate_prediction': instance.occupancy_rate_prediction,
      'recent_updated_log': instance.recent_updated_log,
    };

OccupancyRateUpdateRepResponse _$OccupancyRateUpdateRepResponseFromJson(
        Map<String, dynamic> json) =>
    OccupancyRateUpdateRepResponse(
      id: json['id'] as int,
      point: json['point'] as int,
      occupancy_rate: json['occupancy_rate'] as String,
      update: json['update'] as String,
      user: json['user'] == null
          ? null
          : PartialUserResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OccupancyRateUpdateRepResponseToJson(
        OccupancyRateUpdateRepResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'point': instance.point,
      'occupancy_rate': instance.occupancy_rate,
      'update': instance.update,
      'user': instance.user,
    };

OccupancyRatePredictionResponse _$OccupancyRatePredictionResponseFromJson(
        Map<String, dynamic> json) =>
    OccupancyRatePredictionResponse(
      id: json['id'] as int,
      occupancy_rate: json['occupancy_rate'] as String,
      update: json['update'] as String,
    );

Map<String, dynamic> _$OccupancyRatePredictionResponseToJson(
        OccupancyRatePredictionResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'occupancy_rate': instance.occupancy_rate,
      'update': instance.update,
    };

CafeVIPResponse _$CafeVIPResponseFromJson(Map<String, dynamic> json) =>
    CafeVIPResponse(
      id: json['id'] as int,
      update_count: json['update_count'] as int,
      user: PartialUserResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CafeVIPResponseToJson(CafeVIPResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'update_count': instance.update_count,
      'user': instance.user,
    };

CafeImageResponse _$CafeImageResponseFromJson(Map<String, dynamic> json) =>
    CafeImageResponse(
      id: json['id'] as int,
      image: json['image'] as String,
      is_visible: json['is_visible'] as bool,
    );

Map<String, dynamic> _$CafeImageResponseToJson(CafeImageResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'is_visible': instance.is_visible,
    };

OpeningHourResponse _$OpeningHourResponseFromJson(Map<String, dynamic> json) =>
    OpeningHourResponse(
      id: json['id'] as int,
      mon: json['mon'] as String,
      tue: json['tue'] as String,
      wed: json['wed'] as String,
      thu: json['thu'] as String,
      fri: json['fri'] as String,
      sat: json['sat'] as String,
      son: json['son'] as String,
    );

Map<String, dynamic> _$OpeningHourResponseToJson(
        OpeningHourResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mon': instance.mon,
      'tue': instance.tue,
      'wed': instance.wed,
      'thu': instance.thu,
      'fri': instance.fri,
      'sat': instance.sat,
      'son': instance.son,
    };

CafePageResponse _$CafePageResponseFromJson(Map<String, dynamic> json) =>
    CafePageResponse(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => CafeResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CafePageResponseToJson(CafePageResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

OccupancyRateUpdateResponse _$OccupancyRateUpdateResponseFromJson(
        Map<String, dynamic> json) =>
    OccupancyRateUpdateResponse(
      id: json['id'] as int,
      cafe_floor: CafeFloorOccupancyRepResponse.fromJson(
          json['cafe_floor'] as Map<String, dynamic>),
      point: json['point'] as int,
      occupancy_rate: json['occupancy_rate'] as String,
      update: json['update'] as String,
      user: PartialUserResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OccupancyRateUpdateResponseToJson(
        OccupancyRateUpdateResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'point': instance.point,
      'cafe_floor': instance.cafe_floor,
      'occupancy_rate': instance.occupancy_rate,
      'update': instance.update,
      'user': instance.user,
    };

CafeFloorOccupancyRepResponse _$CafeFloorOccupancyRepResponseFromJson(
        Map<String, dynamic> json) =>
    CafeFloorOccupancyRepResponse(
      id: json['id'] as int,
      floor: json['floor'] as int,
      cafe: CafeRepResponse.fromJson(json['cafe'] as Map<String, dynamic>),
      wall_socket_rate: json['wall_socket_rate'] as String?,
      restroom: json['restroom'] as String?,
      has_seat: json['has_seat'] as bool,
    );

Map<String, dynamic> _$CafeFloorOccupancyRepResponseToJson(
        CafeFloorOccupancyRepResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'floor': instance.floor,
      'cafe': instance.cafe,
      'wall_socket_rate': instance.wall_socket_rate,
      'restroom': instance.restroom,
      'has_seat': instance.has_seat,
    };

CafeRepResponse _$CafeRepResponseFromJson(Map<String, dynamic> json) =>
    CafeRepResponse(
      id: json['id'] as int,
      name: json['name'] as String,
      address: json['address'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      is_visible: json['is_visible'] as bool,
      is_closed: json['is_closed'] as bool,
    );

Map<String, dynamic> _$CafeRepResponseToJson(CafeRepResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'is_visible': instance.is_visible,
      'is_closed': instance.is_closed,
    };
