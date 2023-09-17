import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/core/extension/double.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/app_shadow.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/buttons/x_button.dart';
import 'package:cafejari_flutter/ui/components/custom_snack_bar.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/components/square_alert_dialog.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';
import 'package:cafejari_flutter/ui/util/occupancy_level.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';
import 'package:cafejari_flutter/ui/view_model/map_view_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_core/src/theme/slider_theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';


final _isLoading = StateProvider<bool>((ref) => false);


class OccupancyUpdateDialog extends ConsumerWidget {
  const OccupancyUpdateDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);
    final MapState mapState = ref.watch(mapViewModelProvider);
    final GlobalState globalState = ref.watch(globalViewModelProvider);
    const double sidePadding = 30;
    return Dialog(
      elevation: 0,
      backgroundColor: AppColor.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        padding: const EdgeInsets.all(sidePadding),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      children: [
                        VerticalSpacer(10),
                        Text("혼잡도 등록", style: TextSize.textSize_bold_18),
                      ],
                    ),
                    XButton(
                      buttonSize: 28,
                      onPressed: () => Navigator.of(context).pop(),
                    )
                  ],
                ),
                const VerticalSpacer(4),
                const Text("혼잡도를 등록하고 포인트 받아가세요", style: TextSize.textSize_grey_12),
                const VerticalSpacer(20),
                const _FloorRow(),
                const VerticalSpacer(100),
                _OccupancyUpdateSlider(width: constraints.maxWidth),
                const VerticalSpacer(60),
                Center(
                  child: ActionButtonPrimary(
                    buttonWidth: 280,
                    buttonHeight: 48,
                    title: "등록하기",
                    isLoading: ref.watch(_isLoading),
                    onPressed: () async {
                      if(await mapViewModel.globalViewModel.isNearBy(from: mapState.selectedCafe.latLng, meter: 1000)) {
                        if(globalState.isLoggedIn) {
                          ref.watch(_isLoading.notifier).update((state) => true);
                          if(context.mounted) await mapViewModel.updateOccupancyRateAsUser(context: context);
                          ref.watch(_isLoading.notifier).update((state) => false);
                          if(context.mounted) Navigator.of(context).pop();
                        } else {
                          if(context.mounted) {
                            await showDialog(
                              context: context,
                              builder: (context) => SquareAlertDialog(
                                text: "로그인하고 혼잡도를 등록하면 포인트를 받을 수 있어요. 로그인 페이지로 이동할까요?",
                                negativeButtonText: "그냥 진행",
                                positiveButtonText: "예",
                                onDismiss: () => Navigator.of(context).pop(),
                                onNegativeButtonPress: () async {
                                  ref.watch(_isLoading.notifier).update((state) => true);
                                  await mapViewModel.updateOccupancyRateAsGuest(context: context);
                                  ref.watch(_isLoading.notifier).update((state) => false);
                                  if(context.mounted) Navigator.of(context).pop();
                                },
                                onPositiveButtonPress: () => GoRouter.of(context).goNamed(ScreenRoute.login),
                              )
                            );
                          }
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
            );
          }
        ),
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
                onTap: () {
                  HapticFeedback.lightImpact();
                  mapViewModel.selectCafeFloor(cafeFloor);
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: mapState.selectedCafeFloor.id == cafeFloor.id
                          ? AppColor.secondary
                          : AppColor.white,
                      border: Border.all(color: AppColor.secondary, width: 1)
                  ),
                  width: 54,
                  height: 36.0,
                  child: Center(
                    child: Text(
                      "${cafeFloor.floor}층",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
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

class _OccupancyUpdateSlider extends ConsumerWidget {
  final double width;

  const _OccupancyUpdateSlider({super.key, required this.width});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapState mapState = ref.watch(mapViewModelProvider);
    final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);
    const double thumbWidth = 20;

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: width - thumbWidth,
          height: 10,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              boxShadow: AppShadow.box
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Row(
              children: [
                Container(
                  width: (width - thumbWidth) / 4,
                  height: 10,
                  color: OccupancyLevel.zero().color,
                ),
                Container(
                  width: (width - thumbWidth) / 4,
                  height: 10,
                  color: OccupancyLevel.one().color,
                ),
                Container(
                  width: (width - thumbWidth) / 4,
                  height: 10,
                  color: OccupancyLevel.two().color,
                ),
                Container(
                  width: (width - thumbWidth) / 4,
                  height: 10,
                  color: OccupancyLevel.three().color,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: width,
          child: SfSliderTheme(
            data: SfSliderThemeData().copyWith(
                thumbRadius: thumbWidth,
                tooltipBackgroundColor: AppColor.primary,
                activeTrackHeight: 10,
                inactiveTrackHeight: 10
            ),
            child: SfSlider(
              min: 0.0,
              max: 100.0,
              value: mapState.occupancySliderValue,
              stepSize: 1.0,
              showTicks: false,
              tooltipTextFormatterCallback: (_, str) => "혼잡도 $str%",
              shouldAlwaysShowTooltip: true,
              enableTooltip: true,
              activeColor: AppColor.transparent,
              inactiveColor: AppColor.transparent,
              thumbIcon: Image.asset((mapState.occupancySliderValue/100).toOccupancyLevel().thumbImagePath),
              onChangeStart: (_) => HapticFeedback.lightImpact(),
              onChanged: (dynamic value) => mapViewModel.updateOccupancySliderValue(value),
              onChangeEnd: (_) => HapticFeedback.lightImpact(),
            ),
          ),
        )
      ],
    );
  }
}