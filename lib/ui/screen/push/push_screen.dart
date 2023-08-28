import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/domain/entity/push/push.dart';
import 'package:cafejari_flutter/domain/entity/push/util.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/back_button_app_bar.dart';
import 'package:cafejari_flutter/ui/screen/push/component/push_block.dart';
import 'package:cafejari_flutter/ui/state/push_state/push_state.dart';
import 'package:cafejari_flutter/ui/view_model/push_view_model.dart';
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
    Future.delayed(Duration.zero, () async {
      final viewModel = ref.watch(pushViewModelProvider.notifier);
      await viewModel.refreshPushes();
    });
  }

  @override
  Widget build(BuildContext context) {
    final PushState pushState = ref.watch(pushViewModelProvider);
    final PushViewModel pushViewModel = ref.watch(pushViewModelProvider.notifier);

    return Scaffold(
      appBar: BackButtonAppBar(
        backButtonText: "알림함",
        backGroundColor: AppColor.white,
        onBack: () => {GoRouter.of(context).pop()},
      ),
      backgroundColor: AppColor.white,
      body: DefaultTabController(
        length: 6,
        child: Column(
          children: [
            Container(
              padding: AppPadding.padding_horizon_30,
              color: AppColor.white,
              child: TabBar(
                indicator: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  color: AppColor.secondary,
                ),
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: AppColor.white,
                unselectedLabelColor: AppColor.secondary,
                isScrollable: true,
                indicatorPadding: EdgeInsets.symmetric(vertical: 4),
                labelPadding: EdgeInsets.symmetric(horizontal: 4),
                tabs: [
                  Tab(child: _tab(56, "전체")),
                  Tab(child: _tab(56, PushType.activity().tag)),
                  Tab(child: _tab(56, PushType.etc().tag)),
                  Tab(child: _tab(68, PushType.event().tag)),
                  Tab(child: _tab(68, PushType.marketing().tag)),
                  Tab(child: _tab(56, PushType.notification().tag)),
                ],
                onTap: (index) {
                  pushViewModel.setTypePush(_getPushTypeFromTabIndex(index));
                },
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(6, (index) {
                  // 각 탭에 해당하는 내용을 생성
                  return _buildTabContent(pushState, index);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 탭 내용을 생성하는 함수
  Widget _buildTabContent(PushState pushState, int tabIndex) {
    final List<Push> pushes =
    tabIndex == 0 ? pushState.pushes : pushState.typePushes;

    if (pushes.isNotEmpty) {
      return ListView.builder(
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
                  padding: EdgeInsets.symmetric(vertical: 20),
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
      );
    } else {
      return Center(child: Text("비었음"));
    }
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

  PushType _getPushTypeFromTabIndex(int index) {
    switch (index) {
      case 1:
        return PushType.activity();
      case 2:
        return PushType.etc();
      case 3:
        return PushType.event();
      case 4:
        return PushType.marketing();
      case 5:
        return PushType.notification();
      default:
        return PushType.activity();
    }
  }
}
