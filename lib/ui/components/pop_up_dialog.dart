import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/domain/entity/challenge/challenge.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/cached_network_image.dart';
import 'package:cafejari_flutter/ui/components/page_view_dot_indicator.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/state/challenge_state/challenge_state.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';
import 'package:cafejari_flutter/ui/util/web_view_route.dart';
import 'package:cafejari_flutter/ui/view_model/challenge_view_model.dart';
import 'package:cafejari_flutter/ui/view_model/global_view_model.dart';
import 'package:cafejari_flutter/ui/view_model/map_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kakao_flutter_sdk_talk/kakao_flutter_sdk_talk.dart';
import 'package:url_launcher/url_launcher.dart';

final _currentPageIndex = StateProvider((ref) => 0);
final _pageController = StateProvider((ref) => PageController(initialPage: 0));

class PopUpDialog extends ConsumerWidget {

  const PopUpDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size deviceSize = MediaQuery.of(context).size;
    final GlobalState globalState = ref.watch(globalViewModelProvider);
    final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);
    final ChallengeState challengeState = ref.watch(challengeViewModelProvider);
    final ChallengeViewModel challengeViewModel = ref.watch(challengeViewModelProvider.notifier);
    const double dialogSidePadding = 20;
    const double closeButtonWidth = 96;
    const double buttonHeight = 48;
    const double buttonSidePadding = 8;
    final double ignoreForDayButtonWidth = deviceSize.width - dialogSidePadding * 2 - buttonSidePadding * 3 - closeButtonWidth;

    return Dialog(
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: dialogSidePadding),
      backgroundColor: AppColor.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: deviceSize.width - dialogSidePadding * 2,
                height: deviceSize.width - dialogSidePadding * 2,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    PageView(
                      controller: ref.watch(_pageController),
                      onPageChanged: (value) => ref.watch(_currentPageIndex.notifier).update((state) => value),
                      children: globalState.popUps.map((e) {
                        return GestureDetector(
                          onTap: () async {
                            final popUp = globalState.popUps[ref.watch(_currentPageIndex)];
                            Navigator.of(context).pop();
                            if(popUp.cafeId.isNotNull) {
                              mapViewModel.globalViewModel.updateCurrentPageTo(PageType.map.index);
                              await mapViewModel.moveToCafeWithRefresh(cafeId: popUp.cafeId!);
                            } else if (popUp.challengeId.isNotNull) {
                              mapViewModel.globalViewModel.updateCurrentPageTo(PageType.challenge.index);
                              final Challenge challenge = challengeState.availableChallenges.firstWhere((e) => e.id == popUp.challengeId);
                              challengeViewModel.selectChallenge(challenge);
                              GoRouter.of(context).goNamed(ScreenRoute.challengeInfo);
                            } else if (popUp.webViewUrl.isNotNull) {
                              mapViewModel.globalViewModel.navigateToWebView(
                                route: WebViewRoute.custom(title: popUp.title, url: popUp.webViewUrl!),
                                context: context
                              );
                            } else if (popUp.externalUrl.isNotNull) {
                              if (await canLaunchUrl(Uri.parse(popUp.externalUrl!))) {
                                await launchUrl(Uri.parse(popUp.externalUrl!));
                              }
                            } else if (popUp.inAppRouteTargetIndex.isNotNull) {
                              if(popUp.inAppRouteTargetIndex == 4) {
                                Uri url = await TalkApi.instance.chatChannelUrl('_xbxnxaRG');
                                await launchBrowserTab(url);
                              } else {
                                mapViewModel.globalViewModel.updateCurrentPageTo(popUp.inAppRouteTargetIndex!);
                              }
                            }
                          },
                          child: CustomCachedNetworkImage(
                            imageUrl: globalState.popUps.isNotEmpty ? globalState.popUps[ref.watch(_currentPageIndex)].imageUrl : "",
                            width: deviceSize.width - dialogSidePadding * 2,
                          )
                        );
                      }).toList(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: PageViewDotIndicator(
                        dotCount: globalState.popUps.length,
                        selectedDotIndex: ref.watch(_currentPageIndex),
                        selectedDotColor: AppColor.secondary.withOpacity(0.8),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: buttonSidePadding, vertical: 12),
                child: Row(
                  children: [
                    SizedBox(
                      width: ignoreForDayButtonWidth,
                      height: buttonHeight,
                      child: ElevatedButton(
                        onPressed: () async {
                          await mapViewModel.globalViewModel.setLastPopUpTime();
                          if(context.mounted) Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          side: const BorderSide(
                            color: AppColor.grey_300,
                            width: 1,
                          )
                        ),
                        child: const Text(
                          "오늘 하루 보지 않기",
                          style: TextSize.textSize_14
                        ),
                      ),
                    ),
                    const HorizontalSpacer(buttonSidePadding),
                    ActionButtonPrimary(
                      buttonWidth: closeButtonWidth,
                      buttonHeight: buttonHeight,
                      title: "닫기",
                      onPressed: () => Navigator.of(context).pop()
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


