
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/components/back_button_app_bar.dart';
import 'package:cafejari_flutter/ui/screen/leaderboard/component/leaderboard_my_ranking.dart';
import 'package:cafejari_flutter/ui/screen/leaderboard/component/leaderboard_ranking_block.dart';
import 'package:cafejari_flutter/ui/screen/leaderboard/component/leaderboard_top_ranker_block.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/state/leaderboard_state/leaderboard_state.dart';
import 'package:cafejari_flutter/ui/state/my_page_state/my_page_state.dart';
import 'package:cafejari_flutter/ui/view_model/leaderboard_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class LeaderboardScreen extends ConsumerStatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  LeaderboardScreenState createState() => LeaderboardScreenState();
}

final _refreshController = RefreshController();

class LeaderboardScreenState extends ConsumerState<LeaderboardScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await ref.watch(leaderboardViewModelProvider.notifier).refreshRankers(context: context);
      await ref.watch(globalViewModelProvider.notifier).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final LeaderboardState leaderboardState = ref.watch(leaderboardViewModelProvider);
    final GlobalState globalState = ref.watch(globalViewModelProvider);
    final LeaderboardViewModel leaderboardViewModel = ref.watch(leaderboardViewModelProvider.notifier);

    return Scaffold(
      appBar: BackButtonAppBar(
        backButtonText: "명예의 전당",
        backGroundColor: AppColor.white,
        onBack: () => GoRouter.of(context).pop(),
      ),
      backgroundColor: AppColor.white,
      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: () async {
          await ref.watch(leaderboardViewModelProvider.notifier).refreshRankers(context: context);
          await ref.watch(globalViewModelProvider.notifier).init();
          _refreshController.refreshCompleted();
        },
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              const VerticalSpacer(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Divider(color: AppColor.grey_300, height: 1, indent: 20),
                  const VerticalSpacer(20),
                  SizedBox(
                    height: 90,
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("내 이번주 카페지기 순위"),
                            const VerticalSpacer(10),
                            Text(
                              globalState.myRanking.week.isNotNull ? "${globalState.myRanking.week}위" : "순위 없음",
                              style: TextSize.textSize_bold_16_w700
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("내 이번달 카페지기 순위"),
                            const VerticalSpacer(10),
                            Text(
                                globalState.myRanking.month.isNotNull ? "${globalState.myRanking.month}위" : "순위 없음",
                                style: TextSize.textSize_bold_16_w700
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("내 누적 카페지기 순위"),
                            const VerticalSpacer(10),
                            Text(
                                globalState.myRanking.total.isNotNull ? "${globalState.myRanking.total}위" : "순위 없음",
                                style: TextSize.textSize_bold_16_w700
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const VerticalSpacer(20),
                  const Divider(color: AppColor.grey_300, height: 1, indent: 20),
                ],
              ),
              const VerticalSpacer(30),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.challengeBlock,
                  borderRadius: BorderRadius.circular(31),
                ),
                height: 62,
                padding: AppPadding.padding_7,
                margin: AppPadding.padding_horizon_20,
                child: TabBar(
                  indicator: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    color: AppColor.primary,
                  ),
                  labelColor: AppColor.white,
                  unselectedLabelColor: AppColor.primary,
                  tabs: const [
                    Tab(child: Text("주간", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
                    Tab(child: Text("월간", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
                    Tab(child: Text("누적", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)))
                  ]
                ),
              ),
              const VerticalSpacer(20),
              Expanded(
                child: Container(
                  color: AppColor.grey_0,
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _RankersPart(rankers: leaderboardState.weekRankers),
                      _RankersPart(rankers: leaderboardState.monthRankers),
                      _RankersPart(rankers: leaderboardState.totalRankers),
                    ]
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RankersPart extends StatelessWidget {
  final PartialUsers rankers;
  const _RankersPart({super.key, required this.rankers});

  @override
  Widget build(BuildContext context) {
    const double firstRankerWidth = 120;
    const double firstRankerHeight = 200;
    const double otherRankerWidth = firstRankerWidth * 0.85;
    const double otherRankerHeight = firstRankerHeight * 0.85;
    List<Widget> topRankers = [];
    switch(rankers.length) {
      case 0:
        topRankers.add(
          Container(
            height: firstRankerHeight,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset("asset/image/icon_empty.png", width: 100),
                const VerticalSpacer(20),
                const Text("아직 산정된 랭킹이 없어요", style: TextSize.textSize_16,),
              ],
            ),
          )
        );
      case 1:
        topRankers.add(
          LeaderBoardTopRankerBlock(
            ranker: rankers[0],
            ranking: 1,
            width: firstRankerWidth,
            height: firstRankerHeight,
          )
        );
      case 2:
        topRankers.add(
          LeaderBoardTopRankerBlock(
            ranker: rankers[0],
            ranking: 1,
            width: firstRankerWidth,
            height: firstRankerHeight,
          )
        );
        topRankers.add(const HorizontalSpacer(10));
        topRankers.add(
          LeaderBoardTopRankerBlock(
            ranker: rankers[1],
            ranking: 2,
            width: otherRankerWidth,
            height: otherRankerHeight,
          )
        );
      default:
        topRankers.add(
          LeaderBoardTopRankerBlock(
            ranker: rankers[1],
            ranking: 2,
            width: otherRankerWidth,
            height: otherRankerHeight,
          )
        );
        topRankers.add(const HorizontalSpacer(10));
        topRankers.add(
          LeaderBoardTopRankerBlock(
            ranker: rankers[0],
            ranking: 1,
            width: firstRankerWidth,
            height: firstRankerHeight,
          )
        );
        topRankers.add(const HorizontalSpacer(10));
        topRankers.add(
          LeaderBoardTopRankerBlock(
            ranker: rankers[2],
            ranking: 3,
            width: otherRankerWidth,
            height: otherRankerHeight,
          )
        );
    }
    return Column(
      children: [
        const VerticalSpacer(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: topRankers,
        ),
        const VerticalSpacer(20),
        Visibility(
          visible: rankers.length >= 3,
          child: Expanded(
            child: Container(
              color: AppColor.white,
              child: ListView.builder(
                shrinkWrap: true,
                padding: AppPadding.padding_10,
                itemCount: rankers.length >= 3 ? rankers.length - 3 : 0,
                itemBuilder: (context, index) {
                  return LeaderBoardRankingBlock(
                    ranker: rankers[index + 3],
                    ranking: index + 4,
                  );
                },
              ),
            ),
          )
        ),
      ],
    );
  }
}

