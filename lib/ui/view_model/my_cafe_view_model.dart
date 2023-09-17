import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/core/extension/int.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:cafejari_flutter/domain/use_case/user_use_case.dart';
import 'package:cafejari_flutter/ui/components/custom_snack_bar.dart';
import 'package:cafejari_flutter/ui/state/my_cafe_state/my_cafe_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/ui/view_model/global_view_model.dart';

class MyCafeViewModel extends StateNotifier<MyCafeState> {
  final GlobalViewModel globalViewModel;
  final UserUseCase _userUseCase;

  MyCafeViewModel({
    required UserUseCase userUseCase,
    required this.globalViewModel
  }): _userUseCase = userUseCase, super(MyCafeState.empty());

  initSliderValue() {
    state = state.copyWith(
      catiOpennessSliderValue: globalViewModel.state.user.myCATI.openness.toCATISliderInt(),
      catiCoffeeSliderValue: globalViewModel.state.user.myCATI.coffee.toCATISliderInt(),
      catiWorkspaceSliderValue: globalViewModel.state.user.myCATI.workspace.toCATISliderInt(),
      catiAciditySliderValue: globalViewModel.state.user.myCATI.acidity.toCATISliderInt()
    );
  }

  setCATIOpenness(int value) => state = state.copyWith(catiOpennessSliderValue: value);

  setCATICoffee(int value) => state = state.copyWith(catiCoffeeSliderValue: value);

  setCATIWorkspace(int value) => state = state.copyWith(catiWorkspaceSliderValue: value);

  setCATIAcidity(int value) => state = state.copyWith(catiAciditySliderValue: value);

  updateMyCATI({required BuildContext context}) async {
    try {
      final User updatedUser = await _userUseCase.updateProfile(
        accessToken: globalViewModel.state.accessToken,
        profileId: globalViewModel.state.user.profileId,
        openness: state.catiOpennessSliderValue.toCATIInt(),
        coffee: state.catiCoffeeSliderValue.toCATIInt(),
        workspace: state.catiWorkspaceSliderValue.toCATIInt(),
        acidity: state.catiAciditySliderValue.toCATIInt(),
        onAccessTokenRefresh: globalViewModel.setAccessToken
      );
      await globalViewModel.init(
        accessToken: globalViewModel.state.accessToken,
        user: updatedUser
      );
      globalViewModel.showSnackBar(content: "CATI설정됨", type: SnackBarType.complete);
    } on ErrorWithMessage catch (e) {
      globalViewModel.showSnackBar(content: e.message, type: SnackBarType.error);
    } on RefreshTokenExpired {
      if(context.mounted) await globalViewModel.expireRefreshToken(context: context);
    }
  }
}
