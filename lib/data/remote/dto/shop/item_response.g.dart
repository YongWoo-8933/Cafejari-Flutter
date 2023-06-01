// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemResponse _$ItemResponseFromJson(Map<String, dynamic> json) => ItemResponse(
      id: json['id'] as int,
      name: json['name'] as String,
      category: json['category'] as String,
      brand: json['brand'] as String,
      price: json['price'] as int,
      image: json['image'] as String,
    );

Map<String, dynamic> _$ItemResponseToJson(ItemResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'name': instance.name,
      'category': instance.category,
      'brand': instance.brand,
      'image': instance.image,
    };
