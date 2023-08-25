import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/domain/entity/shop/shop.dart';
import 'package:cafejari_flutter/domain/use_case/shop_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/ui/state/shop_state/shop_state.dart';
import 'package:cafejari_flutter/ui/view_model/global_view_model.dart';

class ShopViewModel extends StateNotifier<ShopState> {
  final ShopUseCase _shopUseCase;
  final GlobalViewModel globalViewModel;

  ShopViewModel({
    required ShopUseCase shopUseCase,
    required this.globalViewModel
  }) :  _shopUseCase = shopUseCase, super(ShopState.empty());

  refreshBrand() async {
    try {
      final Brands brands = await _shopUseCase.getBrands();
      state = state.copyWith(brandList: brands);
    } on ErrorWithMessage {
      // 에러 메시지 출력
    }
  }

  refreshItem() async {
    try {
      final Items items = await _shopUseCase.getItems();
      state = state.copyWith(itemList: items);
    } on ErrorWithMessage {
      // 에러 메시지 출력
    }
  }

}
