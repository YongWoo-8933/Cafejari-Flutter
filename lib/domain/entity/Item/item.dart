import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cafejari_flutter/core/util.dart';

part 'item.freezed.dart';

typedef Items = List<Item>;

/// item 모델
@freezed
class Item with _$Item {
  factory Item({
    required final int id,
    required final int price,
    required final String name,
    required final String category,
    required final String brand,
    required final String imageUrl
  }) = _Item;

  factory Item.empty() => Item(
      id: 0,
      price: 0,
      name: none,
      category: none,
      brand: none,
      imageUrl: none);
}
