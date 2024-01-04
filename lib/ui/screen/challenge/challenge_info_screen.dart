import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/back_button_app_bar.dart';
import 'package:cafejari_flutter/ui/screen/challenge/component/challenge_information.dart';
import 'package:cafejari_flutter/ui/state/challenge_state/challenge_state.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';
import 'package:cafejari_flutter/ui/util/web_view_route.dart';
import 'package:cafejari_flutter/ui/view_model/challenge_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final _isLoading = StateProvider<bool>((ref) => false);

class ChallengeInfoScreen extends ConsumerStatefulWidget {
  const ChallengeInfoScreen({super.key});

  @override
  ChallengeInfoScreenState createState() => ChallengeInfoScreenState();
}


class ChallengeInfoScreenState extends ConsumerState<ChallengeInfoScreen> {

  @override
  void initState() {
    super.initState();
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
        backButtonText: "챌린지 상세",
        onBack: GoRouter.of(context).pop,
      ),
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: ChallengeInformation(
          challenge: challengeState.selectedChallenge,
          onChallengeClick: () => challengeViewModel.globalViewModel.navigateToWebView(
            route: WebViewRoute.custom(
              title: challengeState.selectedChallenge.name,
              url: challengeState.selectedChallenge.url
            ),
            context: context
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ActionButtonPrimary(
          buttonWidth: deviceSize.width - 60,
          buttonHeight: 48,
          title: globalState.isLoggedIn ? (isParticipated ? "진행상황" : "참여하기") : "로그인 후 참여가능",
          isLoading: ref.watch(_isLoading),
          onPressed: globalState.isLoggedIn ? () {
            if (isParticipated) {
              GoRouter.of(context).goNamed(ScreenRoute.challengeProgress);
            } else {
              ref.watch(_isLoading.notifier).update((state) => true);
              challengeViewModel.participate(challenge: challengeState.selectedChallenge, context: context);
              ref.watch(_isLoading.notifier).update((state) => false);
            }
          } : null,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
