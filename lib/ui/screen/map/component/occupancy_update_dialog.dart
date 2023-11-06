import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/core/extension/double.dart';
import 'package:cafejari_flutter/core/extension/int.dart';
import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
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
    String pointText = "지금 혼잡도 등록시 ${mapState.selectedCafeFloor.pointPrediction}P 획득!";
    Color pointTextColor = AppColor.grey_500;
    bool isUpdatePossible = true;
    if(globalState.myTodayUpdates.containsKey(mapState.selectedCafeFloor.id)) {
      // 오늘 이 카페에서 업데이트를 한적있음
      final OccupancyRateUpdates todayThisCafeUpdates = globalState.myTodayUpdates[mapState.selectedCafeFloor.id]!;
      if (globalState.isLoggedIn) {
        // 로그인 유저
        if(todayThisCafeUpdates.last.point == 0) {
          // 해당 카페 업데이트가 스택 한도초과 업데이트임
          final now = DateTime.now();
          final Duration difference = now.difference(todayThisCafeUpdates.first.update);
          final int minutesDifference = difference.inMinutes;
          if (minutesDifference.abs() <= 10) {
            // 최근 업데이트로부터 아직 10분이 안지남
            isUpdatePossible = false;
            pointText = "${10 - minutesDifference.abs()}분 후 혼잡도 등록 가능";
            pointTextColor = AppColor.error;
          } else {
            pointText = "현재 등급에서는 하루 ${globalState.user.grade.stackRestrictionPerDay}개의 층에서만 포인트 획득이 가능해요";
            pointTextColor = AppColor.secondary;
          }
        } else {
          // 스택 한도 초과 업데이트가 아님
          final now = DateTime.now();
          final Duration difference = now.difference(todayThisCafeUpdates.first.update);
          final int minutesDifference = difference.inMinutes;
          if(todayThisCafeUpdates.length >= globalState.user.grade.updateRestrictionPerCafe) {
            // 오늘 할 수 있는 업데이트 횟수 초과
            if (minutesDifference.abs() <= 10) {
              // 최근 업데이트로부터 아직 10분이 안지남
              isUpdatePossible = false;
              pointText = "${10 - minutesDifference.abs()}분 후 혼잡도 등록가능";
              pointTextColor = AppColor.error;
            } else {
              pointText = "오늘 해당 층에서 얻을 수 있는 포인트를 모두 획득하셨어요!\n현재 등급의 포인트 지급 횟수: 층당 ${globalState.user.grade.updateRestrictionPerCafe}회";
              pointTextColor = AppColor.secondary;
            }
          } else {
            // 오늘 업데이트 아직 가능
            if (minutesDifference.abs() <= 10) {
              // 최근 업데이트로부터 아직 10분이 안지남
              isUpdatePossible = false;
              pointText = "${10 - minutesDifference.abs()}분 후 혼잡도 등록시 ${mapState.selectedCafeFloor.pointPrediction}P 획득!";
              pointTextColor = AppColor.error;
            }
          }
        }
      } else {
        // 게스트 유저
        final now = DateTime.now();
        final Duration difference = now.difference(todayThisCafeUpdates.first.update);
        final int minutesDifference = difference.inMinutes;
        if (minutesDifference.abs() <= 10) {
          // 최근 업데이트로부터 아직 10분이 안지남
          isUpdatePossible = false;
          pointText = "${10 - minutesDifference.abs()}분 후 혼잡도 등록 가능";
          pointTextColor = AppColor.error;
        }
      }
    } else {
      // 오늘 이 카페에서 업데이트를 한적없음
      if(globalState.isLoggedIn && globalState.myTodayUpdates.keys.length >= globalState.user.grade.stackRestrictionPerDay) {
        // 혼잡도 업데이트 스택 한도초과
        pointText = "현재 등급에서는 하루 ${globalState.user.grade.stackRestrictionPerDay}개의 층에서만 포인트 획득이 가능해요";
        pointTextColor = AppColor.error;
      }
    }

    // 좌석이 없을 경우 포인트 텍스트 및 컬러 설정
    if(!mapState.selectedCafeFloor.hasSeat) {
      pointText = "좌석이 없는 층에서는 혼잡도를 등록할 수 없어요";
      pointTextColor = AppColor.error;
    }

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
                Text(
                  pointText,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: pointTextColor,
                  )
                ),
                const VerticalSpacer(20),
                const _FloorRow(),
                const VerticalSpacer(100),
                _OccupancyUpdateSlider(width: constraints.maxWidth),
                const VerticalSpacer(60),
                Center(
                  child: ActionButtonPrimary(
                    buttonWidth: 280,
                    buttonHeight: 48,
                    title: isUpdatePossible ?
                      mapState.selectedCafeFloor.hasSeat ?
                        "등록하기" :
                        "좌석이 없는 층이에요" :
                      "아직 등록할 수 없어요",
                    isLoading: ref.watch(_isLoading),
                    onPressed: !isUpdatePossible || !mapState.selectedCafeFloor.hasSeat ? null : () async {
                      if(await mapViewModel.globalViewModel.isNearBy(from: mapState.selectedCafe.latLng, meter: 35)) {
                        if(globalState.isLoggedIn) {
                          ref.watch(_isLoading.notifier).update((state) => true);
                          if(context.mounted) await mapViewModel.updateOccupancyRate(context: context, isGuest: false);
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
                                  await mapViewModel.updateOccupancyRate(context: context, isGuest: true);
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
    const pointColor = AppColor.secondary;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
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
                            ? pointColor
                            : AppColor.white,
                        border: Border.all(color: pointColor, width: 1)
                    ),
                    width: 54,
                    height: 36.0,
                    child: Center(
                      child: Text(
                        "${cafeFloor.floor.toFloor()}층",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: mapState.selectedCafeFloor.id == cafeFloor.id
                            ? AppColor.white
                            : pointColor),
                      ),
                    ),
                  ),
                ),
                const HorizontalSpacer(10)
              ],
            );
          }).toList()
        ],
      )
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