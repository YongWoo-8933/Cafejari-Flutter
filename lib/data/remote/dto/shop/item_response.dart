import 'package:json_annotation/json_annotation.dart';

part 'item_response.g.dart';

/// item 관련 DTO
@JsonSerializable()
class ItemResponse {
  final int id, price;
  final String name, category, brand, image;

  ItemResponse(
      {required this.id,
      required this.name,
      required this.category,
      required this.brand,
      required this.price,
      required this.image});

  factory ItemResponse.fromJson(Map<String, dynamic> json) => _$ItemResponseFromJson(json);
}