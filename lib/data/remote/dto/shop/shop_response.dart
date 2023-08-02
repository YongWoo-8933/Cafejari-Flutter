import 'package:json_annotation/json_annotation.dart';

part 'shop_response.g.dart';

/// item 관련 DTO
@JsonSerializable()
class BrandResponse {
  final int id;
  final String name;
  final String? image;
  final bool has_item;

  BrandResponse(
      {required this.id,
        required this.image,
        required this.name,
        required this.has_item});

  factory BrandResponse.fromJson(Map<String, dynamic> json) =>
      _$BrandResponseFromJson(json);
}

@JsonSerializable()
class BrandconResponse {
  final int id, item;
  final String image, expiration_period;
  final bool is_used;

  BrandconResponse(
      {required this.id,
        required this.item,
        required this.image,
        required this.expiration_period,
        required this.is_used});

  factory BrandconResponse.fromJson(Map<String, dynamic> json) =>
      _$BrandconResponseFromJson(json);
}

@JsonSerializable()
class ItemResponse {
  final int id, price, limit_day, brand;
  final String name, small_image_url, large_image_url;

  ItemResponse(
      {required this.id,
        required this.price,
        required this.limit_day,
        required this.brand,
        required this.name,
        required this.small_image_url,
        required this.large_image_url});

  factory ItemResponse.fromJson(Map<String, dynamic> json) =>
      _$ItemResponseFromJson(json);
}

@JsonSerializable()
class CouponResponse {
  final int id;
  final String name, description, imageUrl;

  CouponResponse(
      {required this.id,
        required this.name,
        required this.description,
        required this.imageUrl});

  factory CouponResponse.fromJson(Map<String, dynamic> json) =>
      _$CouponResponseFromJson(json);
}

@JsonSerializable()
class UserCouponResponse {
  final int id;
  final String name, description, imageUrl;

  CouponResponse(
      {required this.id,
        required this.name,
        required this.description,
        required this.imageUrl});

  factory CouponResponse.fromJson(Map<String, dynamic> json) =>
      _$CouponResponseFromJson(json);
}