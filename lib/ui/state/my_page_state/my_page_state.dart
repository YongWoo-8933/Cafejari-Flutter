
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_page_state.freezed.dart';

@freezed
class MyPageState with _$MyPageState {
  factory MyPageState(
      {required final int counter,
      required final User user}) = _MyPageState;

  factory MyPageState.empty() => MyPageState(counter: 0, user: User.empty());
}
