
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/state/leaderboard_state/leaderboard_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LeaderBoardMyRanking extends ConsumerWidget {
  final String title;
  final int? myRanking;

  const LeaderBoardMyRanking({
    required this.title,
    this.myRanking,
    Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final LeaderboardState leaderboardState = ref.watch(leaderboardViewModelProvider);

    return Container(
      padding: AppPadding.padding_20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Divider(color: AppColor.grey_300, height: 1),
          VerticalSpacer(30),
          Column(
            children: [
              Text(title, style: TextSize.textSize_12),
              VerticalSpacer(10),
              Text(myRanking.isNotNull ? "${myRanking}위" : "순위 없음", style: TextSize.textSize_bold_16_w700)
            ],
          ),
          VerticalSpacer(25),
          Divider(color: AppColor.grey_300, height: 1),
        ],
      ),
    );
  }
}