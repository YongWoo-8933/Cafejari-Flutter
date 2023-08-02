import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop.freezed.dart';

typedef Brands = List<Brand>;

/// brand 모델
@freezed
class Brand with _$Brand {
  factory Brand({
    required final int id,
    required final String name, imageUrl
  }) = _Brand;

  factory Brand.empty() => Brand(
      id: 0,
      name: "",
      imageUrl: "");
}

typedef Items = List<Item>;

/// item 모델
@freezed
class Item with _$Item {
  factory Item({
    required final int itemId, brandId, price, limitDay,
    required final String name, smallImageUrl, largeImageUrl
  }) = _Item;

  factory Item.empty() => Item(
      itemId: 0,
      brandId: 0,
      price: 0,
      limitDay: 0,
      name: "",
      smallImageUrl: "",
      largeImageUrl: "");
}
