import 'dart:math';

import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:cafejari_flutter/domain/use_case/user_use_case.dart';
import 'package:cafejari_flutter/ui/components/custom_snack_bar.dart';
import 'package:cafejari_flutter/ui/state/login_state/login_state.dart';
import 'package:cafejari_flutter/ui/view_model/global_view_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginViewModel extends StateNotifier<LoginState> {
  final UserUseCase _userUseCase;
  final GlobalViewModel globalViewModel;

  clearViewModel() => state = LoginState.empty();

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
        globalViewModel.init(
          accessToken: loginFinishRes.accessToken,
          refreshToken: loginFinishRes.refreshToken,
          user: loginFinishRes.user
        );
        return true;
      } else {
        // 가입 유저
        state = state.copyWith(kakaoAccessToken: loginRes.accessToken, appleAccessToken: "");
        return false;
      }
    } on ErrorWithMessage catch (e) {
      globalViewModel.showSnackBar(content: e.message, type: SnackBarType.error);
      return null;
    }
  }

  Future<bool> registerAsKakaoUser() async {
    try {
      final ({String accessToken, String refreshToken, User user}) loginRes =
          await _userUseCase.kakaoLoginFinish(accessToken: state.kakaoAccessToken);
      String? fcmToken = await FirebaseMessaging.instance.getToken();
      final User makeNewProfileRes = await _userUseCase.makeNewProfile(
        accessToken: loginRes.accessToken,
        fcmToken: fcmToken ?? "",
        nickname: state.nicknameController.text,
        userId: globalViewModel.state.user.userId,
        profileImageId: state.selectedProfileImage.profileImageId,
        marketingPushEnabled: state.isMarketingAgreed
      );
      globalViewModel.init(
        accessToken: loginRes.accessToken,
        refreshToken: loginRes.refreshToken,
        user: makeNewProfileRes
      );
      return true;
    } on ErrorWithMessage catch (e) {
      globalViewModel.showSnackBar(content: e.message, type: SnackBarType.error);
      return false;
    }
  }

  getDefaultProfileImages() async {
    try {
      state = state.copyWith(profileImages: await _userUseCase.getDefaultProfileImages());
      int randomIndex = Random().nextInt(state.profileImages.length);
      state = state.copyWith(selectedProfileImage: state.profileImages[randomIndex]);
    } on ErrorWithMessage catch (e) {
      globalViewModel.showSnackBar(content: e.message, type: SnackBarType.error);
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
      globalViewModel.showSnackBar(content: e.message, type: SnackBarType.error);
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

  setMarketingAgreement(bool isAgreed) => state = state.copyWith(isMarketingAgreed: isAgreed);
}