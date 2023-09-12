
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/duration.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/components/custom_snack_bar.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/util/privacy_policy.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';
import 'package:cafejari_flutter/ui/util/service_agreement.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

final _isServiceAgreedProvider = StateProvider<bool>((ref) => false);
final _isPrivacyAgreedProvider = StateProvider<bool>((ref) => false);
final _isServiceExpandedProvider = StateProvider<bool>((ref) => true);
final _isPrivacyExpandedProvider = StateProvider<bool>((ref) => true);
final _isRegistrationLoading = StateProvider<bool>((ref) => false);

class AgreementPart extends ConsumerWidget {
  const AgreementPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginViewModelProvider);
    final loginViewModel = ref.watch(loginViewModelProvider.notifier);

    return Container(
      width: double.infinity,
      color: AppColor.grey_100,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _AllAgreeButton(
              onClick: () {
                ref.watch(_isServiceAgreedProvider.notifier).update((state) => true);
                ref.watch(_isPrivacyAgreedProvider.notifier).update((state) => true);
                if(ref.watch(_isServiceAgreedProvider)) {
                  ref.watch(_isServiceExpandedProvider.notifier).update((state) => false);
                }
                if(ref.watch(_isPrivacyAgreedProvider)) {
                  ref.watch(_isPrivacyExpandedProvider.notifier).update((state) => false);
                }
                loginViewModel.setMarketingAgreement(true);
              }
            ),
            const VerticalSpacer(20),
            _AgreementBox(
              isChecked: ref.watch(_isServiceAgreedProvider),
              isExpanded: ref.watch(_isServiceExpandedProvider),
              title: "(필수) 서비스 이용약관 동의",
              content: serviceAgreementText,
              onClick: () {
                ref.watch(_isServiceAgreedProvider.notifier).update((state) => !state);
                if(ref.watch(_isServiceAgreedProvider)) {
                  ref.watch(_isServiceExpandedProvider.notifier).update((state) => false);
                }
              },
              onArrowClick: () => ref.watch(_isServiceExpandedProvider.notifier).update((state) => !state)
              ),
              const VerticalSpacer(20),
              _AgreementBox(
              isChecked: ref.watch(_isPrivacyAgreedProvider),
              isExpanded: ref.watch(_isPrivacyExpandedProvider),
              title: "(필수) 개인정보 수집 및 이용 동의",
              content: privacyPolicyText,
              onClick: () {
                ref.watch(_isPrivacyAgreedProvider.notifier).update((state) => !state);
                if(ref.watch(_isPrivacyAgreedProvider)) {
                  ref.watch(_isPrivacyExpandedProvider.notifier).update((state) => false);
                }
              },
              onArrowClick: () => ref.watch(_isPrivacyExpandedProvider.notifier).update((state) => !state)
            ),
            const VerticalSpacer(20),
            _AgreementBox(
                isChecked: loginState.isMarketingAgreed,
                isExpanded: false,
                title: "(선택) 마케팅 알림 수신 동의",
                content: "",
                onClick: () => loginViewModel.setMarketingAgreement(!loginState.isMarketingAgreed),
                onArrowClick: null
            ),
            const VerticalSpacer(40),
            _RegistrationButton(
              enabled: ref.watch(_isServiceAgreedProvider) && ref.watch(_isPrivacyAgreedProvider) &&
                  loginState.nicknameErrorMessage.isEmpty,
              isLoading: ref.watch(_isRegistrationLoading),
              onClick: () async {
                bool result = false;
                if (loginState.kakaoAccessToken.isNotEmpty) {
                  ref.watch(_isRegistrationLoading.notifier).update((state) => true);
                  result = await loginViewModel.registerAsKakaoUser();
                } else if (loginState.appleIdToken.isNotEmpty) {
                  result = await loginViewModel.registerAsAppleUser();
                }
                ref.watch(_isRegistrationLoading.notifier).update((state) => false);
                switch(result) {
                  case true:
                    loginViewModel.globalViewModel.showSnackBar(content: "가입 완료", type: SnackBarType.complete);
                    if(context.mounted) GoRouter.of(context).goNamed(ScreenRoute.root);
                  case false:
                    if(context.mounted) GoRouter.of(context).goNamed(ScreenRoute.login);
                }
              }
            ),
            const VerticalSpacer(100),
          ],
        ),
      ),
    );
  }
}

class _AllAgreeButton extends StatelessWidget {
  final VoidCallback onClick;

  const _AllAgreeButton({
    super.key,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.padding_horizon_16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 260,
            height: 48,
            child: ElevatedButton(
              onPressed: onClick,
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.secondary,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  )
              ),
              child: const FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.check_mark_circled_solid,
                        color: AppColor.white,
                        size: 24,
                      ),
                      HorizontalSpacer(8),
                      Text(
                        "전체 동의",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColor.white
                        ),
                      ),
                    ]
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AgreementBox extends StatelessWidget {
  final bool isChecked;
  final bool isExpanded;
  final String title;
  final String content;
  final VoidCallback onClick;
  final VoidCallback? onArrowClick;

  const _AgreementBox({
    super.key,
    required this.isChecked,
    required this.isExpanded,
    required this.title,
    required this.content,
    required this.onClick,
    required this.onArrowClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        border: Border.all(
          color: AppColor.grey_300,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          InkWell(
            onTap: onClick,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.check_mark_circled_solid,
                    color: isChecked ? AppColor.secondary : AppColor.grey_300,
                    size: 24,
                  ),
                  const HorizontalSpacer(8),
                  Text(
                    title,
                    style: TextStyle(
                      color: isChecked ? AppColor.black : AppColor.grey_300,
                      fontSize: 16,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  const Expanded(child: HorizontalSpacer(0)),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        isExpanded ? CupertinoIcons.chevron_up : CupertinoIcons.chevron_down,
                        size: 20,
                        color: onArrowClick.isNull ? AppColor.transparent : AppColor.primary,
                      ),
                      onPressed: onArrowClick,
                    ),
                  )
                ]
              ),
            ),
          ),
          AnimatedSize(
            curve: Curves.easeIn,
            duration: const Duration(milliseconds: 400),
            child: InkWell(
              onTap: onArrowClick,
              child: SizedBox(
                width: double.infinity,
                height: isExpanded ? 160 : 0,
                child: ListView(
                  padding: AppPadding.padding_0,
                  children: [
                    const Divider(thickness: 1, height: 1, color: AppColor.grey_300),
                    const VerticalSpacer(20),
                    Padding(
                      padding: AppPadding.padding_horizon_20,
                      child: Text(content),
                    )
                  ]
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RegistrationButton extends StatelessWidget {
  final VoidCallback onClick;
  final bool enabled;
  final bool isLoading;

  const _RegistrationButton({
    super.key,
    required this.onClick,
    required this.enabled,
    required this.isLoading
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: enabled ? onClick : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedOpacity(
                opacity: isLoading ? 1.0 : 0.0,
                duration: AppDuration.animationDefault,
                child: Center(
                  child: LoadingAnimationWidget.hexagonDots(color: AppColor.white, size: 20)
                )
              ),
              AnimatedOpacity(
                opacity: isLoading ? 0.0 : 1.0,
                duration: AppDuration.animationDefault,
                child: const Text(
                  "가입하기",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColor.white
                  )
                )
              )
            ]
          ),
        ),
      ),
    );
  }
}