import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/ui/state/shop_state/shop_state.dart';
import 'package:cafejari_flutter/ui/viewmodel/global_view_model.dart';

class ShopViewModel extends StateNotifier<ShopState> {
  final GlobalViewModel globalViewModel;

  ShopViewModel({required this.globalViewModel})
      : super(ShopState.empty());

  setIndex(int n) => state = state.copyWith(mapIndex: n);
}
