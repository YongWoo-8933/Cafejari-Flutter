import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:cafejari_flutter/domain/use_case/user_use_case.dart';
import 'package:cafejari_flutter/ui/components/custom_snack_bar.dart';
import 'package:cafejari_flutter/ui/screen/my_page/component/withdrawal_dialog.dart';
import 'package:cafejari_flutter/ui/state/my_page_state/my_page_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/ui/view_model/global_view_model.dart';

class MyPageViewModel extends StateNotifier<MyPageState> {
  final UserUseCase _userUseCase;
  final GlobalViewModel globalViewModel;

  MyPageViewModel({required UserUseCase userUseCase, required this.globalViewModel})
      :_userUseCase = userUseCase, super(MyPageState.empty());

  getDefaultProfileImages() async {
    try {
      state = state.copyWith(defaultProfileImages: await _userUseCase.getDefaultProfileImages());
    } on ErrorWithMessage catch(e) {
      globalViewModel.showSnackBar(content: e.message, type: SnackBarType.error);
    }
  }

  updateProfileImage({required int profileImageId, required BuildContext context}) async {
    try {
      final User updatedUser = await _userUseCase.updateProfile(
        accessToken: globalViewModel.state.accessToken,
        profileId: globalViewModel.state.user.profileId,
        profileImageId: profileImageId,
        onAccessTokenRefresh: globalViewModel.setAccessToken
      );
      await globalViewModel.init(accessToken: globalViewModel.state.accessToken, user: updatedUser);
    } on ErrorWithMessage catch (e) {
      globalViewModel.showSnackBar(content: e.message, type: SnackBarType.error);
    } on RefreshTokenExpired {
      if(context.mounted) await globalViewModel.expireRefreshToken(context: context);
    }
  }

  withdraw({required WithdrawalReason reason, required BuildContext context}) async {
    try {
      await _userUseCase.withdraw(
        accessToken: globalViewModel.state.accessToken,
        reason: switch(reason) {
          WithdrawalReason.none => "기타",
          WithdrawalReason.noCafe => "카페",
          WithdrawalReason.occupancyRate => "혼잡도",
          WithdrawalReason.appUse => "앱사용",
          WithdrawalReason.design => "디자인",
          WithdrawalReason.etc => "기타",
        },
        onAccessTokenRefresh: globalViewModel.setAccessToken
      );
      await globalViewModel.clearUserInfo();
      globalViewModel.showSnackBar(content: "탈퇴 처리됨", type: SnackBarType.complete);
    } on ErrorWithMessage catch (e) {
      globalViewModel.showSnackBar(content: e.message, type: SnackBarType.error);
    } on RefreshTokenExpired {
      if(context.mounted) await globalViewModel.expireRefreshToken(context: context);
    }
  }

  userMigrate({required BuildContext context}) async {
    try {
      await _userUseCase.userMigrate(
        accessToken: globalViewModel.state.accessToken,
        phoneNumber: state.userMigrationPhoneNumberController.text,
        onAccessTokenRefresh: globalViewModel.setAccessToken
      );
      globalViewModel.showSnackBar(content: "요청 완료", type: SnackBarType.complete);
    } on ErrorWithMessage catch (e) {
      globalViewModel.showSnackBar(content: e.message, type: SnackBarType.error);
    } on RefreshTokenExpired {
      if(context.mounted) await globalViewModel.expireRefreshToken(context: context);
    }
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

  updateNickname({required BuildContext context}) async {
    try {
      await _userUseCase.validateNickname(nickname: state.nicknameController.text);
      final User updatedUser = await _userUseCase.updateProfile(
        accessToken: globalViewModel.state.accessToken,
        profileId: globalViewModel.state.user.profileId,
        nickname: state.nicknameController.text,
        onAccessTokenRefresh: globalViewModel.setAccessToken
      );
      await globalViewModel.init(accessToken: globalViewModel.state.accessToken, user: updatedUser);
      globalViewModel.showSnackBar(content: "닉네임\n변경완료", type: SnackBarType.complete);
    } on ErrorWithMessage catch (e) {
      globalViewModel.showSnackBar(content: e.message, type: SnackBarType.error);
    } on RefreshTokenExpired {
      if(context.mounted) await globalViewModel.expireRefreshToken(context: context);
    }
  }

  updateOccupancyPushEnabled({required BuildContext context, required bool enabled}) async {
    try {
      final User updatedUser = await _userUseCase.updateProfile(
        accessToken: globalViewModel.state.accessToken,
        profileId: globalViewModel.state.user.profileId,
        occupancyPushEnabled: enabled,
        onAccessTokenRefresh: globalViewModel.setAccessToken
      );
      await globalViewModel.init(accessToken: globalViewModel.state.accessToken, user: updatedUser);
    } on ErrorWithMessage catch (e) {
      globalViewModel.showSnackBar(content: e.message, type: SnackBarType.error);
    } on RefreshTokenExpired {
      if(context.mounted) await globalViewModel.expireRefreshToken(context: context);
    }
  }
}
