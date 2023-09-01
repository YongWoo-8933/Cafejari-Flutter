import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/app_shadow.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_secondary.dart';
import 'package:cafejari_flutter/ui/components/profile_image_editable.dart';
import 'package:cafejari_flutter/ui/components/profile_image_select_grid.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/state/leaderboard_state/leaderboard_state.dart';
import 'package:cafejari_flutter/ui/state/my_page_state/my_page_state.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';
import 'package:cafejari_flutter/ui/view_model/global_view_model.dart';
import 'package:cafejari_flutter/ui/view_model/my_page_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher_string.dart';
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
    Future.delayed(const Duration(seconds: 2), () async {
      await ref.watch(leaderboardViewModelProvider.notifier).refreshRankers();
      await ref.watch(myPageViewModelProvider.notifier).getDefaultProfileImages();
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalState globalState = ref.watch(globalViewModelProvider);
    final GlobalViewModel globalViewModel = ref.watch(globalViewModelProvider.notifier);
    final MyPageState myPageState = ref.watch(myPageViewModelProvider);
    final MyPageViewModel myPageViewModel = ref.watch(myPageViewModelProvider.notifier);
    final LeaderboardState leaderboardState = ref.watch(leaderboardViewModelProvider);

    final Size deviceSize = MediaQuery.of(context).size;
    final double bottomNavBarHeight = ref.watch(bottomNavBarHeightProvider);
    final double bottomNavBarCornerRadius = ref.watch(bottomNavBarCornerRadiusProvider);
    const double sidePadding = 20.0;

    return Container(
      width: deviceSize.width,
      height: deviceSize.height - bottomNavBarHeight + bottomNavBarCornerRadius,
      color: AppColor.grey_0,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                // 검은색 배경
                Container(
                  width: deviceSize.width,
                  height: 275,
                  decoration: const BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50.0),
                      bottomRight: Radius.circular(50.0),
                    ),
                  ),
                ),
                // 프로필 사진 + 닉네임
                Column(
                  children: [
                    const VerticalSpacer(60),
                    ProfileImageEditable(
                      size: 140,
                      imageUrl: globalState.user.imageUrl,
                      onEditButtonClick: () => showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            backgroundColor: AppColor.transparent,
                            child: Container(
                              width: 250,
                              height: 600,
                              decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child: ProfileImageSelectGrid(
                                defaultProfileImages: myPageState.defaultProfileImages,
                                currentProfileImageUrl: globalState.user.imageUrl,
                                onSelect: (index) {
                                  myPageViewModel.updateProfileImage(
                                    profileImageId: myPageState.defaultProfileImages[index].profileImageId
                                  );
                                  Navigator.of(context).pop();
                                }
                              ),
                            ),
                          );
                        }
                      )
                    ),
                    const VerticalSpacer(20),
                    Text(
                      globalState.user.nickname,
                      style: const TextStyle(
                        color: AppColor.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                      )
                    ),
                    const VerticalSpacer(25),
                    _PointCard(width: deviceSize.width - sidePadding * 2)
                  ],
                ),
                // 알림 부분
                Padding(
                  padding: const EdgeInsets.only(top: 40, right: sidePadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text("알림함", style: TextStyle(color: AppColor.white)),
                      IconButton(
                        iconSize: 20,
                        icon: const Icon(CupertinoIcons.bell, color: AppColor.white),
                        onPressed: () => GoRouter.of(context).goNamed(ScreenRoute.push),
                      )
                    ],
                  ),
                )
              ],
            ),
            // 랭킹 부분
            Container(
              padding: const EdgeInsets.all(sidePadding + 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('내 카페지기 순위'),
                  const HorizontalSpacer(12),
                  Text(
                    leaderboardState.myWeekRanking.isNotNull ? "${leaderboardState.myWeekRanking}위 (주간)" :
                      leaderboardState.myMonthRanking.isNotNull ? "${leaderboardState.myMonthRanking}위 (월간)" :
                        leaderboardState.myTotalRanking.isNotNull ? "${leaderboardState.myTotalRanking}위 (종합)" :
                          "순위없음",
                    style: TextSize.textSize_bold_16
                  ),
                  const Expanded(child: HorizontalSpacer(1)),
                  ActionButtonPrimary(
                    buttonWidth: 120,
                    buttonHeight: 48,
                    title: '명예의 전당',
                    onPressed: () => GoRouter.of(context).goNamed(ScreenRoute.leaderboard),
                  )
                ],
              )
            ),
            // 정보 파트
            Container(
              padding: const EdgeInsets.symmetric(horizontal: sidePadding, vertical: sidePadding + 10),
              color: AppColor.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("안내", style: TextSize.textSize_bold_16),
                  const VerticalSpacer(20),
                  _MyPageRow(
                    text: "FAQ",
                    width: deviceSize.width - sidePadding * 2,
                    onPress: () => GoRouter.of(context).goNamed(ScreenRoute.registration)
                  ),
                  _MyPageRow(
                    text: "사용 가이드 북 보기",
                    width: deviceSize.width - sidePadding * 2,
                    onPress: () {GoRouter.of(context).goNamed(ScreenRoute.guide);}
                  ),
                  _MyPageRow(
                    text: "공지 및 이벤트",
                    width: deviceSize.width - sidePadding * 2,
                    onPress: () {GoRouter.of(context).goNamed(ScreenRoute.event);}
                  ),
                  _MyPageRow(
                    text: "업데이트 소식",
                    width: deviceSize.width - sidePadding * 2,
                    onPress: () {GoRouter.of(context).goNamed(ScreenRoute.update);}
                  ),
                  const VerticalSpacer(40),


                  const Text("채널", style: TextSize.textSize_bold_16),
                  const VerticalSpacer(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () => launchUrlString("https://www.instagram.com/cafejari_official/"),
                        child: Row(
                          children: [
                            Image.asset('asset/image/instagram.png', width: 24),
                            const HorizontalSpacer(6),
                            const Text(" 카페자리 인스타")
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => launchUrlString("https://www.instagram.com/cafejari_official/"),
                        child: Row(
                          children: [
                            Image.asset('asset/image/naver_blog.png', width: 36),
                            const HorizontalSpacer(6),
                            const Text("카페자리 블로그")
                          ],
                        ),
                      ),
                    ],
                  ),
                  const VerticalSpacer(40),


                  const Text("약관", style: TextSize.textSize_bold_16),
                  const VerticalSpacer(20),
                  _MyPageRow(text: "FAQ", width: deviceSize.width - sidePadding * 2, onPress: () => GoRouter.of(context).goNamed(ScreenRoute.update)),
                  _MyPageRow(text: "사용 가이드 북 보기", width: deviceSize.width - sidePadding * 2, onPress: () => GoRouter.of(context).goNamed(ScreenRoute.update)),
                  const VerticalSpacer(40),


                  const Text("고객센터", style: TextSize.textSize_bold_16),
                  const VerticalSpacer(20),
                  _MyPageRow(text: "1:1 문의", width: deviceSize.width - sidePadding * 2, onPress: () => GoRouter.of(context).goNamed(ScreenRoute.update)),
                  const VerticalSpacer(80),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => print("가지마!!"),
                        child: const Text("회원탈퇴", style: TextSize.textSize_grey_12),
                      ),
                      const HorizontalSpacer(30),
                      GestureDetector(
                        onTap: () => globalViewModel.logout(),
                        child: const Text("로그아웃", style: TextSize.textSize_grey_12),
                      )
                    ],
                  ),
                  const VerticalSpacer(20)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MyPageRow extends StatelessWidget {
  final String text;
  final double width;
  final VoidCallback? onPress;

  const _MyPageRow({
    required this.text,
    required this.width,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width,
            padding: AppPadding.padding_15,
            color: AppColor.white,
            alignment: Alignment.centerLeft,
            child: Text(text, style: TextSize.textSize_14),
          ),
          const Divider(height: 1, thickness: 1, color: AppColor.myPageDividerGrey)
        ],
      ),
    );
  }
}

class _PointCard extends ConsumerWidget {
  final double width;
  const _PointCard({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalState globalState = ref.watch(globalViewModelProvider);
    const double height = 88;

    return Container(
      width: width,
      decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: AppShadow.box
      ),
      child: Row(
        children: [
          Container(
              width: width / 2,
              height: height,
              color: AppColor.transparent,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("포인트", style: TextSize.textSize_grey_14),
                  const VerticalSpacer(4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${globalState.user.point}", style: TextSize.textSize_bold_20),
                      const HorizontalSpacer(4),
                      const Icon(CupertinoIcons.right_chevron, size: 16),
                    ],
                  ),
                ],
              )
          ),
          Container(
            width: width / 2,
            height: height,
            color: AppColor.transparent,
            alignment: Alignment.center,
            child: ActionButtonSecondary(
              buttonWidth: 128,
              buttonHeight: 45,
              title: "포인트SHOP",
              isClicked: true,
              icon: CupertinoIcons.shopping_cart,
              onPressed: () => GoRouter.of(context).goNamed(ScreenRoute.shop),
            ),
          )
        ],
      ),
    );
  }
}