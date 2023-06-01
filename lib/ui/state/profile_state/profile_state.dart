
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cafejari_flutter/domain/entity/cafe_info/cafe_info.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  factory ProfileState(
      {required final int counter}) = _ProfileState;

  factory ProfileState.empty() => ProfileState(counter: 0);
}
