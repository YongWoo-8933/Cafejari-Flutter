import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/state/leaderboard_state/leaderboard_state.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyPageRanking extends StatelessWidget {
  final LeaderboardState leaderBoardState;

  MyPageRanking({
    super.key,
    required this.leaderBoardState
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.padding_30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('나의 카페지기 순위', style: TextSize.textSize_12),
              // SizedBox(height: 8),
              // Text('나의 이달의 샷', style: TextSize.textSize_12),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(leaderBoardState.myRanking[1].isNotNull? '${leaderBoardState.myRanking[1]}위' : "순위없음", style: TextSize.textSize_bold_16),
              // SizedBox(height: 8),
              // Text('3개', style: TextSize.textSize_bold_16),
            ],
          ),
          SizedBox(width: 30),
          ActionButtonPrimary(
              buttonWidth: 110,
              buttonHeight: 45,
              title: '명예의 전당',
              onPressed: () {GoRouter.of(context).goNamed(ScreenRoute.leaderboard);},
          )
        ],
      )
    );
  }
}
