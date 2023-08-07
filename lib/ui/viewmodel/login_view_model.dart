import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/domain/use_case/user_use_case.dart';
import 'package:cafejari_flutter/ui/state/login_state/login_state.dart';
import 'package:cafejari_flutter/ui/viewmodel/global_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginViewModel extends StateNotifier<LoginState> {
  final UserUseCase _userUseCase;
  final GlobalViewModel globalViewModel;

  LoginViewModel({required UserUseCase userUseCase, required this.globalViewModel})
      : _userUseCase = userUseCase,
        super(LoginState.empty());

  kakaoLogin({required String accessToken}) async {
    try {
      final loginRes = await _userUseCase.kakaoLogin(accessToken: accessToken);
      if(loginRes.isUserExist) {
        // 기존 유저
        final loginFinishRes = await _userUseCase.kakaoLoginFinish(accessToken: loginRes.accessToken);
        globalViewModel.saveLoginResult(
            accessToken: loginFinishRes.accessToken,
            refreshToken: loginFinishRes.refreshToken,
            user: loginFinishRes.user);
        // 화면 이동 로직
      } else {
        // 가입 유저
        state = state.copyWith(kakaoAccessToken: loginRes.accessToken);
        // 화면 이동 로직
      }
    } on ErrorWithMessage {
      // 에러 메시지 출력
    }
  }
}
