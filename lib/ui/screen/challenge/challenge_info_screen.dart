import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/top_app_bar.dart';
import 'package:cafejari_flutter/ui/screen/challenge/component/challenge_information.dart';
import 'package:cafejari_flutter/ui/state/challenge_state/challenge_state.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';
import 'package:cafejari_flutter/ui/viewmodel/challenge_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ChallengeInfoScreen extends ConsumerWidget {
  const ChallengeInfoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            GoRouter.of(context).goNamed(ScreenRoute.challenge_progress);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling
    );
  }
}
