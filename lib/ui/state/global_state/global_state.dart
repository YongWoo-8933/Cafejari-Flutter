import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:cafejari_flutter/ui/screen/map/map_screen.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';

part 'global_state.freezed.dart';

@freezed
class GlobalState with _$GlobalState {
  factory GlobalState(
      {required final String accessToken,
      required final bool isLoggedIn,
      required final User user,
      required final PageType currentPage}) = _GlobalState;

  factory GlobalState.empty() => GlobalState(
      accessToken:
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxOTc1Mzg1OTE5LCJpYXQiOjE2NjAwMjU5MTksImp0aSI6ImJmMTkzM2RlOGYyMDQxMjk4MTVjYmU0MjNmYzQ4NDRlIiwidXNlcl9pZCI6MX0.XOCTVYwcsSZQrzm8HQa6d8V2HNdEfSixTvg2OXmnCHw",
      isLoggedIn: false,
      user: User.empty(),
      currentPage: PageType.map);
}
