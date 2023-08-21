
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:cafejari_flutter/domain/use_case/user_use_case.dart';
import 'package:cafejari_flutter/ui/state/my_page_state/my_page_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/ui/viewmodel/global_view_model.dart';

class MyPageViewModel extends StateNotifier<MyPageState> {
  final UserUseCase _userUseCase;
  final GlobalViewModel globalViewModel;

  MyPageViewModel({required UserUseCase userUseCase, required this.globalViewModel})
      :_userUseCase = userUseCase,
        super(MyPageState.empty());

  refreshUser() async {
    try {
      final User user = await _userUseCase.getUser(accessToken: globalViewModel.state.accessToken);
      state = state.copyWith(user: user);
    } on RefreshTokenExpired {
      globalViewModel.logout();
    } on ErrorWithMessage {
      // 에러 메시지 출력
    }
  }

  get add => state = state.copyWith(counter: state.counter + 1);
}