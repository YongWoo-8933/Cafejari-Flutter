
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:cafejari_flutter/domain/use_case/user_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/ui/state/profile_state/profile_state.dart';
import 'package:cafejari_flutter/ui/viewmodel/global_view_model.dart';

class ProfileViewModel extends StateNotifier<ProfileState> {
  final UserUseCase _userUseCase;
  final GlobalViewModel globalViewModel;

  ProfileViewModel({required UserUseCase userUseCase, required this.globalViewModel})
      :_userUseCase = userUseCase,
        super(ProfileState.empty());

  refreshUserInfos() async {
    try {
      final User userInfo = await _userUseCase.getUserInfos(accessToken: globalViewModel.state.accessToken);

      state = state.copyWith(userInfo: userInfo);
    } on RefreshTokenExpired {
      globalViewModel.logout();
    } on ErrorWithMessage {
      // 에러 메시지 출력
    }
  }

  get add => state = state.copyWith(counter: state.counter + 1);
}
