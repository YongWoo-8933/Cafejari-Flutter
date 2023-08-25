
import 'dart:async';
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:cafejari_flutter/domain/use_case/user_use_case.dart';
import 'package:cafejari_flutter/ui/app_config/duration.dart';
import 'package:cafejari_flutter/ui/components/custom_snack_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/domain/use_case/token_use_case.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';


class GlobalViewModel extends StateNotifier<GlobalState> {
  final TokenUseCase _tokenUseCase;
  final UserUseCase _userUseCase;
  Timer? _showSnackBarTimer1;
  Timer? _showSnackBarTimer2;


  GlobalViewModel(
    this._tokenUseCase,
    this._userUseCase,
    this._showSnackBarTimer1,
    this._showSnackBarTimer2
  ) : super(GlobalState.empty());

  init() async {
    try {
      final String accessToken = await _tokenUseCase.getAccessToken();
      final User user = await _userUseCase.getUser(accessToken: accessToken);
      saveLoginResult(accessToken: accessToken, refreshToken: null, user: user);
      showSnackBar(content: "로그인 성공", type: SnackBarType.complete);
    } on RefreshTokenExpired {
      null;
    } on ErrorWithMessage catch (e) {
      showSnackBar(content: e.message, type: SnackBarType.error);
    }
  }

  void logout() {
    // 로그아웃 로직
  }

  void showSnackBar({required String content, required SnackBarType type}) async {
    state = state.copyWith(
      snackBarText: content, snackBarType: type, isSnackBarOpened: true
    );
    _showSnackBarTimer1?.cancel();
    _showSnackBarTimer2?.cancel();
    _showSnackBarTimer1 = Timer(AppDuration.animationDefault, () {
      state = state.copyWith(isSnackBarExpanded: true);
      _showSnackBarTimer2 = Timer(const Duration(milliseconds: 2500), () {
        state = state.copyWith(isSnackBarOpened: false, isSnackBarExpanded: false);
      });
    });
  }

  void expireRefreshToken() {
    // refresh token이 만료되었을 때 로직
  }

  void updateCurrentPageTo(int index) => state = state.copyWith(currentPage: PageType.values[index]);

  void saveLoginResult({
    required String accessToken,
    required String? refreshToken,
    required User user
  }) {
    state = state.copyWith(accessToken: accessToken, user: user);
    if (refreshToken.isNotNull) {
      _tokenUseCase.saveRefreshToken(newRefreshToken: refreshToken!);
    }
  }
}