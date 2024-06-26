import 'package:cafejari_flutter/core/app_version.dart';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/full_width_banner_ad.dart';
import 'package:cafejari_flutter/ui/components/profile_image_editable.dart';
import 'package:cafejari_flutter/ui/components/profile_image_select_grid.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/components/square_alert_dialog.dart';
import 'package:cafejari_flutter/ui/screen/my_page/component/my_page_row.dart';
import 'package:cafejari_flutter/ui/screen/my_page/component/nickname_editor_dialog.dart';
import 'package:cafejari_flutter/ui/screen/my_page/component/point_card.dart';
import 'package:cafejari_flutter/ui/screen/my_page/component/user_migration_dialog.dart';
import 'package:cafejari_flutter/ui/screen/my_page/component/withdrawal_dialog.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/state/my_page_state/my_page_state.dart';
import 'package:cafejari_flutter/ui/util/ad_manager.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';
import 'package:cafejari_flutter/ui/util/web_view_route.dart';
import 'package:cafejari_flutter/ui/view_model/global_view_model.dart';
import 'package:cafejari_flutter/ui/view_model/my_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:go_router/go_router.dart';
import 'package:kakao_flutter_sdk_talk/kakao_flutter_sdk_talk.dart';

class MyPageScreen extends ConsumerStatefulWidget {
  const MyPageScreen({super.key});

  @override
  MyPageScreenState createState() => MyPageScreenState();
}

