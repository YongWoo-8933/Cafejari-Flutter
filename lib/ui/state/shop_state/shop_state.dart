import 'package:cafejari_flutter/domain/entity/shop/shop.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_state.freezed.dart';

@freezed
class ShopState with _$ShopState {
  factory ShopState(
      {required final Brands brandList,
      required final Items itemList,}) = _ShopState;

  factory ShopState.empty() => ShopState(
      brandList: [],
      itemList: []);
}
