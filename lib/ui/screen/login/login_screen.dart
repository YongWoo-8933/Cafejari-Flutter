import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/components/custom_snack_bar.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/screen/login/component/login_button.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';
import 'package:cafejari_flutter/ui/util/web_view_route.dart';
import 'package:cafejari_flutter/ui/view_model/global_view_model.dart';
import 'package:cafejari_flutter/ui/view_model/login_view_model.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

final _kakaoLoginLoadingProvider = StateProvider<bool>((ref) => false);
final _appleLoginLoadingProvider = StateProvider<bool>((ref) => false);


class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}


class LoginScreenState extends ConsumerState<LoginScreen> {
  LoginScreenState();

  @override
  void dispose() {
    super.dispose();
    Future.delayed(Duration.zero, () {
      ref.watch(_kakaoLoginLoadingProvider.notifier).update((state) => false);
      ref.watch(_appleLoginLoadingProvider.notifier).update((state) => false);
      ref.watch(loginViewModelProvider.notifier).clearViewModel();
    });
  }

  @override
  Widget build(BuildContext context) {
    final LoginViewModel loginViewModel = ref.watch(loginViewModelProvider.notifier);
    final GlobalViewModel globalViewModel = ref.watch(globalViewModelProvider.notifier);
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
                loadingColor: AppColor.black,
                text: "카카오 계정으로 시작",
                imagePath: 'asset/image/kakao_icon.png',
                isLoading: ref.watch(_kakaoLoginLoadingProvider),
                heroTag: "kakao_login_button",
                onPressed: () async {
                  if(!ref.watch(_kakaoLoginLoadingProvider)) {
                    ref.watch(_kakaoLoginLoadingProvider.notifier).update((state) => true);
                    OAuthToken token = await isKakaoTalkInstalled() ?
                      await UserApi.instance.loginWithKakaoTalk() :
                      await UserApi.instance.loginWithKakaoAccount();
                    final bool? isUserExist = await loginViewModel.kakaoLogin(accessToken: token.accessToken);
                    ref.watch(_kakaoLoginLoadingProvider.notifier).update((state) => false);
                    switch(isUserExist) {
                      case true:
                        loginViewModel.globalViewModel.showSnackBar(content: "로그인 완료", type: SnackBarType.complete);
                        if (context.mounted) GoRouter.of(context).pop();
                        await FirebaseAnalytics.instance.logLogin();
                      case false:
                        if (context.mounted) GoRouter.of(context).goNamed(ScreenRoute.registration);
                      default:
                        null;
                    }
                  }
                },
              ),
              Visibility(
                visible: defaultTargetPlatform == TargetPlatform.iOS,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const VerticalSpacer(24),
                    LoginButton(
                      buttonWidth: deviceSize.width * 56 / 100,
                      buttonHeight: 48,
                      textColor: AppColor.white,
                      backgroundColor: AppColor.black,
                      loadingColor: AppColor.white,
                      text: "Apple 계정으로 시작",
                      imagePath: 'asset/image/apple_icon.png',
                      isLoading: ref.watch(_appleLoginLoadingProvider),
                      heroTag: "apple_login_button",
                      onPressed: () async {
                        if(!ref.watch(_appleLoginLoadingProvider)) {
                          ref.watch(_appleLoginLoadingProvider.notifier).update((state) => true);
                          final AuthorizationCredentialAppleID credential = await SignInWithApple.getAppleIDCredential(
                            scopes: [
                              AppleIDAuthorizationScopes.email,
                              AppleIDAuthorizationScopes.fullName,
                            ],
                          );
                          final bool? isUserExist = await loginViewModel.appleLogin(idToken: credential.identityToken ?? "", code: credential.authorizationCode);
                          ref.watch(_appleLoginLoadingProvider.notifier).update((state) => false);
                          switch(isUserExist) {
                            case true:
                              loginViewModel.globalViewModel.showSnackBar(content: "로그인 완료", type: SnackBarType.complete);
                              if (context.mounted) GoRouter.of(context).pop();
                              await FirebaseAnalytics.instance.logLogin();
                            case false:
                              if (context.mounted) GoRouter.of(context).goNamed(ScreenRoute.registration);
                            default:
                              null;
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
              const VerticalSpacer(60),
              SizedBox(
                width: deviceSize.width * 56 / 100,
                height: 60,
                child: FloatingActionButton(
                  heroTag: "user_migration_button",
                  foregroundColor: AppColor.black,
                  backgroundColor: AppColor.transparentGrey_300,
                  onPressed: () => globalViewModel.navigateToWebView(
                      route: WebViewRoute.userMigration(), context: context),
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
                        fontSize: 13
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