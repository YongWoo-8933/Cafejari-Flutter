import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/screen/login/component/login_button.dart';
import 'package:cafejari_flutter/ui/state/login_state/login_state.dart';
import 'package:cafejari_flutter/ui/viewmodel/login_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final LoginState loginState = ref.watch(loginViewModelProvider);
    final LoginViewModel loginViewModel = ref.watch(loginViewModelProvider.notifier);

    return Container(
      color: AppColor.grey_300,
      child: Column(
        children: [
          const SizedBox(height: 30),
          LoginButton(
            buttonWidth: 230,
            buttonHeight: 48,
            buttonColor: AppColor.kakaoYellow,
            title: const Text("카카오 계정으로 시작", style: TextSize.textSize_16),
            icon: Image.asset('asset/image/kakao_icon.png'),
            onPressed: () async {
              OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
              await loginViewModel.kakaoLogin(accessToken: token.accessToken);
            },
          ),
          const SizedBox(height: 30),
          LoginButton(
            buttonWidth: 230,
            buttonHeight: 40,
            buttonColor: AppColor.primary,
            title: const Text("Apple 계정으로 시작", style: TextSize.textSize_white_16),
            icon: Image.asset('asset/image/apple_icon.png'),
            onPressed: () => {},
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

