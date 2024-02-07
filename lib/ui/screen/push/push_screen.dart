import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/domain/entity/push/push.dart';
import 'package:cafejari_flutter/domain/entity/push/util.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/back_button_app_bar.dart';
import 'package:cafejari_flutter/ui/components/full_width_banner_ad.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/screen/push/component/push_block.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/util/ad_manager.dart';
import 'package:cafejari_flutter/ui/view_model/global_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

final _isLoading = StateProvider((ref) => false);

class PushScreen extends ConsumerStatefulWidget {
  const PushScreen({super.key});

  @override
  PushScreenState createState() => PushScreenState();
}

class PushScreenState extends ConsumerState<PushScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final GlobalViewModel globalViewModel = ref.watch(globalViewModelProvider.notifier);
      ref.watch(_isLoading.notifier).update((state) => true);
      globalViewModel.init(
        onFinish: (globalState) async {
          final Pushes unreadPushes = globalState.myPushes.where((e) => !e.isRead).toList();
          for(Push unreadPush in unreadPushes) {
            globalViewModel.readPush(pushId: unreadPush.id, context: context);
          }
          ref.watch(_isLoading.notifier).update((state) => false);
        }
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalState globalState = ref.watch(globalViewModelProvider);
    List<Pushes> typePushes = [[], [], [], [], []];
    for(Push push in globalState.myPushes) {
      typePushes[push.type.index].add(push);
    }

    return Scaffold(
      appBar: BackButtonAppBar(
        backButtonText: "알림함",
        backGroundColor: AppColor.white,
        onBack: () => GoRouter.of(context).pop(),
      ),
      backgroundColor: AppColor.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: AdManager.instance.notificationScreenBannerAd?.sizes.first.height.toDouble() ?? 50),
            child: DefaultTabController(
              length: 6,
              child: Column(
                children: [
                  TabBar(
                    indicator: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: AppColor.secondary,
                    ),
                    padding: AppPadding.padding_20,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelColor: AppColor.white,
                    unselectedLabelColor: AppColor.secondary,
                    isScrollable: true,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 4),
                    tabs: [
                      Tab(height: 40, iconMargin: AppPadding.padding_0, child: _tab(56, "전체")),
                      Tab(height: 40, child: _tab(56, PushType.notification().tag)),
                      Tab(height: 40, child: _tab(56, PushType.activity().tag)),
                      Tab(height: 40, child: _tab(68, PushType.event().tag)),
                      Tab(height: 40, child: _tab(68, PushType.marketing().tag)),
                      Tab(height: 40, child: _tab(56, PushType.etc().tag))
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        _buildTabContent(globalState.myPushes),
                        ...typePushes.map((e) => _buildTabContent(e)).toList()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          FullWidthBannerAd(bannerAd: AdManager.instance.notificationScreenBannerAd)
        ],
      ),
    );
  }

  // 탭 내용을 생성하는 함수
  Widget _buildTabContent(Pushes pushes) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Visibility(
          visible: ref.watch(_isLoading),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoadingAnimationWidget.hexagonDots(color: AppColor.primary, size: 48),
              const VerticalSpacer(80)
            ],
          ),
        ),
        Visibility(
          visible: !ref.watch(_isLoading) && pushes.isNotEmpty,
          child: ListView.builder(
            itemCount: pushes.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    VerticalSpacer(20),
                    Text(
                      "2달 이상 경과된 알림은 자동으로 삭제됩니다",
                      style: TextStyle(
                        color: AppColor.grey_400,
                        fontWeight: FontWeight.w600,
                        fontSize: 12
                      ),
                    ),
                    VerticalSpacer(15),
                  ],
                );
              } else {
                final push = pushes[index - 1];

                // 현재의 push와 이전의 push를 비교하여 날짜가 변경되었는지 확인
                final bool isDateChanged =
                    index == 1 || push.pushedAt.day != pushes[index - 2].pushedAt.day;

                return Column(
                  children: [
                    if (isDateChanged) // 날짜가 변경되었을 때만 표시
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(height: 0.5, width: 120, color: AppColor.grey_500),
                            Text("   ${push.pushedAt.year}."
                                "${push.pushedAt.month.toString().padLeft(2, '0')}."
                                "${push.pushedAt.day.toString().padLeft(2, '0')}   ",
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: AppColor.grey_500,
                              ),
                            ),
                            Container(height: 0.5, width: 120, color: AppColor.grey_500),
                          ],
                        ),
                      ),
                    PushBlock(push: push), // PushBlock 표시
                  ],
                );
              }
            },
          ),
        ),
        Visibility(
          visible: !ref.watch(_isLoading) && pushes.isEmpty,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "asset/image/icon_empty.png",
                width: 100,
              ),
              const VerticalSpacer(30),
              const Text("받은 알림이 없어요", style: TextSize.textSize_16),
              const VerticalSpacer(80),
            ],
          ),
        )
      ],
    );
  }

  Container _tab(double width, String tag) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppColor.secondary),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Text(tag, style: TextSize.textSize_14_w700),
    );
  }
}
