import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:cafejari_flutter/domain/use_case/user_use_case.dart';
import 'package:cafejari_flutter/ui/components/custom_snack_bar.dart';
import 'package:cafejari_flutter/ui/state/my_page_state/my_page_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/ui/view_model/global_view_model.dart';

class MyPageViewModel extends StateNotifier<MyPageState> {
  final UserUseCase _userUseCase;
  final GlobalViewModel globalViewModel;

  MyPageViewModel({required UserUseCase userUseCase, required this.globalViewModel})
      :_userUseCase = userUseCase,
        super(MyPageState.empty());

  getDefaultProfileImages() async {
    try {
      state = state.copyWith(defaultProfileImages: await _userUseCase.getDefaultProfileImages());
    } on ErrorWithMessage catch(e) {
      globalViewModel.showSnackBar(content: e.message, type: SnackBarType.error);
    }
  }

  updateProfileImage({required int profileImageId}) async {
    try {
      final User updatedUser = await _userUseCase.updateProfile(
        accessToken: globalViewModel.state.accessToken,
        profileId: globalViewModel.state.user.profileId,
        profileImageId: profileImageId
      );
      globalViewModel.saveLoginResult(accessToken: globalViewModel.state.accessToken, user: updatedUser);
    } on RefreshTokenExpired {
      globalViewModel.logout();
    } on ErrorWithMessage catch(e) {
      globalViewModel.showSnackBar(content: e.message, type: SnackBarType.error);
    }
  }
}
