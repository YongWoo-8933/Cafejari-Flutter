// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandResponse _$BrandResponseFromJson(Map<String, dynamic> json) =>
    BrandResponse(
      id: json['id'] as int,
      image: json['image'] as String?,
      name: json['name'] as String,
      has_item: json['has_item'] as bool,
    );

Map<String, dynamic> _$BrandResponseToJson(BrandResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'has_item': instance.has_item,
    };

BrandconResponse _$BrandconResponseFromJson(Map<String, dynamic> json) =>
    BrandconResponse(
      id: json['id'] as int,
      item: json['item'] as int,
      image: json['image'] as String,
      expiration_period: json['expiration_period'] as String,
      description: json['description'] as String,
      is_used: json['is_used'] as bool,
    );

Map<String, dynamic> _$BrandconResponseToJson(BrandconResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'item': instance.item,
      'image': instance.image,
      'expiration_period': instance.expiration_period,
      'description': instance.description,
      'is_used': instance.is_used,
    };

ItemResponse _$ItemResponseFromJson(Map<String, dynamic> json) => ItemResponse(
      id: json['id'] as int,
      price: json['price'] as int,
      limit_day: json['limit_day'] as int,
      brand: json['brand'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      small_image_url: json['small_image_url'] as String,
      large_image_url: json['large_image_url'] as String,
    );

Map<String, dynamic> _$ItemResponseToJson(ItemResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'limit_day': instance.limit_day,
      'brand': instance.brand,
      'name': instance.name,
      'description': instance.description,
      'small_image_url': instance.small_image_url,
      'large_image_url': instance.large_image_url,
    };

CouponResponse _$CouponResponseFromJson(Map<String, dynamic> json) =>
    CouponResponse(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$CouponResponseToJson(CouponResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
    };

UserCouponResponse _$UserCouponResponseFromJson(Map<String, dynamic> json) =>
    UserCouponResponse(
      id: json['id'] as int,
      is_used: json['is_used'] as bool,
      expiration_period: json['expiration_period'] as String,
      coupon: CouponResponse.fromJson(json['coupon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserCouponResponseToJson(UserCouponResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_used': instance.is_used,
      'expiration_period': instance.expiration_period,
      'coupon': instance.coupon,
    };