class MyPageScreenState extends ConsumerState<MyPageScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalState globalState = ref.watch(globalViewModelProvider);
    final GlobalViewModel globalViewModel = ref.watch(globalViewModelProvider.notifier);
    final MyPageState myPageState = ref.watch(myPageViewModelProvider);
    final MyPageViewModel myPageViewModel = ref.watch(myPageViewModelProvider.notifier);

    final Size deviceSize = MediaQuery.of(context).size;
    final double bottomNavBarHeight = ref.watch(bottomNavBarHeightProvider);
    final double bottomNavBarCornerRadius = ref.watch(bottomNavBarCornerRadiusProvider);
    const double sidePadding = 20.0;

    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: deviceSize.width,
              height: (deviceSize.height - bottomNavBarHeight + bottomNavBarCornerRadius) / 2,
              color: AppColor.primary,
              child: const HorizontalSpacer(1),
            ),
            Container(
              width: deviceSize.width,
              height: (deviceSize.height - bottomNavBarHeight + bottomNavBarCornerRadius) / 2,
              color: AppColor.white,
              child: const HorizontalSpacer(1),
            ),
          ],
        ),
        SizedBox(
          width: deviceSize.width,
          height: deviceSize.height - bottomNavBarHeight + bottomNavBarCornerRadius,
          child: SingleChildScrollView(
            child: Container(
              color: AppColor.grey_0,
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
                          Visibility(
                            visible: globalState.isLoggedIn,
                            child: ProfileImageEditable(
                              size: 140,
                              imageUrl: globalState.user.imageUrl,
                              onEditButtonClick: () => showDialog(
                                context: context,
                                builder: (_) {
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
                                            profileImageId: myPageState.defaultProfileImages[index].profileImageId,
                                            context: context
                                          );
                                          Navigator.pop(context);
                                        }
                                      ),
                                    ),
                                  );
                                }
                              )
                            ),
                          ),
                          Visibility(
                            visible: !globalState.isLoggedIn,
                            child: Container(
                              alignment: Alignment.center,
                              height: 140,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const VerticalSpacer(24),
                                  const Text(
                                    "카페자리에 오신 것을 환영합니다",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: AppColor.white
                                    ),
                                  ),
                                  const VerticalSpacer(6),
                                  const Text(
                                    "로그인하시고, 많은 혜택을 누려보세요",
                                    textAlign: TextAlign.center,
                                    style: TextSize.textSize_grey_12,
                                  ),
                                  const VerticalSpacer(15),
                                  TextButton(
                                    onPressed: () => GoRouter.of(context).goNamed(ScreenRoute.login),
                                    child: const Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "로그인 하러가기 ",
                                          style: TextStyle(
                                            color: AppColor.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15
                                          ),
                                        ),
                                        HorizontalSpacer(4),
                                        Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: AppColor.white,
                                          size: 16,
                                        )
                                      ],
                                    )
                                  )
                                ],
                              ),
                            )
                          ),
                          const VerticalSpacer(20),
                          Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const HorizontalSpacer(10),
                                Text(
                                  globalState.isLoggedIn ? globalState.user.nickname : "",
                                  style: const TextStyle(
                                    color: AppColor.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600
                                  )
                                ),
                                Visibility(
                                  visible: globalState.isLoggedIn,
                                  child: Row(
                                    children: [
                                      const HorizontalSpacer(8),
                                      GestureDetector(
                                        onTap: () => showDialog(
                                          context: context,
                                          builder: (context) => const NicknameEditorDialog()
                                        ),
                                        child: const Icon(
                                          Icons.edit,
                                          color: AppColor.white,
                                          size: 16,
                                        ),
                                      ),
                                    ],
                                  )
                                )
                              ],
                            ),
                          ),
                          const VerticalSpacer(25),
                          PointCard(width: deviceSize.width - sidePadding * 2)
                        ],
                      ),
                      // 알림 부분
                      Visibility(
                        visible: globalState.isLoggedIn,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40, right: sidePadding),
                          child: GestureDetector(
                            onTap: () => GoRouter.of(context).goNamed(ScreenRoute.push),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Text("알림함", style: TextStyle(color: AppColor.white)),
                                  const HorizontalSpacer(8),
                                  Image.asset(
                                    width: 24,
                                    globalState.myPushes.any((e) => !e.isRead) ?
                                      "asset/image/icon_bell_badge.png" :
                                      "asset/image/icon_bell.png",
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  // 랭킹 부분
                  Container(
                    padding: const EdgeInsets.all(sidePadding + 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('내 카페지기 순위'),
                        const HorizontalSpacer(12),
                        Text(
                          globalState.myRanking.week.isNotNull ? "${globalState.myRanking.week!}위 (주간)" :
                            globalState.myRanking.month.isNotNull ? "${globalState.myRanking.month!}위 (월간)" :
                              globalState.myRanking.total.isNotNull ? "${globalState.myRanking.total!}위 (종합)" :
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
                  FullWidthBannerAd(bannerAd: AdManager.instance.myPageScreenBannerAd),
                  // 정보 파트
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: sidePadding, vertical: sidePadding + 10),
                    color: AppColor.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("안내", style: TextSize.textSize_bold_16),
                        const VerticalSpacer(20),
                        MyPageRow(
                          text: "FAQ",
                          width: deviceSize.width - sidePadding * 2,
                          onPress: () => globalViewModel.navigateToWebView(
                            route: WebViewRoute.faq(),
                            context: context
                          )
                        ),
                        MyPageRow(
                          text: "사용 가이드 북 보기",
                          width: deviceSize.width - sidePadding * 2,
                          onPress: () => globalViewModel.navigateToWebView(
                            route: WebViewRoute.guide(),
                            context: context
                          )
                        ),
                        MyPageRow(
                          text: "공지사항",
                          width: deviceSize.width - sidePadding * 2,
                          onPress: () => globalViewModel.navigateToWebView(
                            route: WebViewRoute.notification(),
                            context: context
                          )
                        ),
                        MyPageRow(
                          text: "업데이트 소식",
                          width: deviceSize.width - sidePadding * 2,
                          onPress: () => globalViewModel.navigateToWebView(
                            route: WebViewRoute.update(),
                            context: context
                          )
                        ),
                        const VerticalSpacer(40),


                        const Text("채널", style: TextSize.textSize_bold_16),
                        const VerticalSpacer(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () => globalViewModel.navigateToWebView(
                                route: WebViewRoute.insta(),
                                context: context
                              ),
                              child: Row(
                                children: [
                                  Image.asset('asset/image/instagram.png', width: 24),
                                  const HorizontalSpacer(6),
                                  const Text(" 카페자리 인스타")
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () => globalViewModel.navigateToWebView(
                                route: WebViewRoute.blog(),
                                context: context
                              ),
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
                        MyPageRow(
                          text: "서비스 이용약관",
                          width: deviceSize.width - sidePadding * 2,
                          onPress: () => globalViewModel.navigateToWebView(
                            route: WebViewRoute.tos(),
                            context: context
                          )
                        ),
                        MyPageRow(
                          text: "개인정보 처리방침",
                          width: deviceSize.width - sidePadding * 2,
                          onPress: () => globalViewModel.navigateToWebView(
                            route: WebViewRoute.privacyPolicy(),
                            context: context
                          )
                        ),
                        const VerticalSpacer(40),


                        const Text("고객센터", style: TextSize.textSize_bold_16),
                        const VerticalSpacer(20),
                        MyPageRow(
                          text: "1:1 문의",
                          width: deviceSize.width - sidePadding * 2,
                          onPress: () async {
                            Uri url = await TalkApi.instance.chatChannelUrl('_xbxnxaRG');
                            await launchBrowserTab(url);
                          }
                        ),
                        MyPageRow(
                          text: "사용자 정보 이전",
                          width: deviceSize.width - sidePadding * 2,
                          onPress: () => showDialog(
                              context: context,
                              builder: (_) => const UserMigrationDialog()
                          )
                        ),
                        const VerticalSpacer(40),

                        Visibility(
                          visible: globalState.isLoggedIn,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () => showDialog(
                                    context: context,
                                    builder: (_) => const WithdrawalDialog()
                                ),
                                child: const Text("회원탈퇴", style: TextSize.textSize_grey_12),
                              ),
                              const HorizontalSpacer(30),
                              GestureDetector(
                                onTap: () {
                                  showDialog(context: context, builder: (_) {
                                    return SquareAlertDialog(
                                      text: "정말 로그아웃 하시겠어요?",
                                      negativeButtonText: "예",
                                      positiveButtonText: "아니오",
                                      onDismiss: () => Navigator.of(context).pop(),
                                      onNegativeButtonPress: () => globalViewModel.logout(context: context),
                                      onPositiveButtonPress: () {}
                                    );
                                  });
                                },
                                child: const Text("로그아웃", style: TextSize.textSize_grey_12),
                              ),
                            ],
                          ),
                        ),
                        const VerticalSpacer(120),

                        const Text(
                          "ver ${LocalAppVersion.major}.${LocalAppVersion.minor}.${LocalAppVersion.patch}\n주식회사 자리매김\n서울특별시 이화여대 1길 33\n010-7607-4842",
                          style: TextStyle(
                            color: AppColor.grey_300,
                            fontSize: 12
                          )
                        ),
                        const VerticalSpacer(40),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}