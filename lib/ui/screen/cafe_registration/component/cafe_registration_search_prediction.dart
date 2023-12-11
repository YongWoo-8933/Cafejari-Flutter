import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/core/extension/string.dart';
import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/app_shadow.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/state/cafe_registration_state/cafe_registration_state.dart';
import 'package:cafejari_flutter/ui/util/occupancy_level.dart';
import 'package:cafejari_flutter/ui/util/zoom.dart';
import 'package:cafejari_flutter/ui/view_model/cafe_registration_view_model.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class CafeRegistrationSearchPrediction extends ConsumerWidget {
  final double width, height;

  const CafeRegistrationSearchPrediction({Key? key, required this.width, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CafeRegistrationState state = ref.watch(cafeRegistrationViewModelProvider);
    final CafeRegistrationViewModel viewModel = ref.watch(cafeRegistrationViewModelProvider.notifier);

    return Visibility(
      visible: state.searchQueryController.text.isNotEmpty && state.searchCafePredictions.isNotEmpty,
      child: Container(
        width: width,
        height: height,
        margin: const EdgeInsets.only(top: 54),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: AppShadow.box
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 5),
            itemCount: state.searchCafePredictions.length,
            itemBuilder: (contest, index) {
              final NaverSearchCafe searchCafe = state.searchCafePredictions[index];
              final bool isLast = state.searchCafePredictions.length - 1 == index;
              return GestureDetector(
                onTap: () {
                  viewModel.selectSearchCafe(searchCafe);
                  viewModel.clearSearchCafePredictions();
                  state.mapController?.clearOverlays();
                  final marker = NMarker(
                    id: "1",
                    position: NLatLng(searchCafe.latitude, searchCafe.longitude),
                    caption: NOverlayCaption(
                      text: searchCafe.name.toPlainText(),
                      color: AppColor.primary,
                      haloColor: AppColor.white,
                      textSize: 16.0
                    ),
                    captionAligns: [NAlign.top],
                    captionOffset: 4,
                    icon: OccupancyLevel.minus().nMarker
                  );
                  marker.setSize(OccupancyLevel.minus().markerSize * 1.2);
                  state.mapController?.addOverlay(marker);
                  state.mapController?.updateCamera(NCameraUpdate.fromCameraPosition(
                      NCameraPosition(target: NLatLng(searchCafe.latitude, searchCafe.longitude), zoom: Zoom.large)
                  ));
                },
                child: Container(
                  color: AppColor.white,
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HtmlWidget(
                              searchCafe.name,
                              onErrorBuilder: (context, element, error) => Text('$element error: $error'),
                              onLoadingBuilder: (context, element, loadingProgress) => const CircularProgressIndicator(),
                              renderMode: RenderMode.column
                            ),
                            const VerticalSpacer(4),
                            Text(
                              searchCafe.roadAddress,
                              style: const TextStyle(
                                color: AppColor.grey_800,
                                fontSize: 12
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: !isLast,
                        child: const Divider(height: 1, thickness: 1, color: AppColor.grey_200)
                      )
                    ],
                  ),
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}