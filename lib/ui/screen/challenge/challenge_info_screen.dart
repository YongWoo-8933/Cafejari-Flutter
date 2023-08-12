import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/screen/challenge/component/challenge_information.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ChallengeInfoScreen extends ConsumerWidget {
  const ChallengeInfoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalState globalState = ref.watch(globalViewModelProvider);
    final Size deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('혼잡도 공유 챌린지', style: TextSize.textSize_16),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(CupertinoIcons.left_chevron, color: AppColor.black),
        ),
        backgroundColor: AppColor.white,
        elevation: 0,
      ),
      backgroundColor: AppColor.white,
      body: SingleChildScrollView( // Added a SingleChildScrollView to make the body scrollable
        child: Column(
          children: [
            ChallengeInformation(
              challengeImage: 'asset/image/testimage.png',
              title: "챌린지 제목",
              information: "설명설명 설명설명",
              date: "2023-08-09",
            ),
            SizedBox(height: 20), // Added spacing between widgets
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0), // Added padding to the bottom navigation bar
        child: ActionButtonPrimary(
          buttonWidth: deviceSize.width - 60,
          buttonHeight: 40,
          title: "참여하기",
          onPressed: () {
            GoRouter.of(context).goNamed(ScreenRoute.challenge_progress);
          },
        ),
      ),
    );
  }
}
