import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/domain/entity/shop/shop.dart';
import 'package:cafejari_flutter/domain/use_case/shop_use_case.dart';
import 'package:cafejari_flutter/ui/components/custom_snack_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/ui/state/shop_state/shop_state.dart';
import 'package:cafejari_flutter/ui/view_model/global_view_model.dart';

class ShopViewModel extends StateNotifier<ShopState> {
  final ShopUseCase _shopUseCase;
  final GlobalViewModel globalViewModel;

  ShopViewModel({
    required ShopUseCase shopUseCase,
    required this.globalViewModel
  }) : _shopUseCase = shopUseCase, super(ShopState.empty());

  refreshData() async {
    state = state.copyWith(isLoading: true);
    try {
      final Brands newBrands = state.brandList.isEmpty ? await _shopUseCase.getBrands() : state.brandList;
      final Items newItems = await _shopUseCase.getItems();
      state = state.copyWith(
        brandList: newBrands,
        itemList: newItems,
        myBrandcons: await _shopUseCase.getMyBrandcons(accessToken: globalViewModel.state.accessToken)
      );
    } on ErrorWithMessage catch (e) {
      globalViewModel.showSnackBar(content: e.message, type: SnackBarType.error);
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  updateBrandconIsUsed({required Brandcon brandcon, required bool isUsed}) async {
    try {
      final Brandcon usedBrandcon = await _shopUseCase.updateBrandconIsUsed(
          accessToken: globalViewModel.state.accessToken,
          brandconId: brandcon.brandconId,
          isUsed: isUsed
      );
      Brandcons newMyBrandcons = List.from(state.myBrandcons);
      final int index = newMyBrandcons.indexWhere((element) => element.brandconId == brandcon.brandconId);
      if (index >= 0) newMyBrandcons[index] = usedBrandcon;
      state = state.copyWith(myBrandcons: newMyBrandcons);
    } on RefreshTokenExpired {
      globalViewModel.logout();
    } on ErrorWithMessage catch (e) {
      globalViewModel.showSnackBar(content: e.message, type: SnackBarType.error);
    }
  }

  deleteBrandcon(Brandcon brandcon) async {
    try {
      await _shopUseCase.deleteBrandcon(
        accessToken: globalViewModel.state.accessToken,
        brandconId: brandcon.brandconId
      );
      Brandcons newMyBrandcons = List.from(state.myBrandcons);
      newMyBrandcons.removeWhere((element) => element.brandconId == brandcon.brandconId);
      state = state.copyWith(myBrandcons: newMyBrandcons);
    } on RefreshTokenExpired {
      globalViewModel.logout();
    } on ErrorWithMessage catch (e) {
      globalViewModel.showSnackBar(content: e.message, type: SnackBarType.error);
    }
  }
}
