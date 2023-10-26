
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_page_state.freezed.dart';

@freezed
class MyPageState with _$MyPageState {

  factory MyPageState({
    required final List<({int profileImageId, String imageUrl})> defaultProfileImages,
    required final TextEditingController userMigrationPhoneNumberController
  }) = _MyPageState;

  factory MyPageState.empty() => MyPageState(defaultProfileImages: [], userMigrationPhoneNumberController: TextEditingController());
}
