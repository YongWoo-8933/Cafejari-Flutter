import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/duration.dart';
import 'package:cafejari_flutter/ui/components/custom_snack_bar.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/screen/map/component/cafe_search_bar.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';
import 'package:cafejari_flutter/ui/util/n_location.dart';
import 'package:cafejari_flutter/ui/viewmodel/map_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class OnMap extends ConsumerWidget {
  const OnMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);
    final MapState mapState = ref.watch(mapViewModelProvider);
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const VerticalSpacer(50),
            CafeSearchBar(width: deviceWidth - 40, height: 48),
            const VerticalSpacer(20),
            AnimatedCrossFade(
              crossFadeState: mapState.isRefreshButtonVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              firstChild: Padding(
                padding: const EdgeInsets.only(bottom: 10, right: 10),
                child: SizedBox(
                  height: 36,
                  child: FloatingActionButton.extended(
                    elevation: 3,
                    icon: const Icon(size: 18, CupertinoIcons.refresh),
                    onPressed: () async => mapViewModel.refreshCafes(
                      cameraPosition: await mapState.mapController?.getCameraPosition() ??
                        NLocation.sinchon().cameraPosition
                    ),
                    label: const Text("현 지도에서 검색", style: TextStyle(letterSpacing: 0)),
                    backgroundColor: AppColor.white,
                  ),
                ),
              ),
              secondChild: const HorizontalSpacer(0.001),
              duration: AppDuration.animationDefault,
              firstCurve: Curves.easeInOut,
              secondCurve: Curves.easeInOut,
            )
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(35),
            child: FloatingActionButton.extended(
              label: const Text("목록보기", style: TextStyle(letterSpacing: 0)),
              icon: const Icon(CupertinoIcons.line_horizontal_3),
              onPressed: () => mapViewModel.globalViewModel.showSnackBar(content: "사용되지않은 기프티콘은 삭제할 수 없습니다. 먼저 사용완료 처리해주세요", type: SnackBarType.error),
              backgroundColor: AppColor.white,
              elevation: 3,
            ),
          ),
        )
      ]
    );
  }
}