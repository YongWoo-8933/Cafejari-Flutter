import 'dart:math';

import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
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
      if (loginRes.isUserExist) {
        // 기존 유저
        final loginFinishRes =
            await _userUseCase.kakaoLoginFinish(accessToken: loginRes.accessToken);
        globalViewModel.saveLoginResult(
            accessToken: loginFinishRes.accessToken,
            refreshToken: loginFinishRes.refreshToken,
            user: loginFinishRes.user);
        return true;
      } else {
        // 가입 유저
        state = state.copyWith(kakaoAccessToken: loginRes.accessToken, appleAccessToken: "");
        return false;
      }
    } on ErrorWithMessage {
      // 에러 메시지 출력
      return null;
    }
  }

  Future<bool> registerAsKakaoUser() async {
    try {
      final ({String accessToken, String refreshToken, User user}) loginRes =
          await _userUseCase.kakaoLoginFinish(accessToken: state.kakaoAccessToken);
      globalViewModel.saveLoginResult(
        accessToken: loginRes.accessToken,
        refreshToken: loginRes.refreshToken,
        user: loginRes.user);
      print(globalViewModel.state.accessToken);
      print(globalViewModel.state.user);
      globalViewModel.saveLoginResult(
        accessToken: globalViewModel.state.accessToken,
        refreshToken: loginRes.refreshToken,
        user: await _userUseCase.makeNewProfile(
          accessToken: globalViewModel.state.accessToken,
          fcmToken: "",
          nickname: state.nicknameController.text,
          userId: globalViewModel.state.user.userId,
          profileImageId: state.selectedProfileImage.profileImageId
        )
      );
      return true;
    } on RefreshTokenExpired {
      // 로그아웃 로직
      return false;
    } on ErrorWithMessage {
      // 에러 메시지 출력
      return false;
    }
  }

  getDefaultProfileImages() async {
    try {
      state = state.copyWith(profileImages: await _userUseCase.getDefaultProfileImages());
      int randomIndex = Random().nextInt(state.profileImages.length);
      state = state.copyWith(selectedProfileImage: state.profileImages[randomIndex]);
    } on ErrorWithMessage catch (e) {
      // 에러 메시지
    }
  }

  selectProfileImages(int index) {
    state = state.copyWith(selectedProfileImage: state.profileImages[index]);
  }

  autoGenerateNickname() async {
    try {
      final nickname = await _userUseCase.autoGenerateNickname();
      state.nicknameController.text = nickname;
      if(nickname.isNotEmpty) setNicknameErrorMessage("");
    } on ErrorWithMessage catch (e) {
      // 에러 메시지
    }
  }

  validateNickname() async {
    if (state.nicknameController.text.length < 2) {
      setNicknameErrorMessage("닉네임은 2자 이상이어야 합니다");
    } else if (state.nicknameController.text.length > 10) {
      setNicknameErrorMessage("닉네임은 최대 10자입니다");
    } else {
      try {
        await _userUseCase.validateNickname(nickname: state.nicknameController.text);
        setNicknameErrorMessage("");
      } on ErrorWithMessage catch (e) {
        setNicknameErrorMessage(e.message);
      }
    }
  }

  setNicknameErrorMessage(String message) => state = state.copyWith(nicknameErrorMessage: message);
}
