import 'package:cafejari_flutter/domain/entity/shop/shop.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'shop_state.freezed.dart';

@freezed
class ShopState with _$ShopState {
  factory ShopState({
    required final bool isLoading,
    required final Brands brandList,
    required final Items itemList,
    required final Brandcons myBrandcons,
    // required final TabController brandTabController,
    }) = _ShopState;

  factory ShopState.empty() => ShopState(
    isLoading: false,
    brandList: [],
    itemList: [],
    myBrandcons: [],
    // brandTabController: TabController(length: 0, vsync: ScrollableState())
  );
}
