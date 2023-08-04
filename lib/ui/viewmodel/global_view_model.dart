
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/domain/use_case/token_use_case.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';

class GlobalViewModel extends StateNotifier<GlobalState> {
  final TokenUseCase _tokenUseCase;

  // final LoginUseCase tokenUseCase;

  GlobalViewModel(this._tokenUseCase) : super(GlobalState.empty());

  void logout() {
    // 로그아웃 로직
  }

  void expireRefreshToken() {
    // refresh token이 만료되었을 때 로직
  }

  void updateCurrentPageTo(int index) => state = state.copyWith(currentPage: PageType.values[index]);
}
