
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';


part 'login_state.freezed.dart';

enum SocialType { kakao, apple }

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    required final List<({int profileImageId, String imageUrl})> profileImages,
    required final ({int profileImageId, String imageUrl}) selectedProfileImage,
    required final TextEditingController nicknameController,
    required final String nicknameErrorMessage,
    required final bool isMarketingAgreed,
    required final PanelController bottomSheetController,
    required final String kakaoAccessToken,
    required final String appleIdToken,
    required final String appleServerCode,
  }) = _LoginState;

  factory LoginState.empty() => LoginState(
    profileImages: [],
    selectedProfileImage: (profileImageId: 0, imageUrl: ""),
    nicknameController: TextEditingController(text: ""),
    nicknameErrorMessage: "",
    isMarketingAgreed: false,
    bottomSheetController: PanelController(),
    kakaoAccessToken: "",
    appleIdToken: "",
    appleServerCode: ""
  );
}