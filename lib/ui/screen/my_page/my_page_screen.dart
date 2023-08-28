
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/screen/my_page/component/my_page_block.dart';
import 'package:cafejari_flutter/ui/screen/my_page/component/my_page_cati.dart';
import 'package:cafejari_flutter/ui/screen/my_page/component/my_page_image.dart';
import 'package:cafejari_flutter/ui/screen/my_page/component/my_page_point.dart';
import 'package:cafejari_flutter/ui/screen/my_page/component/my_page_ranking.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/state/leaderboard_state/leaderboard_state.dart';
import 'package:cafejari_flutter/ui/state/my_page_state/my_page_state.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';
import 'package:cafejari_flutter/ui/view_model/my_page_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyPageScreen extends ConsumerStatefulWidget {
  const MyPageScreen({super.key});

  @override
  MyPageScreenState createState() => MyPageScreenState();
}

class MyPageScreenState extends ConsumerState<MyPageScreen> {
  WebViewController webViewController = WebViewController();


  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      final viewModel = ref.watch(myPageViewModelProvider.notifier);
      final leaderBoardViewModel = ref.watch(leaderboardViewModelProvider.notifier);
      await viewModel.refreshUser();
      final MyPageState myPageState = ref.watch(myPageViewModelProvider);
      await leaderBoardViewModel.setMyRanking(myPageState.user);
    });
  }

  @override
  Widget build(BuildContext context) {
    final MyPageState myPageState = ref.watch(myPageViewModelProvider);
    final GlobalState globalState = ref.watch(globalViewModelProvider);
    final LeaderboardState leaderboardState = ref.watch(leaderboardViewModelProvider);
    final MyPageViewModel myPageViewModel = ref.watch(myPageViewModelProvider.notifier);
    final Size deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        actions: <Widget>[
          IconButton(
            icon: Icon(CupertinoIcons.bell, color: AppColor.white),
            onPressed: () {
              GoRouter.of(context).goNamed(ScreenRoute.push);
            },
          ),
        ],
      ),
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: deviceSize.width,
              height: 180,
              decoration: const BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(70.0),
                  bottomRight: Radius.circular(70.0),
                ),
              ),
            ),
            Column(
              children: [
                MyPageImage(),
                SizedBox(height: 13),
                Text("${globalState.user.nickname}", style: TextSize.textSize_white_16),
                SizedBox(height: 13),
                MyPagePoint(),
                MyPageCATI(),
                MyPageRanking(leaderBoardState: leaderboardState),
                Container(
                  padding: AppPadding.padding_horizon_30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("안내", style: TextSize.textSize_bold_16),
                      SizedBox(height: 10),
                      MyPageBlock(title: "FAQ", onPressed: () {GoRouter.of(context).goNamed(ScreenRoute.faq);},),
                      MyPageBlock(title: "사용 가이드 북 보기", onPressed: () {GoRouter.of(context).goNamed(ScreenRoute.login);},),
                      MyPageBlock(title: "공지 및 이벤트", onPressed: () => GoRouter.of(context).goNamed(ScreenRoute.appPermission),),
                      MyPageBlock(title: "업데이트 소식"),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: AppPadding.padding_horizon_30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("채널", style: TextSize.textSize_bold_16),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Image.asset('asset/image/instagram.png'),
                              Text(" 카페자리 인스타", style: TextSize.textSize_14)
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset('asset/image/naver_blog.png'),
                              Text(" 카페자리 블로그", style: TextSize.textSize_14)
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: AppPadding.padding_horizon_30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("약관", style: TextSize.textSize_bold_16),
                      SizedBox(height: 10),
                      MyPageBlock(title: "이용약관"),
                      MyPageBlock(title: "개인정보처리방침"),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: AppPadding.padding_horizon_30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("고객센터", style: TextSize.textSize_bold_16),
                      SizedBox(height: 10),
                      MyPageBlock(title: "1:1문의"),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}