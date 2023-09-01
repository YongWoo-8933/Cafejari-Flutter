import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/custom_snack_bar.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/components/square_alert_dialog.dart';
import 'package:cafejari_flutter/ui/screen/map/component/occupancy_update_slider.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';
import 'package:cafejari_flutter/ui/view_model/map_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';
import 'package:go_router/go_router.dart';

class BottomSheetOccupancyUpdate extends ConsumerWidget {
  const BottomSheetOccupancyUpdate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapState mapState = ref.watch(mapViewModelProvider);
    final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);
    final GlobalState globalState = ref.watch(globalViewModelProvider);
    final Size deviceSize = MediaQuery.of(context).size;
    const double sheetPadding = 30;

    return Container(
      padding: AppPadding.padding_30,
      height: 480,
      width: deviceSize.width,
      decoration: const BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 60, 
              height: 6,
              decoration: BoxDecoration(
                color: AppColor.grey_400,
                borderRadius: BorderRadius.circular(3)
              ),
            ),
          ),
          const VerticalSpacer(20),
          const Text("혼잡도 등록", style: TextSize.textSize_bold_20),
          const VerticalSpacer(4),
          const Text("혼잡도를 등록하고 포인트 받아가세요", style: TextSize.textSize_grey_12),
          const VerticalSpacer(20),
          const _FloorRow(),
          const VerticalSpacer(80),
          OccupancyUpdateSlider(width: deviceSize.width - sheetPadding * 2),
          const VerticalSpacer(80),
          Center(
            child: ActionButtonPrimary(
              buttonWidth: 280,
              buttonHeight: 48,
              title: "등록하기",
              onPressed: () async {
                if(await mapViewModel.globalViewModel.isNearBy(from: mapState.selectedCafe.latLng, meter: 1000)) {
                  if(globalState.isLoggedIn) {
                    mapViewModel.updateOccupancyRateAsUser(context: context);
                  } else {
                    await showDialog(
                      context: context,
                      builder: (context) => SquareAlertDialog(
                        text: "로그인하고 혼잡도를 등록하면 포인트를 받을 수 있어요. 로그인 페이지로 이동할까요?",
                        negativeButtonText: "그냥 진행",
                        positiveButtonText: "예",
                        onDismiss: () => Navigator.of(context).pop(),
                        onNegativeButtonPress: () {
                          mapViewModel.updateOccupancyRateAsGuest(context: context);
                        },
                        onPositiveButtonPress: () => GoRouter.of(context).goNamed(ScreenRoute.login),
                      )
                    );
                  }
                } else {
                  mapViewModel.globalViewModel.showSnackBar(
                    content: "카페와의 거리가 너무 멉니다. 위치를 재조정 해주세요",
                    type: SnackBarType.error
                  );
                }
              }
            ) ,
          )
        ],
      ),
    );
  }
}

class _FloorRow extends ConsumerWidget {
  const _FloorRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapState mapState = ref.watch(mapViewModelProvider);
    final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);

    return Row(
      children: [
        ...mapState.selectedCafe.cafeFloors.map((cafeFloor) {
          return Row(
            children: [
              GestureDetector(
                onTap: () => mapViewModel.selectedCafeFloor(cafeFloor),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: mapState.selectedCafeFloor.id == cafeFloor.id
                      ? AppColor.secondary
                      : AppColor.white,
                    border: Border.all(color: AppColor.secondary, width: 1)
                  ),
                  width: 54,
                  height: 40.0,
                  child: Center(
                    child: Text(
                      " ${cafeFloor.floor}층 ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: mapState.selectedCafeFloor.id == cafeFloor.id
                              ? AppColor.white
                              : AppColor.brown_300),
                    ),
                  ),
                ),
              ),
              const HorizontalSpacer(10)
            ],
          );
        }).toList()
      ],
    );
  }
}