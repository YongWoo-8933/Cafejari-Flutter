import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';
import 'package:cafejari_flutter/ui/view_model/global_view_model.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

final _currentPageIndex = StateProvider((ref) => 0);
final _firstTabTime = StateProvider<DateTime?>((ref) => null);


class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalViewModel globalViewModel = ref.watch(globalViewModelProvider.notifier);
    final int currentIndex = ref.watch(_currentPageIndex);
    const double lineSpacing = 8.0;

    return DefaultTextStyle(
      style: const TextStyle(
        letterSpacing: 0,
        color: AppColor.black,
        fontSize: 24,
        fontWeight: FontWeight.w700
      ),
      child: PopScope(
        canPop: false,
        onPopInvoked: (result) {
          if(currentIndex != 0){
            ref.watch(_currentPageIndex.notifier).update((state) => currentIndex - 1);
          }
        },
        child: GestureDetector(
          onTap: () {
            if(currentIndex == 0) {
              ref.watch(_firstTabTime.notifier).update((state) => DateTime.now());
            }
            ref.watch(_currentPageIndex.notifier).update((state) => currentIndex + 1);
            if(currentIndex == 8) {
              Future.delayed(const Duration(milliseconds: 500), () async {
                await globalViewModel.setIsInstalledFirst(false);
                if (ref.watch(_firstTabTime).isNotNull) {
                  await FirebaseAnalytics.instance.logEvent(
                    name: "onboarding_duration_time",
                    parameters: {
                      "seconds": DateTime.now().difference(ref.watch(_firstTabTime)!).inSeconds.abs()
                    }
                  );
                }
                if(context.mounted) GoRouter.of(context).goNamed(ScreenRoute.root);
              });
            }
          },
          child: Container(
            color: AppColor.white,
            child: IndexedStack(
              index: ref.watch(_currentPageIndex),
              children: [
                const _TopTextPage(
                  imageName: "asset/image/onboarding_0.png",
                  textPart: Column(
                    children: [
                      Text("카페자리에 오신 것을"),
                      VerticalSpacer(lineSpacing),
                      Text("환영합니다 🤗🤗"),
                      VerticalSpacer(16),
                      Text(
                        "* 아무 곳이나 터치해주세요",
                        style: TextStyle(
                          color: AppColor.grey_500,
                          fontSize: 14,
                          fontWeight: FontWeight.w400
                        )
                      ),
                    ]
                  ),
                ),
                _TopTextPage(
                  imageName: "asset/image/onboarding_1.png",
                  textPart: Column(
                    children: [
                      const Text("카페자리에서는"),
                      const VerticalSpacer(lineSpacing),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("카페 혼잡도", style: TextStyle(color: AppColor.notificationOrange)),
                          Text(" 확인이 가능해요"),
                        ],
                      ),
                      const VerticalSpacer(16),
                      Text(
                        "* 일부 지역에서 예상 혼잡도 제공",
                        style: TextStyle(
                            color: AppColor.error.withOpacity(0.8),
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        )
                      ),
                    ]
                  ),
                ),
                const _TopTextPage(
                  imageName: "asset/image/onboarding_2.png",
                  textPart: Column(
                    children: [
                      Text("우측 상단 깃발을 통해"),
                      VerticalSpacer(lineSpacing),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("대학가, 핫 플레이스", style: TextStyle(color: AppColor.notificationOrange)),
                          Text("로"),
                        ],
                      ),
                      VerticalSpacer(lineSpacing),
                      Text("이동할 수 있어요"),
                    ]
                  ),
                ),
                const _TopTextPage(
                  imageName: "asset/image/onboarding_3.png",
                  textPart: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("검색을 통해", style: TextStyle(color: AppColor.notificationOrange)),
                          Text(" 원하는 카페가"),
                        ],
                      ),
                      VerticalSpacer(lineSpacing),
                      Text("등록되어 있는지 확인해보세요"),
                    ]
                  ),
                ),
                const _BottomTextPage(
                  imageName: "asset/image/onboarding_4.png",
                  textPart: Column(
                    children: [
                      Text("원하는 카페가 없다면,"),
                      VerticalSpacer(lineSpacing),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("카페추가", style: TextStyle(color: AppColor.notificationOrange)),
                          Text("로 등록해보세요"),
                        ],
                      ),
                    ]
                  ),
                ),
                const _TopTextPage(
                  imageName: "asset/image/onboarding_5.png",
                  textPart: Column(
                      children: [
                        Text("마커를 누르면 카페의"),
                        VerticalSpacer(lineSpacing),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("간단한 정보", style: TextStyle(color: AppColor.notificationOrange)),
                            Text("를 볼 수 있고"),
                          ],
                        ),
                      ]
                  ),
                ),
                const _BottomTextPage(
                  imageName: "asset/image/onboarding_6.png",
                  textPart: Column(
                    children: [
                      Text("위로 올려 카페의"),
                      VerticalSpacer(lineSpacing),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("상세정보", style: TextStyle(color: AppColor.notificationOrange)),
                          Text("를 알 수 있어요"),
                        ],
                      ),
                    ]
                  ),
                ),
                const _BottomTextPage(
                  imageName: "asset/image/onboarding_7.png",
                  textPart: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("혼잡도 등록", style: TextStyle(color: AppColor.notificationOrange)),
                          Text("을 통해"),
                        ],
                      ),
                      VerticalSpacer(lineSpacing),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("포인트", style: TextStyle(color: AppColor.notificationOrange)),
                          Text("를 얻을 수 있어요"),
                        ],
                      ),
                    ]
                  ),
                ),
                const _BottomTextPage(
                  imageName: "asset/image/onboarding_8.png",
                  textPart: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("챌린지", style: TextStyle(color: AppColor.notificationOrange)),
                          Text("를 통해 "),
                          Text("추가 포인트", style: TextStyle(color: AppColor.notificationOrange)),
                          Text("를"),
                        ],
                      ),
                      VerticalSpacer(lineSpacing),
                      Text("얻을 수 있어요"),
                    ]
                  ),
                ),
                Stack(
                  children: [
                    const _BottomTextPage(
                      imageName: "asset/image/onboarding_8.png",
                      textPart: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("챌린지", style: TextStyle(color: AppColor.notificationOrange)),
                                Text("를 통해 "),
                                Text("추가 포인트", style: TextStyle(color: AppColor.notificationOrange)),
                                Text("를"),
                              ],
                            ),
                            VerticalSpacer(lineSpacing),
                            Text("얻을 수 있어요"),
                          ]
                      ),
                    ),
                    Container(
                      color: AppColor.transparentBlack_700,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "카페자리를 시작합니다",
                            style: TextStyle(
                              color: AppColor.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 20
                            ),
                          ),
                          const VerticalSpacer(20),
                          LoadingAnimationWidget.hexagonDots(color: AppColor.white, size: 48),
                          const VerticalSpacer(40)
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TopTextPage extends StatelessWidget {
  final String imageName;
  final Widget textPart;

  const _TopTextPage({
    super.key,
    required this.imageName,
    required this.textPart,
  });

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
          height: 280,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [const VerticalSpacer(20), textPart],
          ),
        ),
        Transform.translate(
          offset: const Offset(0, 270),
          child: Transform.scale(
            scale: 1.1,
            child: Image.asset(imageName, width: deviceSize.width)
          ),
        )
      ],
    );
  }
}

class _BottomTextPage extends StatelessWidget {
  final String imageName;
  final Widget textPart;

  const _BottomTextPage({
    super.key,
    required this.imageName,
    required this.textPart,
  });

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 240,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [const VerticalSpacer(40), textPart],
          ),
        ),
        Transform.translate(
          offset: const Offset(0, -200),
          child: Transform.scale(
            scale: 1.1,
            child: Image.asset(imageName, width: deviceSize.width)
          ),
        )
      ],
    );
  }
}
