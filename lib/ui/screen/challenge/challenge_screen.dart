
import 'package:cafejari_flutter/domain/entity/challenge/challenge.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/screen/challenge/component/challenge_VIP.dart';
import 'package:cafejari_flutter/ui/screen/challenge/component/challenge_block.dart';
import 'package:cafejari_flutter/ui/state/challenge_state/challenge_state.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';
import 'package:cafejari_flutter/ui/view_model/challenge_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class ChallengeScreen extends ConsumerStatefulWidget {
  const ChallengeScreen({super.key});

  @override
  ChallengeScreenState createState() => ChallengeScreenState();
}

final RefreshController _refreshController = RefreshController(initialRefresh: false);


class ChallengeScreenState extends ConsumerState<ChallengeScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ChallengeViewModel challengeViewModel = ref.watch(challengeViewModelProvider.notifier);
    final ChallengeState challengeState = ref.watch(challengeViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('챌린지', style: TextSize.textSize_bold_16),
        centerTitle: false,
        backgroundColor: AppColor.white,
        elevation: 0,
      ),
      backgroundColor: AppColor.grey_0,
      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: () async {
          await challengeViewModel.refreshChallenges();
          await challengeViewModel.globalViewModel.init();
          _refreshController.refreshCompleted();
        },
        child: Column(
          children: [
            Visibility(
              visible: challengeState.availableChallenges.isNotEmpty,
              child: SizedBox(
                height: 460,
                child: ListView.builder(
                  padding: AppPadding.padding_25,
                  scrollDirection: Axis.horizontal,
                  // itemCount: challengeState.availableChallenges.length + challengeState.unavailableChallenges.length,
                  itemCount: challengeState.availableChallenges.length,
                  itemBuilder: (context, index) {
                    // final bool available = index + 1 <= challengeState.availableChallenges.length;
                    const bool available = true;
                    // final Challenge challenge = available ?
                    //   challengeState.availableChallenges[index] :
                    //   challengeState.unavailableChallenges[index - challengeState.availableChallenges.length];
                    final Challenge challenge = challengeState.availableChallenges[index];
                    return Row(
                      children: [
                        ChallengeBlock(
                          challenge: challenge,
                          smallProfileImageUrls: challenge.challengerProfileImages,
                          available: available,
                          onPressed: () {
                            challengeViewModel.selectChallenge(challenge);
                            GoRouter.of(context).goNamed(ScreenRoute.challengeInfo);
                          },
                        ),
                        const HorizontalSpacer(16)
                      ]
                    );
                  },
                ),
              ),
            ),
            Visibility(
              visible: challengeState.availableChallenges.isEmpty,
              child: Container(
                height: 444,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "asset/image/icon_empty.png",
                      width: 100,
                    ),
                    const VerticalSpacer(30),
                    const Text("현재 진행중인 챌린지가 없어요", style: TextSize.textSize_16),
                  ],
                ),
              ),
            ),
            // Container(
            //   padding: AppPadding.padding_25,
            //   child: const Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text("챌린지 우수 참가자", style: TextSize.textSize_bold_16),
            //       ChallengeVIP()
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
