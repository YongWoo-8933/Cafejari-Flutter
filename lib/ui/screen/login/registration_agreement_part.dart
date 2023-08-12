
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';



final _isServiceAgreedProvider = StateProvider<bool>((ref) => false);
final _isPrivacyAgreedProvider = StateProvider<bool>((ref) => false);
final _isMarketingAgreedProvider = StateProvider<bool>((ref) => false);
final _isServiceExpandedProvider = StateProvider<bool>((ref) => true);
final _isPrivacyExpandedProvider = StateProvider<bool>((ref) => true);
final _isMarketingExpandedProvider = StateProvider<bool>((ref) => false);
final _isRegistrationLoading = StateProvider<bool>((ref) => false);

class AgreementPart extends ConsumerWidget {
  const AgreementPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginViewModelProvider);
    final loginViewModel = ref.watch(loginViewModelProvider.notifier);

    return Container(
      width: double.infinity,
      color: AppColor.grey_200,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _AllAgreeButton(
              onClick: () {
                ref.watch(_isServiceAgreedProvider.notifier).update((state) => true);
                ref.watch(_isPrivacyAgreedProvider.notifier).update((state) => true);
                ref.watch(_isMarketingAgreedProvider.notifier).update((state) => true);
              }
            ),
            const VerticalSpacer(20),
            _AgreementBox(
              isChecked: ref.watch(_isServiceAgreedProvider),
              isExpanded: ref.watch(_isServiceExpandedProvider),
              title: "(필수) 서비스 이용약관 동의",
              content: "1. 개인정보 수집목적 및 이용목적\n\n가. 서비스 제공에 관한 블라블라는 블라블라인 것이므로 블라브라블라블라 띵동따라똥따라띵기딩강꽁깡",
              onClick: () => ref.watch(_isServiceAgreedProvider.notifier).update((state) => !state),
              onArrowClick: () => ref.watch(_isServiceExpandedProvider.notifier).update((state) => !state)
            ),
            const VerticalSpacer(20),
            _AgreementBox(
                isChecked: ref.watch(_isPrivacyAgreedProvider),
                isExpanded: ref.watch(_isPrivacyExpandedProvider),
                title: "(필수) 개인정보 수집 및 이용 동의",
                content: "1. 개인정보 수집목적 및 이용목적\n\n가. 서비스 제공에 관한 블라블라는 블라블라인 것이므로 블라브라블라블라 띵동따라똥따라띵기딩강꽁깡",
                onClick: () => ref.watch(_isPrivacyAgreedProvider.notifier).update((state) => !state),
                onArrowClick: () => ref.watch(_isPrivacyExpandedProvider.notifier).update((state) => !state)
            ),
            const VerticalSpacer(20),
            _AgreementBox(
                isChecked: ref.watch(_isMarketingAgreedProvider),
                isExpanded: ref.watch(_isMarketingExpandedProvider),
                title: "(선택) 마케팅 알림 수신 동의",
                content: "1. 개인정보 수집목적 및 이용목적\n\n가. 서비스 제공에 관한 블라블라는 블라블라인 것이므로 블라브라블라블라 띵동따라똥따라띵기딩강꽁깡",
                onClick: () => ref.watch(_isMarketingAgreedProvider.notifier).update((state) => !state),
                onArrowClick: () => ref.watch(_isMarketingExpandedProvider.notifier).update((state) => !state)
            ),
            const VerticalSpacer(40),
            _RegistrationButton(
              enabled: ref.watch(_isServiceAgreedProvider) && ref.watch(_isPrivacyAgreedProvider) &&
                  loginState.nicknameErrorMessage.isEmpty,
              isLoading: ref.watch(_isRegistrationLoading),
              onClick: () async {
                if (loginState.kakaoAccessToken.isNotEmpty) {
                  ref.watch(_isRegistrationLoading.notifier).update((state) => true);
                  await loginViewModel.registerAsKakaoUser();
                } else if (loginState.appleAccessToken.isNotEmpty) {
                  // loginViewModel.registerAsKakaoUser();
                }
                ref.watch(_isRegistrationLoading.notifier).update((state) => false);
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
  final VoidCallback onArrowClick;

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
          color: AppColor.grey_400,
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
                    color: isChecked ? AppColor.secondary : AppColor.grey_400,
                    size: 24,
                  ),
                  const HorizontalSpacer(8),
                  Text(
                    title,
                    style: TextStyle(
                      color: isChecked ? AppColor.black : AppColor.grey_400,
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
                    const Divider(thickness: 1, height: 1, color: AppColor.grey_400),
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
                duration: const Duration(milliseconds: 300),
                child: Center(
                  child: LoadingAnimationWidget.hexagonDots(color: AppColor.white, size: 20)
                )
              ),
              AnimatedOpacity(
                opacity: isLoading ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 300),
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