import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/domain/entity/shop/shop.dart';
import 'package:cafejari_flutter/domain/use_case/shop_use_case.dart';
import 'package:cafejari_flutter/domain/use_case/user_use_case.dart';
import 'package:cafejari_flutter/ui/components/custom_snack_bar.dart';
import 'package:flutter/widgets.dart';
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

  refreshData({required BuildContext context}) async {
    state = state.copyWith(isLoading: true);
    print(globalViewModel.state.accessToken);
    try {
      final Brands newBrands = state.brandList.isEmpty ? await _shopUseCase.getBrands() : state.brandList;
      final Items newItems = await _shopUseCase.getItems();
      state = state.copyWith(
        brandList: newBrands,
        itemList: newItems,
        myBrandcons: globalViewModel.state.isLoggedIn ?
          await _shopUseCase.getMyBrandcons(
            accessToken: globalViewModel.state.accessToken,
            onAccessTokenRefresh: globalViewModel.setAccessToken
          ) : []
      );
    } on RefreshTokenExpired {
      if(context.mounted) await globalViewModel.expireRefreshToken(context: context);
    } on ErrorWithMessage catch (e) {
      globalViewModel.showSnackBar(content: e.message, type: SnackBarType.error);
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> buyBrandcon({
    required Item item,
    required BuildContext context
  }) async {
    try {
      final Brandcon newBrandcon = await _shopUseCase.buyBrandcon(
        accessToken: globalViewModel.state.accessToken,
        itemId: item.itemId,
        onAccessTokenRefresh: globalViewModel.setAccessToken
      );
      Brandcons newMyBrandcons = List.from(state.myBrandcons);
      newMyBrandcons.add(newBrandcon);
      state = state.copyWith(myBrandcons: newMyBrandcons);
      await globalViewModel.init(accessToken: globalViewModel.state.accessToken);
      globalViewModel.showSnackBar(content: "구매 완료", type: SnackBarType.complete);
    } on ErrorWithMessage catch (e) {
      globalViewModel.showSnackBar(content: e.message, type: SnackBarType.error);
    } on RefreshTokenExpired {
      if(context.mounted) await globalViewModel.expireRefreshToken(context: context);
    }
  }

  updateBrandconIsUsed({
    required Brandcon brandcon,
    required bool isUsed,
    required BuildContext context
  }) async {
    try {
      final Brandcon usedBrandcon = await _shopUseCase.updateBrandconIsUsed(
        accessToken: globalViewModel.state.accessToken,
        brandconId: brandcon.brandconId,
        isUsed: isUsed,
        onAccessTokenRefresh: globalViewModel.setAccessToken
      );
      Brandcons newMyBrandcons = List.from(state.myBrandcons);
      final int index = newMyBrandcons.indexWhere((element) => element.brandconId == brandcon.brandconId);
      if (index >= 0) newMyBrandcons[index] = usedBrandcon;
      state = state.copyWith(myBrandcons: newMyBrandcons);
    } on ErrorWithMessage catch (e) {
      globalViewModel.showSnackBar(content: e.message, type: SnackBarType.error);
    } on RefreshTokenExpired {
      if(context.mounted) await globalViewModel.expireRefreshToken(context: context);
    }
  }

  deleteBrandcon({required Brandcon brandcon, required BuildContext context}) async {
    try {
      await _shopUseCase.deleteBrandcon(
        accessToken: globalViewModel.state.accessToken,
        brandconId: brandcon.brandconId,
        onAccessTokenRefresh: globalViewModel.setAccessToken
      );
      Brandcons newMyBrandcons = List.from(state.myBrandcons);
      newMyBrandcons.removeWhere((element) => element.brandconId == brandcon.brandconId);
      state = state.copyWith(myBrandcons: newMyBrandcons);
    } on ErrorWithMessage catch (e) {
      globalViewModel.showSnackBar(content: e.message, type: SnackBarType.error);
    } on RefreshTokenExpired {
      if(context.mounted) await globalViewModel.expireRefreshToken(context: context);
    }
  }
}
