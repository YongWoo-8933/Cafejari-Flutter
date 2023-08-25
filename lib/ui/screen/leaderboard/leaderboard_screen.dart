
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/components/top_app_bar.dart';
import 'package:cafejari_flutter/ui/screen/leaderboard/component/leaderboard_my_ranking.dart';
import 'package:cafejari_flutter/ui/screen/leaderboard/component/leaderboard_ranking_block.dart';
import 'package:cafejari_flutter/ui/screen/leaderboard/component/leaderboard_top3_block.dart';
import 'package:cafejari_flutter/ui/state/leaderboard_state/leaderboard_state.dart';
import 'package:cafejari_flutter/ui/state/my_page_state/my_page_state.dart';
import 'package:cafejari_flutter/ui/view_model/leaderboard_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LeaderboardScreen extends ConsumerStatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  LeaderboardScreenState createState() => LeaderboardScreenState();
}

class LeaderboardScreenState extends ConsumerState<LeaderboardScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      final viewModel = ref.watch(leaderboardViewModelProvider.notifier);
      await viewModel.refreshRankers();
    });
  }

  @override
  Widget build(BuildContext context) {
    final LeaderboardState leaderboardState = ref.watch(leaderboardViewModelProvider);
    final LeaderboardViewModel leaderboardViewModel = ref.watch(leaderboardViewModelProvider.notifier);

    print("${leaderboardState.myRanking}");
    return Scaffold(
      appBar: BackButtonAppBar(
        backButtonText: "명예의 전당 ",
        backGroundColor: AppColor.white,
        onBack: () => {GoRouter.of(context).pop()},
      ),
      backgroundColor: AppColor.white,
      body: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              if(leaderboardState.rankingType == 0)
                LeaderBoardMyRanking(title: '이번주 카페지기 순위',myRanking: leaderboardState.myRanking[0],)
              else if(leaderboardState.rankingType == 1)
                LeaderBoardMyRanking(title: '이번달 카페지기 순위',myRanking: leaderboardState.myRanking[1])
              else
                LeaderBoardMyRanking(title: '누적 카페지기 순위', myRanking: leaderboardState.myRanking[2]),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.challengeBlock,
                  borderRadius: BorderRadius.circular(30),
                ),
                height: 52,
                padding: AppPadding.padding_7,
                margin: AppPadding.padding_horizon_20,
                child: TabBar(
                  indicator: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    color: AppColor.primary,
                  ),
                  labelColor: AppColor.white,
                  unselectedLabelColor: AppColor.primary,
                  tabs: [
                    Tab(child: Text("주간", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
                    Tab(child: Text("월간", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
                    Tab(child: Text("누적", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
                  ],
                  onTap: (index) {
                    leaderboardViewModel.setRankingType(index);
                  },
                ),
              ),
              Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Container(
                      padding: AppPadding.padding_20,
                      child: Column(
                        children: [
                          if (leaderboardState.weekRankers.isNotEmpty)
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                if (leaderboardState.weekRankers.length >= 2)
                                  Expanded(
                                    flex: 3,
                                    child: LeaderBoardTop3Block(
                                      ranker: leaderboardState.weekRankers[1],
                                      ranking: 2,
                                    ),
                                  ),
                                HorizontalSpacer(15),
                                if (leaderboardState.weekRankers.length >= 1)
                                Expanded(
                                  flex: 4,
                                  child: LeaderBoardTop3Block(
                                    ranker: leaderboardState.weekRankers[0],
                                    ranking: 1,),
                                ),
                                HorizontalSpacer(15),
                                if (leaderboardState.weekRankers.length >= 3)
                                Expanded(
                                  flex: 3,
                                  child: Row(
                                      children: [
                                        LeaderBoardTop3Block(
                                          ranker: leaderboardState.weekRankers[2],
                                          ranking: 3,)
                                      ]
                                  ),
                                ),
                              ],
                            ),
                          VerticalSpacer(30),
                          if (leaderboardState.weekRankers.length > 3)
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: leaderboardState.weekRankers.length - 3,
                              itemBuilder: (context, index) {
                                return LeaderBoardRankingBlock(
                                  ranker: leaderboardState.weekRankers[index + 3],
                                  ranking: index + 4,
                                );
                              },
                            ),
                          if (leaderboardState.weekRankers.isEmpty)
                            Text("랭킹 없음"),
                        ],
                      ),
                    ),

                    Container(
                      padding: AppPadding.padding_20,
                      child: Column(
                        children: [
                          if (leaderboardState.monthRankers.isNotEmpty)
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                if (leaderboardState.monthRankers.length >= 2)
                                  Expanded(
                                    flex: 3,
                                    child: LeaderBoardTop3Block(
                                      ranker: leaderboardState.monthRankers[1],
                                      ranking: 2,
                                    ),
                                  ),
                                HorizontalSpacer(15),
                                if (leaderboardState.monthRankers.length >= 1)
                                  Expanded(
                                    flex: 4,
                                    child: LeaderBoardTop3Block(
                                      ranker: leaderboardState.monthRankers[0],
                                      ranking: 1,),
                                  ),
                                HorizontalSpacer(15),
                                if (leaderboardState.monthRankers.length >= 3)
                                  Expanded(
                                    flex: 3,
                                    child: Row(
                                        children: [
                                          LeaderBoardTop3Block(
                                            ranker: leaderboardState.monthRankers[2],
                                            ranking: 3,)
                                        ]
                                    ),
                                  ),
                              ],
                            ),
                          VerticalSpacer(30),
                          if (leaderboardState.monthRankers.length > 3)
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: leaderboardState.monthRankers.length - 3,
                              itemBuilder: (context, index) {
                                return LeaderBoardRankingBlock(
                                  ranker: leaderboardState.monthRankers[index + 3],
                                  ranking: index + 4,
                                );
                              },
                            ),
                          if (leaderboardState.monthRankers.isEmpty)
                            Text("랭킹 없음"),
                        ],
                      ),
                    ),

                    Container(
                      padding: AppPadding.padding_20,
                      child: Column(
                        children: [
                          if (leaderboardState.totalRankers.isNotEmpty)
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                if (leaderboardState.totalRankers.length >= 2)
                                  Expanded(
                                    flex: 3,
                                    child: LeaderBoardTop3Block(
                                      ranker: leaderboardState.totalRankers[1],
                                      ranking: 2,
                                    ),
                                  ),
                                HorizontalSpacer(15),
                                if (leaderboardState.totalRankers.length >= 1)
                                  Expanded(
                                    flex: 4,
                                    child: LeaderBoardTop3Block(
                                      ranker: leaderboardState.totalRankers[0],
                                      ranking: 1,),
                                  ),
                                HorizontalSpacer(15),
                                if (leaderboardState.totalRankers.length >= 3)
                                  Expanded(
                                    flex: 3,
                                    child: Row(
                                        children: [
                                          LeaderBoardTop3Block(
                                            ranker: leaderboardState.totalRankers[2],
                                            ranking: 3,)
                                        ]
                                    ),
                                  ),
                              ],
                            ),
                          VerticalSpacer(30),
                          if (leaderboardState.totalRankers.length > 3)
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: leaderboardState.totalRankers.length - 3,
                              itemBuilder: (context, index) {
                                return LeaderBoardRankingBlock(
                                  ranker: leaderboardState.totalRankers[index + 3],
                                  ranking: index + 4,
                                );
                              },
                            ),
                          if (leaderboardState.totalRankers.isEmpty)
                            Text("랭킹 없음"),
                        ],
                      ),
                    ),
                  ]
                ),
              ),
            ],
          ),
      ),
    );
  }
}
