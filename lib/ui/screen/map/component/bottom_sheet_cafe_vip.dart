import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/app_shadow.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/cached_network_image.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';

class BottomSheetCafeVIP extends ConsumerWidget {
  const BottomSheetCafeVIP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapState mapState = ref.watch(mapViewModelProvider);
    const int maximumVipCount = 5;
    const double imageSize = 64;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("카페지기", style: TextSize.textSize_bold_16),
          const VerticalSpacer(15),
          Visibility(
            visible: mapState.selectedCafe.vips.isNotEmpty,
            child: Container(
              alignment: Alignment.center,
              height: 140,
              padding: AppPadding.padding_10,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Visibility(
                    visible: mapState.selectedCafe.vips.length <= maximumVipCount,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ...mapState.selectedCafe.vips.map((e) {
                          final int index = mapState.selectedCafe.vips.indexOf(e);
                          return Positioned(
                            left: imageSize * index,
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: AppColor.white,
                                    borderRadius: BorderRadius.circular((imageSize + 8) / 2),
                                    boxShadow: AppShadow.box
                                  ),
                                  child: CustomCachedNetworkImage(
                                    imageUrl: e.imageUrl,
                                    width: imageSize,
                                    height: imageSize,
                                  )
                                ),
                                const VerticalSpacer(12),
                                SizedBox(
                                  width: imageSize,
                                  height: 30,
                                  child: Text(
                                    e.nickname,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.grey_600
                                    ),
                                  )
                                )
                              ],
                            ),
                          );
                        }).toList()
                      ],
                    )
                  ),
                  Visibility(
                    visible: mapState.selectedCafe.vips.length > maximumVipCount,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ...mapState.selectedCafe.vips.map((e) {
                          final int index = mapState.selectedCafe.vips.indexOf(e);
                          if(index > maximumVipCount) {
                            return const HorizontalSpacer(1);
                          } else {
                            return Positioned(
                              left: imageSize * index,
                              child: Column(
                                children: [
                                  Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                          color: AppColor.white,
                                          borderRadius: BorderRadius.circular((imageSize + 8) / 2),
                                          boxShadow: AppShadow.box
                                      ),
                                      child: CustomCachedNetworkImage(
                                        imageUrl: e.imageUrl,
                                        width: imageSize,
                                        height: imageSize,
                                      )
                                  ),
                                  const VerticalSpacer(12),
                                  SizedBox(
                                    width: imageSize,
                                    height: 30,
                                    child: Text(
                                      e.nickname,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: AppColor.grey_600
                                      ),
                                    )
                                  )
                                ],
                              ),
                            );
                          }
                        }).toList(),
                        Positioned(
                          left: imageSize * maximumVipCount,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: imageSize + 8,
                                height: imageSize + 8,
                                decoration: BoxDecoration(
                                  color: AppColor.grey_400,
                                  borderRadius: BorderRadius.circular((imageSize + 8) / 2),
                                  boxShadow: AppShadow.box
                                ),
                                child: Text(
                                  "+${mapState.selectedCafe.vips.length - maximumVipCount} ",
                                  style: const TextStyle(color: AppColor.white),
                                ),
                              ),
                              const VerticalSpacer(12),
                              SizedBox(
                                width: imageSize,
                                height: 30,
                                child: Container(color: AppColor.white,),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: mapState.selectedCafe.vips.isEmpty,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "아직 이곳에 카페지기가 없어요",
                textAlign: TextAlign.center,
              ),
            )
          ),
        ]
      ),
    );
  }
}