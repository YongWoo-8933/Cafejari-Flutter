import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/top_app_bar.dart';
import 'package:cafejari_flutter/ui/screen/challenge/component/challenge_information.dart';
import 'package:cafejari_flutter/ui/state/challenge_state/challenge_state.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';
import 'package:cafejari_flutter/ui/viewmodel/challenge_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


class ChallengeInfoScreen extends ConsumerStatefulWidget {
  const ChallengeInfoScreen({super.key});

  @override
  ChallengeInfoScreenState createState() => ChallengeInfoScreenState();
}


class ChallengeInfoScreenState extends ConsumerState<ChallengeInfoScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      final viewModel = ref.watch(challengeViewModelProvider.notifier);
      await viewModel.refreshChallengers();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    final ChallengeState challengeState = ref.watch(challengeViewModelProvider);
    final GlobalState globalState = ref.watch(globalViewModelProvider);
    final ChallengeViewModel challengeViewModel = ref.watch(challengeViewModelProvider.notifier);
    final bool isParticipated = challengeState.selectedChallenge.challengerUserIds.contains(globalState.user.userId);

    return Scaffold(
      appBar: BackButtonAppBar(
        backGroundColor: AppColor.white,
        backButtonText: "챌린지",
        onBack: GoRouter.of(context).pop,
      ),
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: ChallengeInformation(challenge: challengeState.selectedChallenge),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ActionButtonPrimary(
          buttonWidth: deviceSize.width - 60,
          buttonHeight: 48,
          title: isParticipated ? "진행상황" : "참여하기",
          onPressed: () {
            if (isParticipated) {
              GoRouter.of(context).goNamed(ScreenRoute.challengeProgress);
              challengeViewModel.setChallenger();
            } else {
              GoRouter.of(context).goNamed(ScreenRoute.challengeProgress);
              challengeViewModel.setDebugChallenger();
            }
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
