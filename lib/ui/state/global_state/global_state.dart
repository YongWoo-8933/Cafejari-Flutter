
import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';

part 'global_state.freezed.dart';

@freezed
class GlobalState with _$GlobalState {
  factory GlobalState(
      {required final String accessToken,
      required final bool isLoggedIn,
      required final User user,
      required final PageType currentPage,
      required final Size deviceSize}) = _GlobalState;

  factory GlobalState.empty() => GlobalState(
      accessToken: "",
      isLoggedIn: false,
      user: User.empty(),
      currentPage: PageType.map,
      deviceSize: Size.zero);
}
