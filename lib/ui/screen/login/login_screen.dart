import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/screen/login/component/login_button.dart';
import 'package:cafejari_flutter/ui/state/login_state/login_state.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';
import 'package:cafejari_flutter/ui/viewmodel/login_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

final _kakaoLoginLoadingProvider = StateProvider<bool>((ref) => false);
final _appleLoginLoadingProvider = StateProvider<bool>((ref) => false);

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final LoginState loginState = ref.watch(loginViewModelProvider);
    final LoginViewModel loginViewModel = ref.watch(loginViewModelProvider.notifier);
    final Size deviceSize = MediaQuery.of(context).size;

    return DefaultTextStyle(
      style: const TextStyle(
        color: AppColor.black,
        fontSize: 20,
        fontWeight: FontWeight.w400
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset("asset/image/login_background.png", fit: BoxFit.cover,),
          ),
          Column(
            children: [
              const VerticalSpacer(30),
              Align(
                alignment: Alignment.topRight,
                child: CupertinoButton(
                  child: const Icon(
                    CupertinoIcons.xmark,
                    color: AppColor.primary,
                    size: 24,
                  ),
                  onPressed: () => GoRouter.of(context).pop(),
                ),
              ),
              const VerticalSpacer(80),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "간편하게",
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                  HorizontalSpacer(4),
                  Text("로그인하세요!"),
                ],
              ),
              const VerticalSpacer(12),
              Container(
                width: 60,
                height: 3,
                color: AppColor.black,
              ),
              const VerticalSpacer(28),
              LoginButton(
                buttonWidth: deviceSize.width * 56 / 100,
                buttonHeight: 48,
                textColor: AppColor.black,
                backgroundColor: AppColor.kakaoYellow,
                text: "카카오 계정으로 시작",
                imagePath: 'asset/image/kakao_icon.png',
                isLoading: ref.watch(_kakaoLoginLoadingProvider),
                onPressed: () async {
                  if(!ref.watch(_kakaoLoginLoadingProvider)) {
                    ref.watch(_kakaoLoginLoadingProvider.notifier).update((state) => true);
                    await UserApi.instance.logout();
                    OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
                    final bool? isUserExist = await loginViewModel.kakaoLogin(accessToken: token.accessToken);
                    ref.watch(_kakaoLoginLoadingProvider.notifier).update((state) => false);
                    switch(isUserExist) {
                      case true:
                        if (context.mounted) GoRouter.of(context).pop();
                      case false:
                        if (context.mounted) GoRouter.of(context).goNamed(ScreenRoute.registration);
                      default:
                        print("로그인 실패");
                    }
                  }
                },
              ),
              const VerticalSpacer(24),
              LoginButton(
                buttonWidth: deviceSize.width * 56 / 100,
                buttonHeight: 48,
                textColor: AppColor.white,
                backgroundColor: AppColor.black,
                text: "Apple 계정으로 시작",
                imagePath: 'asset/image/apple_icon.png',
                isLoading: ref.watch(_appleLoginLoadingProvider),
                onPressed: () async {
                  GoRouter.of(context).goNamed(ScreenRoute.registration);
                },
              ),
              const VerticalSpacer(60),
              SizedBox(
                width: deviceSize.width * 56 / 100,
                height: 60,
                child: FloatingActionButton(
                  foregroundColor: AppColor.black,
                  backgroundColor: AppColor.transparentGrey_300,
                  onPressed: () => {},
                  elevation: 1,
                  focusElevation: 0,
                  hoverElevation: 0,
                  highlightElevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60 / 2),
                  ),
                  child: const Padding(
                    padding: AppPadding.padding_horizon_20,
                    child: Text(
                      "이전 버전에서 카페자리 이메일로 가입한 유저이신가요?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColor.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 12
                      )
                    ),
                  )
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

