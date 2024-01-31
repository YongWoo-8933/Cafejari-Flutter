import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/view_model/global_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

final _currentPageIndex = StateProvider((ref) => 0);


class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalViewModel globalViewModel = ref.watch(globalViewModelProvider.notifier);

    return DefaultTextStyle(
      style: const TextStyle(
        letterSpacing: 0,
        color: AppColor.black,
        fontSize: 24,
        fontWeight: FontWeight.w700,
        height: 1.6
      ),
      child: Container(
        color: AppColor.white,
        child: IndexedStack(
          index: ref.watch(_currentPageIndex),
          children: [
            _TopTextPage(
              index: 0,
              imageName: "asset/image/onboarding_0.png",
              onTap: () => ref.watch(_currentPageIndex.notifier).update((state) => 1),
              textPart: const Column(
                children: [
                  Text("카페자리를 더 유용하게"),
                  VerticalSpacer(10),
                  Text("활용해보세요!!"),
                ]
              ),
            ),
            _TopTextPage(
              index: 1,
              imageName: "asset/image/onboarding_1.png",
              onTap: () => ref.watch(_currentPageIndex.notifier).update((state) => 2),
              textPart: const Column(
                children: [
                  Text("카페자리에서는"),
                  VerticalSpacer(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("카페 혼잡도 확인", style: TextStyle(color: AppColor.notificationOrange)),
                      Text("이 가능해요"),
                    ],
                  ),
                ]
              ),
            ),
            _TopTextPage(
              index: 2,
              imageName: "asset/image/onboarding_2.png",
              onTap: () => ref.watch(_currentPageIndex.notifier).update((state) => 3),
              textPart: const Column(
                children: [
                  Text("우측 상단 깃발을 통해"),
                  VerticalSpacer(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("카페가 집중된 곳", style: TextStyle(color: AppColor.notificationOrange)),
                      Text("으로"),
                    ],
                  ),
                  VerticalSpacer(10),
                  Text("이동할 수 있어요"),
                ]
              ),
            ),
            _TopTextPage(
              index: 3,
              imageName: "asset/image/onboarding_3.png",
              onTap: () => ref.watch(_currentPageIndex.notifier).update((state) => 4),
              textPart: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("검색을 통해", style: TextStyle(color: AppColor.notificationOrange)),
                      Text("원하는 카페가"),
                    ],
                  ),
                  VerticalSpacer(10),
                  Text("등록되어 있는지 확인해보세요"),
                ]
              ),
            ),
            _BottomTextPage(
              index: 4,
              imageName: "asset/image/onboarding_4.png",
              onTap: () => ref.watch(_currentPageIndex.notifier).update((state) => 5),
              textPart: const Column(
                children: [
                  Text("카페가 등록되어 있지 않다면,"),
                  VerticalSpacer(10),
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
            _TopTextPage(
              index: 5,
              imageName: "asset/image/onboarding_5.png",
              onTap: () => ref.watch(_currentPageIndex.notifier).update((state) => 6),
              textPart: const Column(
                  children: [
                    Text("마커를 누르면"),
                    VerticalSpacer(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("간편 정보", style: TextStyle(color: AppColor.notificationOrange)),
                        Text("를 확인할 수 있고"),
                      ],
                    ),
                  ]
              ),
            ),
            _BottomTextPage(
              index: 6,
              imageName: "asset/image/onboarding_6.png",
              onTap: () => ref.watch(_currentPageIndex.notifier).update((state) => 7),
              textPart: const Column(
                children: [
                  Text("위로 올려"),
                  VerticalSpacer(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("카페 상세정보", style: TextStyle(color: AppColor.notificationOrange)),
                      Text("를 알 수 있어요"),
                    ],
                  ),
                ]
              ),
            ),
            _BottomTextPage(
              index: 7,
              imageName: "asset/image/onboarding_7.png",
              onTap: () => ref.watch(_currentPageIndex.notifier).update((state) => 8),
              textPart: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("혼잡도 등록", style: TextStyle(color: AppColor.notificationOrange)),
                      Text("을 통해"),
                    ],
                  ),
                  VerticalSpacer(10),
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
            _BottomTextPage(
              index: 7,
              imageName: "asset/image/onboarding_8.png",
              onTap: () => ref.watch(_currentPageIndex.notifier).update((state) => 8),
              textPart: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("챌린지 참여", style: TextStyle(color: AppColor.notificationOrange)),
                      Text("를 통해"),
                    ],
                  ),
                  VerticalSpacer(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("더 많은 포인트", style: TextStyle(color: AppColor.notificationOrange)),
                      Text("를"),
                    ],
                  ),
                  VerticalSpacer(10),
                  Text("얻을 수 있어요"),
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopTextPage extends StatelessWidget {
  final int index;
  final String imageName;
  final VoidCallback onTap;
  final Widget textPart;

  const _TopTextPage({
    super.key,
    required this.index,
    required this.imageName,
    required this.onTap,
    required this.textPart,
  });

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: AppColor.white,
        width: deviceSize.width,
        height: deviceSize.height,
        child: Column(
          children: [
            const VerticalSpacer(100),
            textPart,
            Transform.translate(
              offset: const Offset(0, 40),
              child: Image.asset(imageName, width: deviceSize.width + 10 * 2)
            )
          ],
        ),
      ),
    );
  }
}

class _BottomTextPage extends StatelessWidget {
  final int index;
  final String imageName;
  final VoidCallback onTap;
  final Widget textPart;

  const _BottomTextPage({
    super.key,
    required this.index,
    required this.imageName,
    required this.onTap,
    required this.textPart,
  });

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: AppColor.white,
        width: deviceSize.width,
        height: deviceSize.height,
        child: Column(
          children: [
            Transform.translate(
              offset: const Offset(0, -180),
              child: Image.asset(imageName, width: deviceSize.width + 10 * 2)
            ),
            Transform.translate(
              offset: const Offset(0, -160),
              child: textPart
            )
          ],
        ),
      ),
    );
  }
}
