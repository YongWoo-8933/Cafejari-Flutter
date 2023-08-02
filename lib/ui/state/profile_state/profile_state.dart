
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cafejari_flutter/domain/entity/cafe_info/cafe.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  factory ProfileState(
      {required final int counter,
      required final User userInfo}) = _ProfileState;

  factory ProfileState.empty() => ProfileState(counter: 0, userInfo: User.empty());
}
