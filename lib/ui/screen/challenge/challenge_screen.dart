
import 'package:cafejari_flutter/domain/entity/challenge/challenge.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/screen/challenge/component/challenge_VIP.dart';
import 'package:cafejari_flutter/ui/screen/challenge/component/challenge_block.dart';
import 'package:cafejari_flutter/ui/state/challenge_state/challenge_state.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';
import 'package:cafejari_flutter/ui/viewmodel/challenge_view_model.dart';
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
    Future.delayed(Duration.zero, () async {
      final viewModel = ref.watch(challengeViewModelProvider.notifier);
      await viewModel.refreshChallenges();
      await viewModel.setProfileImages();
    });
  }

  @override
  Widget build(BuildContext context) {
    final ChallengeViewModel challengeViewModel = ref.watch(challengeViewModelProvider.notifier);
    final ChallengeState challengeState = ref.watch(challengeViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('챌린지', style: TextSize.textSize_bold_16),
        leading: null,
        backgroundColor: AppColor.white,
        elevation: 0,
      ),
      backgroundColor: AppColor.grey_100,
      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: () async {
          await challengeViewModel.refreshChallenges();
          _refreshController.refreshCompleted();
        },
        child: Column(
          children: [
            Visibility(
              visible: challengeState.availableChallenges.isNotEmpty,
              child: SizedBox(
                height: 444,
                child: ListView.builder(
                  padding: AppPadding.padding_25,
                  scrollDirection: Axis.horizontal,
                  itemCount: challengeState.availableChallenges.length,
                  itemBuilder: (context, index) {
                    final Challenge challenge = challengeState.availableChallenges[index];
                    return Row(
                      children: [
                        ChallengeBlock(
                          challenge: challenge,
                          smallProfileImageUrls: challengeState.profileImageUrls.sublist(index*3),
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
              child: const SizedBox(
                height: 444,
                child: Text("진행중인 챌린지가 없습니다"),
              ),
            ),
            Container(
              padding: AppPadding.padding_25,
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
      ),
    );
  }
}
