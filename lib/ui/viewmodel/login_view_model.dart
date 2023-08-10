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

  Future<bool?> kakaoLogin({required String accessToken}) async {
    try {
      final loginRes = await _userUseCase.kakaoLogin(accessToken: accessToken);
      if(loginRes.isUserExist) {
        // 기존 유저
        final loginFinishRes = await _userUseCase.kakaoLoginFinish(accessToken: loginRes.accessToken);
        globalViewModel.saveLoginResult(
          accessToken: loginFinishRes.accessToken,
          refreshToken: loginFinishRes.refreshToken,
          user: loginFinishRes.user);
        return true;
      } else {
        // 가입 유저
        state = state.copyWith(kakaoAccessToken: loginRes.accessToken);
        return false;
      }
    } on ErrorWithMessage {
      // 에러 메시지 출력
      return null;
    }
  }

  autoGenerateNickname() async {
    try {
      final nickname = await _userUseCase.autoGenerateNickname();
      state.nicknameController.text = nickname;
    } on ErrorWithMessage catch(e) {
      // 에러 메시지
    }
  }

  Future<String> validateNickname() async {
    if(state.nicknameController.text.length < 2) {
      return "닉네임은 2자 이상이어야 합니다";
    } else if(state.nicknameController.text.length > 10) {
      return "닉네임은 최대 10자입니다";
    } else {
      try {
        state.nicknameController.text = await _userUseCase.validateNickname(nickname: state.nicknameController.text);
        return "";
      } on ErrorWithMessage catch(e) {
        return e.message;
      }
    }
  }
}
