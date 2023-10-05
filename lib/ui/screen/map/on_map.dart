import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/duration.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/screen/map/component/cafe_search_bar.dart';
import 'package:cafejari_flutter/ui/screen/map/component/location_dialog.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';
import 'package:cafejari_flutter/ui/util/zoom.dart';
import 'package:cafejari_flutter/ui/view_model/map_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class OnMap extends ConsumerWidget {
  const OnMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);
    final MapState mapState = ref.watch(mapViewModelProvider);
    final double deviceWidth = MediaQuery.of(context).size.width;

    return Stack(
      alignment: Alignment.center,
      children: [
        Visibility(
          visible: mapState.isCafeRefreshIndicatorVisible,
          child: LoadingAnimationWidget.hexagonDots(color: AppColor.primary, size: 42)
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const VerticalSpacer(60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CafeSearchBar(width: deviceWidth - 40 - 10 - 48, height: 48),
                const HorizontalSpacer(10),
                SizedBox(
                  width: 48,
                  height: 48,
                  child: FloatingActionButton(
                    heroTag: "location_button",
                    onPressed: () {
                      if (mapState.locations.isNotEmpty) {
                        showDialog(
                          context: context,
                          builder: (_) => LocationDialog(
                            locations: mapState.locations,
                            onLocationPress: (location) {
                              final cameraPosition = NCameraPosition(
                                target: NLatLng(location.latitude, location.longitude),
                                zoom: Zoom.medium
                              );
                              mapState.mapController?.updateCamera(
                                NCameraUpdate.fromCameraPosition(cameraPosition)
                              );
                              mapViewModel.refreshCafes(cameraPosition: cameraPosition);
                            }
                          )
                        );
                      }
                    },
                    backgroundColor: AppColor.primary,
                    shape: const CircleBorder(),
                    child: const Icon(
                      CupertinoIcons.flag,
                      color: AppColor.white,
                      size: 20,
                    )
                  ),
                )
              ],
            ),
            const VerticalSpacer(20),
            AnimatedCrossFade(
              crossFadeState: mapState.isRefreshButtonVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              firstChild: SizedBox(
                height: 42,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 36,
                      child: FloatingActionButton.extended(
                        heroTag: "cafe_refresh_button",
                        elevation: 3,
                        icon: const Icon(size: 18, CupertinoIcons.refresh),
                        onPressed: () async {
                          mapViewModel.closeBottomSheetPreview();
                          await mapViewModel.refreshCafes(showNoCafeSnackBar: true);
                        },
                        label: const Text("현 지도에서 검색", style: TextStyle(letterSpacing: 0)),
                        backgroundColor: AppColor.white,
                      ),
                    ),
                    const VerticalSpacer(6)
                  ],
                ),
              ),
              secondChild: const HorizontalSpacer(0.001),
              duration: AppDuration.animationDefault,
              firstCurve: Curves.easeInOut,
              secondCurve: Curves.easeInOut,
            )
          ],
        ),
        // Align(
        //   alignment: Alignment.bottomCenter,
        //   child: Padding(
        //     padding: const EdgeInsets.all(35),
        //     child: FloatingActionButton.extended(
        //       label: const Text("목록보기", style: TextStyle(letterSpacing: 0)),
        //       icon: const Icon(CupertinoIcons.line_horizontal_3),
        //       onPressed: () => mapViewModel.globalViewModel.showSnackBar(content: "사용되지않은 기프티콘은 삭제할 수 없습니다. 먼저 사용완료 처리해주세요", type: SnackBarType.error),
        //       backgroundColor: AppColor.white,
        //       elevation: 3,
        //     ),
        //   ),
        // )
      ]
    );
  }
}