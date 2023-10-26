import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/components/back_button_app_bar.dart';
import 'package:cafejari_flutter/ui/screen/challenge/component/challenge_record.dart';
import 'package:cafejari_flutter/ui/screen/challenge/component/challenge_slider.dart';
import 'package:cafejari_flutter/ui/state/challenge_state/challenge_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:go_router/go_router.dart';

class ChallengeProgressScreen extends ConsumerWidget {
  const ChallengeProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ChallengeState challengeState = ref.watch(challengeViewModelProvider);

    return Scaffold(
      appBar: BackButtonAppBar(
        backGroundColor: AppColor.white,
        backButtonText: "챌린지 진행상황",
        onBack: GoRouter.of(context).pop,
      ),
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const VerticalSpacer(30),
            ChallengeSlider(
              challenge: challengeState.selectedChallenge,
              challenger: challengeState.selectedChallenger,
            ),
            const VerticalSpacer(30),
            ChallengeRecord(challenger: challengeState.selectedChallenger)
          ],
        ),
      ),
    );
  }
}
