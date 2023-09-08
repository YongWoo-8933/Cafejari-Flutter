import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/domain/entity/push/push.dart';
import 'package:cafejari_flutter/domain/use_case/push_use_case.dart';
import 'package:cafejari_flutter/ui/components/custom_snack_bar.dart';
import 'package:cafejari_flutter/ui/state/push_state/push_state.dart';
import 'package:cafejari_flutter/ui/view_model/global_view_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PushViewModel extends StateNotifier<PushState> {
  final PushUseCase _pushUseCase;
  final GlobalViewModel globalViewModel;

  PushViewModel({required PushUseCase pushUseCase, required this.globalViewModel})
      : _pushUseCase = pushUseCase,
        super(PushState.empty());

  refreshPushes({required BuildContext context}) async {
    try {
      final Pushes pushes = await _pushUseCase.getMyPushes(accessToken: globalViewModel.state.accessToken);
      List<Pushes> typePushes = [[], [], [], [], []];
      for(Push push in pushes) {
        typePushes[push.type.index].add(push);
      }
      state = state.copyWith(pushes: pushes, typePushes: typePushes);
    } on ErrorWithMessage catch (e) {
      globalViewModel.showSnackBar(content: e.message, type: SnackBarType.error);
    } on RefreshTokenExpired {
      if(context.mounted) globalViewModel.expireRefreshToken(context: context);
    }
  }
}
