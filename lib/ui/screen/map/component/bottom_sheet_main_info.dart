import 'package:cached_network_image/cached_network_image.dart';
import 'package:cafejari_flutter/core/extension/double.dart';
import 'package:cafejari_flutter/core/extension/int.dart';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/book_mark.dart';
import 'package:cafejari_flutter/ui/components/buttons/question_button.dart';
import 'package:cafejari_flutter/ui/components/occupancy_prediction_description_dialog.dart';
import 'package:cafejari_flutter/ui/components/page_view_dot_indicator.dart';
import 'package:cafejari_flutter/ui/screen/map/component/occupancy_update_button.dart';
import 'package:cafejari_flutter/ui/screen/map/component/share_button.dart';
import 'package:cafejari_flutter/ui/components/cached_network_image.dart';
import 'package:cafejari_flutter/ui/components/cafe_name_address_block.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/util/occupancy_level.dart';
import 'package:cafejari_flutter/ui/view_model/map_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class BottomSheetMainInfo extends ConsumerWidget {
  final double sidePadding;

  const BottomSheetMainInfo({Key? key, required this.sidePadding}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapState mapState = ref.watch(mapViewModelProvider);
    final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);
    final Size deviceSize = MediaQuery.of(context).size;
    const double photoFrameHeight = 240;
    const double cornerRadius = 20;

    return Stack(
      children: [
        // 카페 사진 프레임
        SizedBox(
          height: 240,
          width: deviceSize.width,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Visibility(
                visible: mapState.selectedCafe.imageUrls.isNotEmpty,
                child: GestureDetector(
                  onTap: () => showDialog(
                    context: context,
                    useSafeArea: false,
                    builder: (_) => Dialog(
                      insetPadding: AppPadding.padding_0,
                      backgroundColor: AppColor.transparentBlack_600,
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          PhotoViewGallery.builder(
                            scrollPhysics: const BouncingScrollPhysics(),
                            itemCount: mapState.selectedCafe.imageUrls.length,
                            pageController: PageController(initialPage: mapState.currentCafeImagePage, keepPage: false),
                            onPageChanged: (value) {
                              mapViewModel.setCurrentCafeImagePage(value);
                              mapState.cafeImagePageController.jumpToPage(value);
                            },
                            builder: (BuildContext context, int index) {
                              return PhotoViewGalleryPageOptions(
                                imageProvider: CachedNetworkImageProvider(mapState.selectedCafe.imageUrls[index]),
                                initialScale: PhotoViewComputedScale.contained,
                                maxScale: PhotoViewComputedScale.covered,
                                minScale: PhotoViewComputedScale.contained,
                                tightMode: true
                              );
                            },
                            loadingBuilder: (context, event) => const Center(
                              child: CircularProgressIndicator(color: AppColor.white),
                            )
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10, top: 60),
                            child: IconButton(
                              onPressed: () => Navigator.of(context).pop(),
                              icon: const Icon(
                                CupertinoIcons.xmark,
                                size: 32,
                                color: AppColor.grey_300,
                              )
                            ),
                          )
                        ],
                      )
                    ),
                  ),
                  child: PageView(
                    controller: mapState.cafeImagePageController,
                    onPageChanged: (value) => mapViewModel.setCurrentCafeImagePage(value),
                    children: [
                      ...mapState.selectedCafe.imageUrls.map((e) {
                        return CustomCachedNetworkImage(
                          imageUrl: e,
                          width: deviceSize.width,
                          height: photoFrameHeight
                        );
                      }).toList()
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: mapState.selectedCafe.imageUrls.isEmpty,
                child: mapState.randomCafeImageUrl.isNotNull ?
                  CustomCachedNetworkImage(
                    imageUrl: mapState.randomCafeImageUrl!,
                    width: deviceSize.width,
                    height: photoFrameHeight,
                    fit: BoxFit.cover
                  ) :
                  Image.asset(
                    "asset/image/cafe_picture_0.jpg",
                    width: deviceSize.width,
                    height: photoFrameHeight,
                    fit: BoxFit.cover,
                  ),
              ),
              Padding(
                padding: const EdgeInsets.all(cornerRadius * 2),
                child: PageViewDotIndicator(
                  dotCount: mapState.selectedCafe.imageUrls.length > 8 ? 8 : mapState.selectedCafe.imageUrls.length,
                  selectedDotIndex: mapState.currentCafeImagePage,
                )
              )
            ],
          )
        ),
        Column(
          children: [
            // 상단 corner 처리
            const VerticalSpacer(photoFrameHeight - cornerRadius),
            Container(
              height: cornerRadius * 2,
              width: deviceSize.width,
              decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(cornerRadius)
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: sidePadding),
              child: Column(
                children: [
                  // 카페 이름 + 주소
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CafeNameAddressBlock(
                        width: deviceSize.width - sidePadding * 2,
                        name: mapState.selectedCafe.name,
                        address: mapState.selectedCafe.address
                      ),
                      const VerticalSpacer(30),
                      const Row(
                        children: [
                          OccupancyUpdateButton(width: 208, height: 48),
                          HorizontalSpacer(10),
                          ShareButton(),
                          HorizontalSpacer(10),
                          BookmarkButton(buttonSize: 48)
                        ],
                      ),
                      const VerticalSpacer(30),
                      Row(
                        children: [
                          const Text(
                            "층별 혼잡도",
                            style: TextSize.textSize_bold_16,
                          ),
                          const HorizontalSpacer(4),
                          Visibility(
                            visible: mapState.selectedCafe.cafeFloors.every((e) => e.recentUpdates.isEmpty) &&
                              mapState.selectedCafe.cafeFloors.any((e) => e.occupancyRatePrediction.isNotNull),
                            child: QuestionButton(
                              onPressed: () => showDialog(
                                context: context,
                                builder: (_) => const OccupancyPredictionDescriptionDialog()
                              )
                            )
                          )
                        ],
                      ),
                      const VerticalSpacer(20),
                      SizedBox(
                        height: 224,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: mapState.selectedCafe.cafeFloors.length,
                          itemBuilder: (context, index) {
                            final CafeFloor cafeFloor = mapState.selectedCafe.cafeFloors[index];
                            final bool isLast = mapState.selectedCafe.cafeFloors.length - 1 == index;
                            return Row(
                              children: [
                                Padding(
                                  padding: AppPadding.padding_horizon_20,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("${cafeFloor.floor.toFloor()}층", style: TextSize.textSize_bold_16),
                                      const VerticalSpacer(8),
                                      cafeFloor.recentUpdates.isNotEmpty || cafeFloor.occupancyRatePrediction.isNotNull ? Image.asset(
                                        cafeFloor.recentUpdates.isNotEmpty ?
                                          cafeFloor.recentUpdates.first.occupancyRate.toOccupancyLevel().markerImagePath :
                                          cafeFloor.occupancyRatePrediction.toOccupancyLevel().markerImagePath,
                                        width: 48,
                                      ) : Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 6),
                                        child: Image.asset(
                                          OccupancyLevel.minus().markerImagePath,
                                          width: 36,
                                        ),
                                      ),
                                      const VerticalSpacer(10),
                                      Text(
                                        cafeFloor.recentUpdates.isNotEmpty || cafeFloor.occupancyRatePrediction.isNotNull ?
                                          cafeFloor.recentUpdates.isNotEmpty ?
                                            cafeFloor.recentUpdates.first.occupancyRate.toOccupancyLevel().stringValue :
                                            cafeFloor.occupancyRatePrediction.toOccupancyLevel().stringValue
                                        : cafeFloor.hasSeat ? "정보없음" : "좌석 없는 층",
                                        style: TextSize.textSize_bold_16,
                                        textAlign: TextAlign.center,
                                      ),
                                      Visibility(
                                        visible: cafeFloor.recentUpdates.isEmpty && cafeFloor.occupancyRatePrediction.isNotNull,
                                        child: const Column(
                                          children: [
                                            VerticalSpacer(2),
                                            Text(
                                              "*예상",
                                              style: TextStyle(
                                                color: AppColor.grey_500,
                                                fontSize: 11
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const VerticalSpacer(10),
                                      Visibility(
                                        visible: cafeFloor.hasSeat,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                const Text("혼잡도 ", style: TextSize.textSize_grey_12),
                                                Text(
                                                  cafeFloor.recentUpdates.isNotEmpty || cafeFloor.occupancyRatePrediction.isNotNull ?
                                                    cafeFloor.recentUpdates.isNotEmpty ?
                                                      " ${(cafeFloor.recentUpdates.first.occupancyRate * 100).toInt()}%" :
                                                      " ${(cafeFloor.occupancyRatePrediction! * 100).toInt()}%"
                                                  : " 정보없음",
                                                  style: TextSize.textSize_bold_12,
                                                ),
                                              ],
                                            ),
                                            const VerticalSpacer(2),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                const Text("콘센트보급율 ", style: TextSize.textSize_grey_12),
                                                Text(cafeFloor.wallSocketRate.isNotNull ? " ${(cafeFloor
                                                    .wallSocketRate! * 100).floor()}%" : " 정보없음",
                                                    style: TextSize.textSize_bold_12)
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]
                                  ),
                                ),
                                VerticalDivider(
                                  width: 1,
                                  color: isLast ? AppColor.transparent : AppColor.grey_200,
                                  thickness: 1
                                )
                              ],
                            );
                          }
                        ),
                      )
                    ]
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}