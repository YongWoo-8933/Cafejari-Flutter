import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/components/top_app_bar.dart';
import 'package:cafejari_flutter/ui/screen/point/component/point_record.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PointScreen extends ConsumerWidget {
  const PointScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double taBarSize = (MediaQuery.of(context).size.width-60);

    return Scaffold(
      appBar: BackButtonAppBar(
        backButtonText: "내 포인트",
        backGroundColor: AppColor.white,
        onBack: () => {GoRouter.of(context).pop()},
      ),
      backgroundColor: AppColor.white,
      body: DefaultTabController(
        length: 2, // 탭의 수
        child: Column(
          children: [
            Container(
              width: taBarSize,
              height: 90,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1, color: AppColor.grey_300), // 위쪽 테두리
                  bottom: BorderSide(width: 1, color:AppColor.grey_300), // 아래쪽 테두리
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("보유 포인트", style: TextSize.textSize_grey_14),
                  SizedBox(height: 10),
                  Text("45,000", style: TextSize.textSize_bold_16)
                ],
              ),
            ),
            const VerticalSpacer(25),
            Container(
              width: taBarSize,
              height: 50,
              decoration: BoxDecoration(
                color: AppColor.challengeBlock,
                  borderRadius: BorderRadius.circular(30),
              ),
              padding: AppPadding.padding_7,
              child: TabBar(
                  indicator: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // 모서리 둥글기 조절
                    ),
                    color: AppColor.primary, // 탭의 배경색
                  ),
                  labelColor: AppColor.white,
                  unselectedLabelColor: AppColor.unselectedTabBarColor,
                  tabs: const [
                    Tab(
                      child: Text("적립", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                    ),
                    Tab(
                      child: Text("사용", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                    ),
                  ],
                ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return PointRecord(title: '내가 받은 포인트');
                    },
                  ),
                  ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return PointRecord(title: '내가 사용한 포인트');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
