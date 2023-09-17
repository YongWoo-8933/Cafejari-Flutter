import 'package:cached_network_image/cached_network_image.dart';
import 'package:cafejari_flutter/core/extension/double.dart';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/buttons/book_mark.dart';
import 'package:cafejari_flutter/ui/screen/map/component/occupancy_update_dialog.dart';
import 'package:cafejari_flutter/ui/screen/map/component/share_button.dart';
import 'package:cafejari_flutter/ui/components/cached_network_image.dart';
import 'package:cafejari_flutter/ui/components/cafe_name_address_block.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/view_model/map_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class BottomSheetMainInfo extends ConsumerWidget {
  const BottomSheetMainInfo({Key? key}) : super(key: key);

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
                            wantKeepAlive: true,
                            builder: (BuildContext context, int index) {
                              return PhotoViewGalleryPageOptions(
                                imageProvider: CachedNetworkImageProvider(mapState.selectedCafe.imageUrls[index]),
                                initialScale: PhotoViewComputedScale.contained,
                                maxScale: 1.5,
                                minScale: 0.4,
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
                    controller: mapState.pageController,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...mapState.selectedCafe.imageUrls.map((e) {
                      final index = mapState.selectedCafe.imageUrls.indexWhere((element) => e == element);
                      final isSelected = index == mapState.currentCafeImagePage;
                      if(index < 9) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isSelected ? AppColor.grey_100 : AppColor.grey_300.withOpacity(0.6),
                          ),
                        );
                      } else {
                        return const HorizontalSpacer(1);
                      }
                    }).toList()
                  ],
                ),
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // 카페 이름 + 주소
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CafeNameAddressBlock(
                        name: mapState.selectedCafe.name,
                        address: mapState.selectedCafe.address
                      ),
                      const VerticalSpacer(30),
                      Row(
                        children: [
                          ActionButtonPrimary(
                            buttonWidth: 208,
                            buttonHeight: 48,
                            title: "혼잡도 등록",
                            onPressed: () => showDialog(context: context, builder: (_) => const OccupancyUpdateDialog()),
                          ),
                          const HorizontalSpacer(10),
                          const ShareButton(),
                          const HorizontalSpacer(10),
                          const BookmarkButton(buttonSize: 48)
                        ],
                      ),
                      const VerticalSpacer(30),
                      const Text(
                        "층별 정보",
                        style: TextSize.textSize_bold_16,
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
                                      Text("${cafeFloor.floor}층", style: TextSize.textSize_bold_16),
                                      const VerticalSpacer(4),
                                      Image.asset(
                                        cafeFloor.recentUpdates.isNotEmpty
                                          ? cafeFloor.recentUpdates.first.occupancyRate
                                          .toOccupancyLevel()
                                          .thumbImagePath
                                          : 'asset/image/cafe_icon_0.png',
                                        width: 48,
                                      ),
                                      const VerticalSpacer(10),
                                      Text(
                                        cafeFloor.recentUpdates.isNotEmpty
                                            ? cafeFloor.recentUpdates.first.occupancyRate
                                            .toOccupancyLevel()
                                            .stringValue
                                            : "정보없음",
                                        style: TextSize.textSize_bold_16,
                                      ),
                                      const VerticalSpacer(10),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Text("혼잡도 ", style: TextSize.textSize_grey_12),
                                          Text(
                                            cafeFloor.recentUpdates.isNotEmpty
                                                ? " ${(cafeFloor.recentUpdates.first.occupancyRate *
                                                100).toInt()}%"
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