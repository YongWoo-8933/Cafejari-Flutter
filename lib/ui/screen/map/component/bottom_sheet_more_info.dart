import 'package:cafejari_flutter/core/extension/int.dart';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/components/square_alert_dialog.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';
import 'package:go_router/go_router.dart';

class BottomSheetMoreInfo extends ConsumerWidget {
  final double sidePadding;

  const BottomSheetMoreInfo({Key? key, required this.sidePadding}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalState globalState = ref.watch(globalViewModelProvider);
    final MapState mapState = ref.watch(mapViewModelProvider);
    List<String> restroomDescriptionList = [];
    for (var floor in mapState.selectedCafe.cafeFloors) {
      if(floor.restroom.isNotNull) {
        restroomDescriptionList.add("${floor.floor.toFloor()}층: ${floor.restroom}");
      }
    }
    const double lineSpacing = 6;
    const double letterSpacing = 8;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: sidePadding, vertical: 25),
      color: AppColor.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("상세 정보", style: TextSize.textSize_bold_16),
          const VerticalSpacer(20),
          Visibility(
            visible: mapState.selectedCafe.openingHour.isNotNull,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('asset/image/icon_watch.png', width: 20, height: 20),
                const HorizontalSpacer(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text("월요일", style: TextSize.textSize_grey_14),
                        const HorizontalSpacer(letterSpacing),
                        Text(mapState.selectedCafe.openingHour?.mon ?? "")
                      ],
                    ),
                    const VerticalSpacer(lineSpacing),
                    Row(
                      children: [
                        const Text("화요일", style: TextSize.textSize_grey_14),
                        const HorizontalSpacer(letterSpacing),
                        Text(mapState.selectedCafe.openingHour?.tue ?? "")
                      ],
                    ),
                    const VerticalSpacer(lineSpacing),
                    Row(
                      children: [
                        const Text("수요일", style: TextSize.textSize_grey_14),
                        const HorizontalSpacer(letterSpacing),
                        Text(mapState.selectedCafe.openingHour?.wed ?? "")
                      ],
                    ),
                    const VerticalSpacer(lineSpacing),
                    Row(
                      children: [
                        const Text("목요일", style: TextSize.textSize_grey_14),
                        const HorizontalSpacer(letterSpacing),
                        Text(mapState.selectedCafe.openingHour?.thu ?? "")
                      ],
                    ),
                    const VerticalSpacer(lineSpacing),
                    Row(
                      children: [
                        const Text("금요일", style: TextSize.textSize_grey_14),
                        const HorizontalSpacer(letterSpacing),
                        Text(mapState.selectedCafe.openingHour?.fri ?? "")
                      ],
                    ),
                    const VerticalSpacer(lineSpacing),
                    Row(
                      children: [
                        const Text("토요일", style: TextSize.textSize_grey_14),
                        const HorizontalSpacer(letterSpacing),
                        Text(mapState.selectedCafe.openingHour?.sat ?? "")
                      ],
                    ),
                    const VerticalSpacer(lineSpacing),
                    Row(
                      children: [
                        const Text("일요일", style: TextSize.textSize_grey_14),
                        const HorizontalSpacer(letterSpacing),
                        Text(mapState.selectedCafe.openingHour?.sun ?? "")
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          const VerticalSpacer(25),
          Visibility(
            visible: restroomDescriptionList.isNotEmpty,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('asset/image/icon_tissue_grey.png'),
                const HorizontalSpacer(10),
                const Text("화장실 ", style: TextSize.textSize_grey_14),
                const HorizontalSpacer(letterSpacing - 2),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...restroomDescriptionList.map((e) {
                      return Column(
                        children: [Text(e), const VerticalSpacer(lineSpacing)],
                      );
                    }).toList()
                  ],
                )
              ],
            ),
          ),
          const VerticalSpacer(30),
          Container(
            alignment: Alignment.center,
            child: SizedBox(
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  if (globalState.isLoggedIn) {
                    GoRouter.of(context).goNamed(ScreenRoute.cafeInfoModification);
                  } else {
                    showDialog(context: context, builder: (_) => SquareAlertDialog(
                        text: "카페 정보 수정은 로그인 후에 가능합니다. 로그인 페이지로 이동할까요?",
                        negativeButtonText: "아니오",
                        positiveButtonText: "네",
                        onDismiss: () => Navigator.of(context).pop(),
                        onNegativeButtonPress: () {},
                        onPositiveButtonPress: () => GoRouter.of(context).goNamed(ScreenRoute.login)
                    ));
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primary,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("asset/image/icon_square_edit.png", width: 20, height: 20),
                      const HorizontalSpacer(4),
                      const Text(
                        "매장정보 제보하기",
                        style: TextSize.textSize_white_14,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const VerticalSpacer(80)
        ],
      ),
    );
  }
}

