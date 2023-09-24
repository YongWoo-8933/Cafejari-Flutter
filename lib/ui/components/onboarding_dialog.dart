import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/duration.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/page_view_dot_indicator.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

final _currentPageIndex = StateProvider((ref) => 0);
final _pageController = StateProvider((ref) => PageController(initialPage: 0));


class OnboardingDialog extends ConsumerWidget {
  const OnboardingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      elevation: 0,
      backgroundColor: AppColor.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 30),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: PageViewDotIndicator(
                        dotCount: 4,
                        selectedDotIndex: ref.watch(_currentPageIndex),
                        selectedDotColor: AppColor.secondary.withOpacity(0.8),
                      )
                    ),
                    SizedBox(
                      height: 500,
                      width: constraints.maxWidth,
                      child: PageView(
                        controller: ref.watch(_pageController),
                        onPageChanged: (value) => ref.watch(_currentPageIndex.notifier).update((state) => value),
                        children: const [
                          _Page(
                            title: "카페 혼잡도를 한눈에 확인",
                            introduction: "지도에서 카페를 선택하고\n혼잡도, 콘센트 정보 등을\n미리 확인하고 방문하세요",
                            imagePath: "asset/image/onboarding_0.png",
                          ),
                          _Page(
                            title: "혼잡도 등록하면 포인트",
                            introduction: "이용 중인 카페의 혼잡도를\n등록해주시면 즉시!\n포인트를 드립니다 :)",
                            imagePath: "asset/image/onboarding_1.png",
                          ),
                          _Page(
                            title: "포인트로 공짜커피",
                            introduction: "혼잡도를 등록하거나 챌린지,\n이벤트를 통해 포인트를 모아\n실제 커피와 교환할 수 있어요",
                            imagePath: "asset/image/onboarding_2.png",
                          ),
                          _Page(
                            title: "나에게 맞는 카페 추천",
                            introduction: "나만의 카페 스타일을 4가지항목으로\n쉽게 등록하고, 내 성향에 맞는\n카페를 골라 가보세요",
                            imagePath: "asset/image/onboarding_3.png",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (ref.watch(_currentPageIndex) == 0) {
                            Navigator.of(context).pop();
                          } else {
                            ref.watch(_pageController).animateToPage(
                              ref.watch(_currentPageIndex) + -1,
                              duration: AppDuration.animationDefault,
                              curve: Curves.easeInOut
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: AppColor.white,
                          backgroundColor: AppColor.secondary,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          elevation: 3
                        ),
                        child: Text(ref.watch(_currentPageIndex) == 0 ? "SKIP" : "PREV"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (ref.watch(_currentPageIndex) == 3) {
                            Navigator.of(context).pop();
                          } else {
                            ref.watch(_pageController).animateToPage(
                              ref.watch(_currentPageIndex) + 1,
                              duration: AppDuration.animationDefault,
                              curve: Curves.easeInOut
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: AppColor.white,
                          backgroundColor: AppColor.primary,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          elevation: 3
                        ),
                        child: Text(ref.watch(_currentPageIndex) == 3 ? "START" : "NEXT"),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }
      ),
    );
  }
}

class _Page extends StatelessWidget {
  final String title;
  final String introduction;
  final String imagePath;
  const _Page({super.key, required this.title, required this.introduction, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(title, style: TextSize.textSize_bold_18),
        const VerticalSpacer(8),
        Text(introduction, style: TextSize.textSize_12, textAlign: TextAlign.center),
        const VerticalSpacer(12),
        Image.asset(imagePath, height: 400),
      ],
    );
  }
}
