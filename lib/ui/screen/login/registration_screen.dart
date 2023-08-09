
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/components/buttons/refresh_button.dart';
import 'package:cafejari_flutter/ui/components/profile_image_editable.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/components/top_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegistrationScreen extends ConsumerWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final loginState = ref.watch(loginViewModelProvider);
    final loginViewModel = ref.watch(loginViewModelProvider.notifier);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: BackButtonAppBar(
          backGroundColor: AppColor.white,
          onBack: () => GoRouter.of(context).pop()
        ),
        body: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _ProfilePart(),
          ],
        ),
      ),
    );
  }
}

// 이런식으로 private하게 state 선언
final _errorMessageProvider = StateProvider<String>((ref) => "");

class _ProfilePart extends ConsumerWidget {
  const _ProfilePart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final loginState = ref.watch(loginViewModelProvider);
    final loginViewModel = ref.watch(loginViewModelProvider.notifier);

    return Container(
      color: AppColor.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfileImageEditable(
              size: 160,
              imageUrl: "https://cafejariimage.co.kr/user/profile/기본_프로필사진_7309711.png",
              onEditButtonClick: () {}
          ),
          const VerticalSpacer(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const HorizontalSpacer(40),
              SizedBox(
                width: 160,
                child: TextFormField(
                  controller: loginState.nicknameController,
                  keyboardType: TextInputType.text,
                  cursorColor: AppColor.primary,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                  ),
                  textAlign: TextAlign.center,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  maxLength: 10,
                  onChanged: (value) async {
                    final res = await loginViewModel.validateNickname();
                    // state값 바꿀때는 이렇게 notifier를 watch하고 update 하면 됨
                    ref.watch(_errorMessageProvider.notifier).update((state) => res);
                  },
                  decoration: InputDecoration(
                    counter: null,
                    counterText: "",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        // 사용할때는 이런식으로 ref 그대로 쓰거나 build 상단에 선언해두고 쓰기
                          color: ref.watch(_errorMessageProvider).isEmpty ? AppColor.grey_200 : AppColor.error,
                          width: 1),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: ref.watch(_errorMessageProvider).isEmpty ? AppColor.grey_100 : AppColor.error,
                          width: 1),
                    ),
                  ),
                ),
              ),
              RefreshButton(buttonSize: 40, onPressed: () async {
                await loginViewModel.autoGenerateNickname();
                ref.watch(_errorMessageProvider.notifier).update((state) => "");
              })
            ],
          ),
          const VerticalSpacer(10),
          AnimatedOpacity(
            opacity: ref.watch(_errorMessageProvider).isEmpty ? 0 : 1,
            duration: const Duration(milliseconds: 500),
            child: Text(
              ref.watch(_errorMessageProvider),
              style: const TextStyle(
                  fontSize: 11,
                  color: AppColor.error
              ),
            ),
          ),
        ],
      ),
    );
  }
}
