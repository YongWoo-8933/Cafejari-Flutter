import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/buttons/question_button.dart';
import 'package:cafejari_flutter/ui/components/cati_blocks.dart';
import 'package:cafejari_flutter/ui/components/cati_dialog.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/screen/my_cafe/component/book_marked_card.dart';
import 'package:cafejari_flutter/ui/screen/my_cafe/component/cafe_recommendation_card.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';
import 'package:cafejari_flutter/ui/util/n_location.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';
import 'package:cafejari_flutter/ui/util/zoom.dart';
import 'package:cafejari_flutter/ui/view_model/global_view_model.dart';
import 'package:cafejari_flutter/ui/view_model/map_view_model.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:go_router/go_router.dart';

final _isEditMode = StateProvider<bool>((ref) => false);

class MyCafeScreen extends ConsumerStatefulWidget {
  const MyCafeScreen({super.key});

  @override
  MyCafeScreenState createState() => MyCafeScreenState();
}

class MyCafeScreenState extends ConsumerState<MyCafeScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
    });
  }

  @override
  Widget build(BuildContext context) {
    final MapState mapState = ref.watch(mapViewModelProvider);
    final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);
    final GlobalViewModel globalViewModel = ref.watch(globalViewModelProvider.notifier);
    final GlobalState globalState = ref.watch(globalViewModelProvider);
    final Size deviceSize = MediaQuery.of(context).size;
    final double bottomNavBarHeight = ref.watch(bottomNavBarHeightProvider);
    final double bottomNavBarCornerRadius = ref.watch(bottomNavBarCornerRadiusProvider);
    const double sidePadding = 20;

    return Container(
      width: deviceSize.width,
      height: deviceSize.height - bottomNavBarHeight + bottomNavBarCornerRadius,
      color: AppColor.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const VerticalSpacer(60),
            // 내 카페 리스트 파트
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: sidePadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("내 카페 PICK", style: TextSize.textSize_bold_16),
                      GestureDetector(
                        onTap: () {
                          HapticFeedback.vibrate();
                          ref.watch(_isEditMode.notifier).update((state) => !ref.watch(_isEditMode));
                        },
                        child: ref.watch(_isEditMode) ?
                          const HorizontalSpacer(1) :
                          const Icon(CupertinoIcons.delete_simple, size: 20)
                      )
                    ],
                  )
                ),
                const VerticalSpacer(20),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Visibility(
                      visible: globalState.isLoggedIn,
                      child: SizedBox(
                        width: deviceSize.width,
                        height: 220,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: sidePadding),
                          itemCount: globalState.user.favoriteCafes.length + 1,
                          itemBuilder: (context, index) {
                            if (index != globalState.user.favoriteCafes.length) {
                              final Cafe cafe = globalState.user.favoriteCafes[index];
                              return Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: BookMarkedCard(
                                  cafe: cafe,
                                  width: 160,
                                  randomImageUrl: mapState.randomCafeImageUrl ?? "",
                                  isEditMode: ref.watch(_isEditMode),
                                  onDelete: () {
                                    HapticFeedback.vibrate();
                                    mapViewModel.updateFavoriteCafeList(cafe: cafe, context: context);
                                  }
                                ),
                              );
                            } else {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 15),
                                child: GestureDetector(
                                  onTap: () async {
                                    if (ref.watch(_isEditMode)) {
                                      HapticFeedback.vibrate();
                                      ref.watch(_isEditMode.notifier).update((state) => false);
                                    } else {
                                      globalViewModel.updateCurrentPageTo(0);
                                      final currentUserCameraPosition = NCameraPosition(
                                          target: NLatLng(
                                              globalState.currentDeviceLocation?.latitude ?? NLocation.sinchon().cameraPosition.target.latitude,
                                              globalState.currentDeviceLocation?.longitude ?? NLocation.sinchon().cameraPosition.target.longitude
                                          ), zoom: Zoom.large
                                      );
                                      mapState.mapController?.updateCamera(
                                          NCameraUpdate.fromCameraPosition(currentUserCameraPosition)
                                      );
                                      mapViewModel.refreshCafes(cameraPosition: currentUserCameraPosition);
                                    }
                                  },
                                  child: DottedBorder(
                                    strokeWidth: 1.8,
                                    color: AppColor.grey_300,
                                    borderType: BorderType.RRect,
                                    dashPattern: const [8.0, 6.0],
                                    radius: const Radius.circular(40),
                                    padding: AppPadding.padding_horizon_20,
                                    child: !ref.watch(_isEditMode) ? const Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          CupertinoIcons.add,
                                          color: AppColor.grey_400,
                                          size: 22,
                                        ),
                                        VerticalSpacer(10),
                                        Text(
                                          "자주가는 카페를\n추가해보세요!",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: AppColor.grey_800
                                          ),
                                        )
                                      ],
                                    ) : const Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "편집이 끝났다면\n눌러주세요",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColor.grey_800
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                    Visibility(
                      visible: !globalState.isLoggedIn,
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const VerticalSpacer(20),
                            const Text(
                              "로그인하고 자주 가는 카페를 \n등록해보세요!",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            const VerticalSpacer(15),
                            ActionButtonPrimary(
                              title: '로그인 하러가기',
                              buttonWidth: 120,
                              buttonHeight: 36,
                              onPressed: () => GoRouter.of(context).goNamed(ScreenRoute.login),
                            ),
                            const VerticalSpacer(20)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const VerticalSpacer(20),
            // Cati 파트
            Container(
              width: deviceSize.width,
              color: AppColor.background,
              padding: const EdgeInsets.all(sidePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalSpacer(10),
                  Row(
                    children: [
                      const Text('내가 선호하는 CATI ', style: TextSize.textSize_bold_16),
                      const HorizontalSpacer(4),
                      QuestionButton(
                        onPressed: () {}
                      )
                    ],
                  ),
                  const VerticalSpacer(30),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () => showCATIDialog(context: context, type: CATIDialogType.my),
                      child: const CATIBlocks(
                        hasOpenness: true,
                        isCoffeeFocused: false,
                        isWorkFriendly: true,
                        is4thBlockClicked: true
                      ),
                    ),
                  ),
                  const VerticalSpacer(20)
                ],
              ),
            ),
            Container(
              width: deviceSize.width,
              padding: const EdgeInsets.all(sidePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalSpacer(10),
                  const Text("이런 카페는 어때요?", style: TextSize.textSize_bold_16),
                  const VerticalSpacer(20),
                  SizedBox(
                    height: 240,
                    width: deviceSize.width,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        CafeRecommendationCard(
                          cafe: mapState.selectedCafe,
                          width: 210,
                          height: 240
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const VerticalSpacer(100),
          ],
        ),
      ),
    );
  }
}
