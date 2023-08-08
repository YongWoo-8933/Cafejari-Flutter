
import 'package:freezed_annotation/freezed_annotation.dart';


part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState(
      {required final List<({int id, String imageUrl})> profileImages,
        required final String nickname,
        required final bool isKakaoLoginLoading,
        required final bool isAppleLoginLoading,
        required final String kakaoAccessToken}) = _LoginState;

  factory LoginState.empty() => LoginState(
      profileImages: [],
      nickname: "",
      isKakaoLoginLoading: false,
      isAppleLoginLoading: false,
      kakaoAccessToken: ""
  );
}
