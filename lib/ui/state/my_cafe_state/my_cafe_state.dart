
import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_cafe_state.freezed.dart';

@freezed
class MyCafeState with _$MyCafeState {
  factory MyCafeState(
      {required final User user,
      required final List<Cafe> favoriteCafe}) = _MyCafeState;

  factory MyCafeState.empty() => MyCafeState(
      user: User.empty(),
      favoriteCafe: []
  );
}
