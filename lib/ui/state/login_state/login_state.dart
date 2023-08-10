
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';


part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState(
      {required final List<({int id, String imageUrl})> profileImages,
        required final TextEditingController nicknameController,
        required final PanelController bottomSheetController,
        required final String kakaoAccessToken}) = _LoginState;

  factory LoginState.empty() => LoginState(
      profileImages: [],
      nicknameController: TextEditingController(text: ""),
      bottomSheetController: PanelController(),
      kakaoAccessToken: ""
  );
}
