
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_page_state.freezed.dart';

@freezed
class MyPageState with _$MyPageState {

  factory MyPageState({
    required final List<({int profileImageId, String imageUrl})> defaultProfileImages
  }) = _MyPageState;

  factory MyPageState.empty() => MyPageState(defaultProfileImages: []);
}
