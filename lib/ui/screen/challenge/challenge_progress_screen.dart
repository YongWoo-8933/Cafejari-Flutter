import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/top_app_bar.dart';
import 'package:cafejari_flutter/ui/screen/challenge/component/challenge_information.dart';
import 'package:cafejari_flutter/ui/screen/challenge/component/challenge_record.dart';
import 'package:cafejari_flutter/ui/screen/challenge/component/challenge_slier.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ChallengeProgressScreen extends ConsumerWidget {
  const ChallengeProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: BackButtonAppBar(
        backGroundColor: AppColor.white,
        backButtonText: "챌린지 정보",
        onBack: GoRouter.of(context).pop,
      ),
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ChallengeSlider( // 1, 29, 30 -> 이미지의 크기가 화면 전체넓이를 넘어가는경우
              challengePoint: [300, 600, 900, 1000],
              challengeTarget: [1,10,20,30],
              currentProgress: 15,
            ),
            SizedBox(height: 30),
            ChallengeRecord()
          ],
        ),
      ),
    );
  }
}
