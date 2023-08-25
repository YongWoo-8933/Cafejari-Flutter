import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/domain/entity/push/push.dart';
import 'package:cafejari_flutter/domain/entity/push/util.dart';
import 'package:cafejari_flutter/domain/use_case/push_use_case.dart';
import 'package:cafejari_flutter/ui/state/leaderboard_state/leaderboard_state.dart';
import 'package:cafejari_flutter/ui/state/push_state/push_state.dart';
import 'package:cafejari_flutter/ui/viewmodel/global_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PushViewModel extends StateNotifier<PushState> {
  final PushUseCase _pushUseCase;
  final GlobalViewModel globalViewModel;

  PushViewModel({required PushUseCase pushUseCase, required this.globalViewModel})
      : _pushUseCase = pushUseCase,
        super(PushState.empty());

  refreshPushes() async {
    try {
      state = state.copyWith(
        pushes: await _pushUseCase.getMyPushes(accessToken: globalViewModel.state.accessToken),
      );
    } on RefreshTokenExpired {
      globalViewModel.logout();
    } on ErrorWithMessage {
      // 에러 메시지 출력
    }
  }

  setTypePush(PushType pushType) {
    final Pushes pushes = [];
    state = state.copyWith(typePushes: pushes);
    for(int i =0; i<state.pushes.length; i++){
      if(state.pushes[i].type.tag == pushType.tag){
        pushes.add(state.pushes[i]);
      }
    }
    state = state.copyWith(typePushes: pushes);
  }
}
