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
      is_opened: json['is_opened'] as bool,
      is_closed: json['is_closed'] as bool,
      opening_hour: json['opening_hour'] == null
          ? null
          : OpeningHourResponse.fromJson(
              json['opening_hour'] as Map<String, dynamic>),
      brand: json['brand'] == null
          ? null
          : BrandResponse.fromJson(json['brand'] as Map<String, dynamic>),
      cati: json['cati'] == null
          ? null
          : CATIResponse.fromJson(json['cati'] as Map<String, dynamic>),
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
      'is_opened': instance.is_opened,
      'is_closed': instance.is_closed,
      'opening_hour': instance.opening_hour,
      'brand': instance.brand,
      'cati': instance.cati,
      'cafe_floor': instance.cafe_floor,
      'cafe_vip': instance.cafe_vip,
      'cafe_image': instance.cafe_image,
    };

CafeSearchResponse _$CafeSearchResponseFromJson(Map<String, dynamic> json) =>
    CafeSearchResponse(
      id: json['id'] as int,
      name: json['name'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      address: json['address'] as String,
    );

Map<String, dynamic> _$CafeSearchResponseToJson(CafeSearchResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

CafeFloorCafeRepResponse _$CafeFloorCafeRepResponseFromJson(
        Map<String, dynamic> json) =>
    CafeFloorCafeRepResponse(
      id: json['id'] as int,
      floor: json['floor'] as int,
      point_prediction: json['point_prediction'] as int,
      wall_socket_rate: json['wall_socket_rate'] as String?,
      restroom: json['restroom'] as String?,
      has_seat: json['has_seat'] as bool,
      occupancy_rate_prediction: json['occupancy_rate_prediction'] == null
          ? null
          : OccupancyRatePredictionResponse.fromJson(
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
      'point_prediction': instance.point_prediction,
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

CATIResponse _$CATIResponseFromJson(Map<String, dynamic> json) => CATIResponse(
      openness: (json['openness'] as num).toDouble(),
      coffee: (json['coffee'] as num).toDouble(),
      workspace: (json['workspace'] as num).toDouble(),
      acidity: (json['acidity'] as num).toDouble(),
    );

Map<String, dynamic> _$CATIResponseToJson(CATIResponse instance) =>
    <String, dynamic>{
      'openness': instance.openness,
      'coffee': instance.coffee,
      'workspace': instance.workspace,
      'acidity': instance.acidity,
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
      sun: json['sun'] as String,
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
      'sun': instance.sun,
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
    );

Map<String, dynamic> _$OccupancyRateUpdateResponseToJson(
        OccupancyRateUpdateResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'point': instance.point,
      'cafe_floor': instance.cafe_floor,
      'occupancy_rate': instance.occupancy_rate,
      'update': instance.update,
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
      is_opened: json['is_opened'] as bool,
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
      'is_opened': instance.is_opened,
      'is_closed': instance.is_closed,
    };

NaverSearchCafeResponse _$NaverSearchCafeResponseFromJson(
        Map<String, dynamic> json) =>
    NaverSearchCafeResponse(
      items: (json['items'] as List<dynamic>)
          .map((e) =>
              NaverSearchCafeItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NaverSearchCafeResponseToJson(
        NaverSearchCafeResponse instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

NaverSearchCafeItemResponse _$NaverSearchCafeItemResponseFromJson(
        Map<String, dynamic> json) =>
    NaverSearchCafeItemResponse(
      title: json['title'] as String,
      address: json['address'] as String,
      roadAddress: json['roadAddress'] as String,
      mapx: json['mapx'] as String,
      mapy: json['mapy'] as String,
    );

Map<String, dynamic> _$NaverSearchCafeItemResponseToJson(
        NaverSearchCafeItemResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'address': instance.address,
      'roadAddress': instance.roadAddress,
      'mapx': instance.mapx,
      'mapy': instance.mapy,
    };

LocationResponse _$LocationResponseFromJson(Map<String, dynamic> json) =>
    LocationResponse(
      name: json['name'] as String,
      image: json['image'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$LocationResponseToJson(LocationResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
