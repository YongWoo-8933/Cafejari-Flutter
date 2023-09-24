import 'package:cafejari_flutter/core/extension/int.dart';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/duration.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/book_mark.dart';
import 'package:cafejari_flutter/ui/screen/map/component/bottom_sheet_cati.dart';
import 'package:cafejari_flutter/ui/screen/map/component/occupancy_update_dialog.dart';
import 'package:cafejari_flutter/ui/screen/map/component/share_button.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/screen/map/component/bottom_sheet_slider.dart';
import 'package:cafejari_flutter/ui/view_model/map_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';

final _dragDyProvider = StateProvider<double>((ref) => 0.0);

class BottomSheetPreview extends ConsumerWidget {
  final double height;
  final double cornerRadius;

  const BottomSheetPreview({Key? key, required this.height, required this.cornerRadius}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapState mapState = ref.watch(mapViewModelProvider);
    final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);
    final Size deviceSize = MediaQuery.of(context).size;
    const double edgePadding = 20;
    const double boundaryPadding = 10;
    const double topShadowPadding = 8;
    const double componentHeight = 36;

    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if(details.delta.dy > 0 && details.delta.dy.abs() > 6) {
          ref.watch(_dragDyProvider.notifier).update((state) => state = details.delta.dy);
        }
      },
      onVerticalDragEnd: (_) {
        final dy = ref.watch(_dragDyProvider);
        if(dy > 0 && dy.abs() > 6) {
          mapViewModel.closeBottomSheetPreview();
          ref.watch(_dragDyProvider.notifier).update((state) => state = 0.0);
        }
      },
      child: Container(
        height: height,
        width: deviceSize.width,
        alignment: Alignment.bottomCenter,
        child: AnimatedSize(
          duration: AppDuration.animationDefault,
          reverseDuration: AppDuration.animationDefault,
          curve: Curves.easeInOut,
          child: Container(
            width: deviceSize.width,
            height: mapState.isBottomSheetPreviewExpanded ? height - topShadowPadding : 0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(cornerRadius),
              color: AppColor.white,
              boxShadow: [
                BoxShadow(
                  color: AppColor.grey_500.withOpacity(0.4),
                  blurRadius: 2,
                  spreadRadius: 4
                )
              ]
            ),
            child: Column(
              children: [
                SizedBox(
                  height: height - topShadowPadding - cornerRadius,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // 왼쪽 파트
                      Container(
                        padding: const EdgeInsets.only(left: edgePadding, right: boundaryPadding, top: edgePadding),
                        width: deviceSize.width / 2,
                        child: LayoutBuilder(
                          builder: (_, constraint) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () => showDialog(context: context, builder: (_) => const CafeCATIEditor()),
                                    child: SizedBox(
                                      width: constraint.maxWidth - componentHeight - 10,
                                      child: Text(
                                      mapState.selectedCafe.catiTagText,
                                      style: const TextStyle(
                                        color: AppColor.grey_700,
                                        fontSize: 12,
                                        height: 0.95
                                      )),
                                    ),
                                  ),
                                  const BookmarkButton(buttonSize: componentHeight)
                                ],
                              ),
                              const VerticalSpacer(8),
                              Padding(
                                padding: const EdgeInsets.only(right: edgePadding),
                                child: Text(
                                  mapState.selectedCafe.name,
                                  maxLines: 2,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: edgePadding + 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        height: componentHeight,
                                        child: ElevatedButton(
                                          onPressed: () => showDialog(context: context, builder: (_) => const OccupancyUpdateDialog()),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColor.primary,
                                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(18),
                                            ),
                                          ),
                                          child: const Text(
                                            "혼잡도 등록",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: AppColor.white
                                            ),
                                          ),
                                        ),
                                      ),
                                      const ShareButton(buttonSize: componentHeight),
                                    ],
                                  ),
                                )
                              ),
                            ],
                          ),
                        ),
                      ),
                      // 오른쪽 파트
                      Container(
                        padding: const EdgeInsets.only(left: boundaryPadding, right: edgePadding, top: edgePadding),
                        width: deviceSize.width / 2,
                        decoration: const BoxDecoration(
                          color: AppColor.secondaryContainer,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(20))
                        ),
                        child: Column(
                          children: [
                            _FloorTabRow(
                              width: deviceSize.width - edgePadding - boundaryPadding,
                              height: componentHeight
                            ),
                            const VerticalSpacer(10),
                            Visibility(
                              visible: mapState.selectedCafeFloor.recentUpdates.isNotEmpty,
                              child: BottomSheetSlider(width: deviceSize.width / 2 - edgePadding - boundaryPadding)
                            ),
                            Visibility(
                              visible: mapState.selectedCafeFloor.recentUpdates.isEmpty,
                              child: const Padding(
                                padding: AppPadding.padding_15,
                                child: Column(
                                  children: [
                                    Text(
                                      "아직 혼잡도가 없어요",
                                      style: TextSize.textSize_bold_14,
                                      textAlign: TextAlign.center,
                                    ),
                                    VerticalSpacer(8),
                                    Text(
                                      "3초만에 혼잡도 등록하고\n포인트를 받아보세요!",
                                      style: TextStyle(
                                        color: AppColor.grey_800,
                                        fontSize: 12
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              )
                            ),
                            Visibility(
                              visible: mapState.selectedCafeFloor.wallSocketRate.isNotNull,
                              child: Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: edgePadding + 5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        height: componentHeight,
                                        child: Row(
                                          children: [
                                            Image.asset("asset/image/icon_plug.png", width: 24, height: 24),
                                            const HorizontalSpacer(2),
                                            const Text("콘센트 보급율: ", style: TextSize.textSize_12),
                                            const HorizontalSpacer(4),
                                            Text("${((mapState.selectedCafeFloor.wallSocketRate ?? 0) * 100).toInt()}%", style: TextSize.textSize_bold_12)
                                          ],
                                        ),
                                      )
                                    ]
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: deviceSize.width,
                  color: AppColor.white,
                  height: cornerRadius,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FloorTabRow extends ConsumerWidget {
  final double width;
  final double height;

  const _FloorTabRow({Key? key, required this.width, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapState mapState = ref.watch(mapViewModelProvider);
    final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);

    return SizedBox(
        height: height,
        width: width,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...mapState.selectedCafe.cafeFloors.map((e) {
                final isSelected = e.floor == mapState.selectedCafeFloor.floor;
                return Row(
                  children: [
                    const HorizontalSpacer(10),
                    GestureDetector(
                      onTap: () {
                        HapticFeedback.lightImpact();
                        mapViewModel.selectCafeFloor(e);
                      },
                      child: Text(
                        "${e.floor.toFloor()}층",
                        style: TextStyle(
                            fontWeight: isSelected ? FontWeight.w800 : FontWeight.w400,
                            fontSize: 15,
                            color: isSelected ? AppColor.black : AppColor.grey_500
                        ),
                      ),
                    ),
                    const HorizontalSpacer(12)
                  ],
                );
              }).toList()
            ],
          )
        )
    );
  }
}