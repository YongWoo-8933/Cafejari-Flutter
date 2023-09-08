import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/domain/entity/push/push.dart';
import 'package:cafejari_flutter/domain/entity/push/util.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/back_button_app_bar.dart';
import 'package:cafejari_flutter/ui/screen/push/component/push_block.dart';
import 'package:cafejari_flutter/ui/state/push_state/push_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
      ref.watch(pushViewModelProvider.notifier).refreshPushes(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final PushState pushState = ref.watch(pushViewModelProvider);

    return Scaffold(
      appBar: BackButtonAppBar(
        backButtonText: "알림함",
        backGroundColor: AppColor.white,
        onBack: () => GoRouter.of(context).pop(),
      ),
      backgroundColor: AppColor.white,
      body: DefaultTabController(
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
                Tab(height: 40, child: _tab(56, PushType.etc().tag)),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildTabContent(pushState.pushes),
                  ...pushState.typePushes.map((e) => _buildTabContent(e)).toList()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 탭 내용을 생성하는 함수
  Widget _buildTabContent(Pushes pushes) {
    return Stack(
      children: [
        Visibility(
          visible: pushes.isNotEmpty,
          child: ListView.builder(
            itemCount: pushes.length,
            itemBuilder: (context, index) {
              final push = pushes[index];

              // 현재의 push와 이전의 push를 비교하여 날짜가 변경되었는지 확인
              final bool isDateChanged =
                  index == 0 || push.pushedAt.day != pushes[index - 1].pushedAt.day;

              return Column(
                children: [
                  if (isDateChanged) // 날짜가 변경되었을 때만 표시
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(height: 1, width: 120, color: AppColor.grey_600),
                          Text("   ${pushes[index].pushedAt.year}."
                              "${pushes[index].pushedAt.month.toString().padLeft(2, '0')}."
                              "${pushes[index].pushedAt.day.toString().padLeft(2, '0')}   ",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w800,
                                  color: AppColor.grey_600,
                                ),
                              ),
                          Container(height: 1, width: 120, color: AppColor.grey_600),
                        ],
                      ),
                    ),
                  PushBlock(push: push), // PushBlock 표시
                ],
              );
            },
          ),
        ),
        Visibility(
          visible: pushes.isEmpty,
          child: Container(
            alignment: Alignment.center,
            color: AppColor.white,
            child: const Text("비었음")
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
