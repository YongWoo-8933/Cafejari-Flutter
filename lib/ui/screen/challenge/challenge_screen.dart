
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/screen/challenge/component/challenge_VIP.dart';
import 'package:cafejari_flutter/ui/screen/challenge/component/challenge_block.dart';
import 'package:cafejari_flutter/ui/screen/map/component/bottom_sheet_cafe_vip.dart';
import 'package:cafejari_flutter/ui/screen/my_page/component/my_page_image.dart';
import 'package:cafejari_flutter/ui/screen/my_page/component/my_page_point.dart';
import 'package:cafejari_flutter/ui/screen/my_page/component/my_page_shop.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ChallengeScreen extends ConsumerWidget {
  const ChallengeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalState globalState = ref.watch(globalViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('내 카페', style: TextSize.textSize_16),
        leading: null,
        backgroundColor: AppColor.white,
        elevation: 0,
      ),
      backgroundColor: AppColor.white,
        body: Column(
          children: [
            SingleChildScrollView( // SingleChildScrollView로 감싸서 세로 스크롤 지원
              padding: AppPadding.padding_horizon_30,
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ChallengeBlock(
                    challengeImage: 'asset/image/login_background.png',
                    title: "학습 챌린지 응원 이벤트",
                    point: 600,
                    width: globalState.deviceSize.width * 0.70,
                    height: globalState.deviceSize.height * 0.47,
                    onPressed: () {GoRouter.of(context).goNamed(ScreenRoute.challenge_info);}
                  ),
                  SizedBox(width: 10),
                  ChallengeBlock(
                    challengeImage: 'asset/image/login_background.png',
                    title: "학습 챌린지 응원 이벤트",
                    point: 600,
                    width: globalState.deviceSize.width * 0.77,
                    height: globalState.deviceSize.height * 0.47,
                    onPressed: () {GoRouter.of(context).goNamed(ScreenRoute.challenge_info);}
                  ),
                  // 추가적으로 ChallengeBlock을 더 추가할 수 있음
                ],
              ),
            ),
            Container(
              padding: AppPadding.padding_30,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("챌린지 우수 참가자", style: TextSize.textSize_bold_16),
                  ChallengeVIP()
                ],
              ),
            )
          ],
        ),
    );
  }
}
