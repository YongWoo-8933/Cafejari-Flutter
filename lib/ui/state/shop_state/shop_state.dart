import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_state.freezed.dart';

@freezed
class ShopState with _$ShopState {
  factory ShopState(
      {required final int mapIndex,
      required final int leaderIndex,
      required final int profileIndex}) = _ShopState;

  factory ShopState.empty() => ShopState(mapIndex: 0, leaderIndex: 1, profileIndex: 2);
}
