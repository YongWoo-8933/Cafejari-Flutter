
import 'package:cafejari_flutter/domain/entity/push/push.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'push_state.freezed.dart';

@freezed
class PushState with _$PushState {
  factory PushState({
    required final Pushes pushes,
    required final List<Pushes> typePushes
  }) = _PushState;

  factory PushState.empty() => PushState(
    pushes: [],
    typePushes: [[], [], [], [], []]
  );
}
