import 'package:cafejari_flutter/domain/entity/challenge/challenge.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/components/back_button_app_bar.dart';
import 'package:cafejari_flutter/ui/screen/challenge/component/challenge_slider.dart';
import 'package:cafejari_flutter/ui/state/challenge_state/challenge_state.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:go_router/go_router.dart';

class ChallengeProgressScreen extends ConsumerWidget {
  const ChallengeProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ChallengeState challengeState = ref.watch(challengeViewModelProvider);
    final GlobalState globalState = ref.watch(globalViewModelProvider);
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double tableWidth = deviceWidth - 40;
    final Challenger selectedChallenger = globalState.myChallengers.firstWhere(
      (e) => e.challenge.id == challengeState.selectedChallenge.id,
      orElse: () => Challenger.empty()
    );

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
              challenger: selectedChallenger,
            ),
            const VerticalSpacer(30),
            Container(
              padding: AppPadding.padding_20,
              color: AppColor.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("내가 받은 포인트", style: TextSize.textSize_16),
                  const VerticalSpacer(12),
                  const Divider(height: 1, color: AppColor.primary, thickness: 1),
                  Container(
                    color: AppColor.grey_100,
                    height: 48,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildHeaderCell(tableWidth / 3, "적용일자"),
                        _buildHeaderCell(tableWidth / 3, "적용내역"),
                        _buildHeaderCell(tableWidth / 3, "포인트"),
                      ],
                    ),
                  ),
                  ...selectedChallenger.points.map((e) =>
                    Container(
                      color: AppColor.white,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildCell(tableWidth / 3, e.rewardedAt.toString().substring(0, 11)),
                              _buildCell(tableWidth / 3, e.description),
                              _buildCell(tableWidth / 3, "${e.point}p"),
                            ],
                          ),
                          const Divider(height: 1, color: AppColor.grey_100, thickness: 1)
                        ],
                      ),
                    )
                  ).toList()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _buildHeaderCell(double width, String text) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: 48,
      child: Text(text, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
    );
  }

  Container _buildCell(double width, String text) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: 48,
      child: Text(text, style: TextSize.textSize_12),
    );
  }
}
