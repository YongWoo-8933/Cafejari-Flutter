import 'package:json_annotation/json_annotation.dart';

part 'item_response.g.dart';

/// item 관련 DTO
@JsonSerializable()
class Brand {
  final int id;
  final String? image, name;
  final bool has_item;

  Brand(
      {required this.id,
        required this.image,
        required this.name,
        required this.has_item});

  factory Brand.fromJson(Map<String, dynamic> json) =>
      _$BrandFromJson(json);
}

@JsonSerializable()
class GifticonResponse {
  final int id, item;
  final String? image;
  final String tr_id, expiration_period;
  final bool is_used;

  GifticonResponse(
      {required this.id,
        required this.item,
        required this.image,
        required this.tr_id,
        required this.expiration_period,
        required this.is_used});

  factory GifticonResponse.fromJson(Map<String, dynamic> json) =>
      _$GifticonResponseFromJson(json);
}

@JsonSerializable()
class ItemResponse {
  final int id, price, limit_day, brand;
  final String name, code, ;
  final String? small_image_url, large_image_url;

  ItemResponse(
      {required this.id,
        required this.price,
        required this.limit_day,
        required this.brand,
        required this.name,
        required this.code,
        required this.small_image_url,
        required this.large_image_url});

  factory ItemResponse.fromJson(Map<String, dynamic> json) =>
      _$ItemResponseFromJson(json);
}