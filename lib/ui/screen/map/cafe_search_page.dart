import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/duration.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/screen/map/component/cafe_search_bar.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';
import 'package:cafejari_flutter/ui/util/n_location.dart';
import 'package:cafejari_flutter/ui/util/zoom.dart';
import 'package:cafejari_flutter/ui/viewmodel/map_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);
    final MapState mapState = ref.watch(mapViewModelProvider);
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double bottomNavBarHeight = ref.read(bottomNavBarHeightProvider);
    final double bottomNavBarCornerRadius = ref.read(bottomNavBarCornerRadiusProvider);
    
    return AnimatedOpacity(
      duration: AppDuration.animationDefault,
      opacity: mapState.isSearchPageFadedIn ? 1.0 : 0,
      child: Visibility(
        visible: mapState.isSearchPageVisible,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: deviceWidth,
              height: deviceHeight - bottomNavBarHeight + bottomNavBarCornerRadius,
              color: AppColor.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const VerticalSpacer(50),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => mapViewModel.closeSearchPage(),
                          icon: const Icon(
                            CupertinoIcons.left_chevron,
                            color: AppColor.black,
                          ),
                      ),
                      CafeSearchBar(width: deviceWidth - 68, height: 48)
                    ],
                  ),
                  const VerticalSpacer(20),
                  SizedBox(
                    height: deviceHeight - bottomNavBarHeight + bottomNavBarCornerRadius - 118,
                    width: deviceWidth,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ListView.builder(
                          padding: EdgeInsets.only(bottom: bottomNavBarCornerRadius + 80),
                          itemCount: mapState.searchPredictions.length,
                          itemBuilder: (context, index) {
                            final Cafe searchCafe = mapState.searchPredictions[index];
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    mapViewModel.closeSearchPage();
                                    mapState.mapController?.updateCamera(NCameraUpdate.fromCameraPosition(
                                      NCameraPosition(target: searchCafe.latLng, zoom: Zoom.large)
                                    ));
                                    mapViewModel.refreshCafes(
                                      cameraPosition: NCameraPosition(target: searchCafe.latLng, zoom: Zoom.large)
                                    );
                                  },
                                  child: Container(
                                    width: deviceWidth,
                                    height: 80,
                                    color: AppColor.transparent,
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(left: 25, right: 25, top: 20, bottom: 16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          searchCafe.name,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700
                                          )
                                        ),
                                        const VerticalSpacer(8),
                                        Row(
                                          children: [
                                            Image.asset(
                                              "asset/image/icon_small_pin.png",
                                              height: 12,
                                            ),
                                            const HorizontalSpacer(4),
                                            Text(
                                              searchCafe.address,
                                              style: const TextStyle(
                                                  color: AppColor.grey_800,
                                                  fontSize: 12
                                              )
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  )
                                ),
                                const Divider(height: 1, thickness: 1, color: AppColor.grey_100)
                              ],
                            );
                          }
                        ),
                        Visibility(
                          visible: mapState.searchQueryController.text.isNotEmpty && mapState.searchPredictions.isEmpty,
                          child: Column(
                            children: [
                              const VerticalSpacer(80),
                              const Icon(CupertinoIcons.search, size: 36),
                              const VerticalSpacer(30),
                              Text(
                                "'${mapState.searchQueryController.text}'의 검색 결과가 없습니다",
                                style: TextSize.textSize_16,
                              )
                            ],
                          )
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 35),
                child: SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.secondary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        )
                    ),
                    child: const Text(
                      " 카페추가 +",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColor.white
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}