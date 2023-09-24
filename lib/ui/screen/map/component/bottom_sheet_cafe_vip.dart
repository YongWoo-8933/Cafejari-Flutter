import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/app_shadow.dart';
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
    const int maximumVipCount = 4;
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
              child: _VipRow(
                imageSize: imageSize,
                vips: mapState.selectedCafe.vips,
                maximumVipCount: maximumVipCount
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

class _VipRow extends StatelessWidget {
  final double imageSize;
  final List<PartialUser> vips;
  final int maximumVipCount;

  const _VipRow({super.key, required this.imageSize, required this.vips, required this.maximumVipCount});

  @override
  Widget build(BuildContext context) {
    const indent = 10.0;
    const imagePadding = 4.0;
    const nicknameMaxHeight = 30.0;
    return Stack(
      alignment: Alignment.center,
      children: [
        ...vips.map((e) {
          final int index = vips.indexOf(e);
            return Positioned(
              left: imageSize * index + indent,
              child: Visibility(
                visible: index < maximumVipCount,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(imagePadding),
                      decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular((imageSize + imagePadding * 2) / 2),
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
                      height: nicknameMaxHeight,
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
              ),
            );
        }).toList(),
        Positioned(
          left: imageSize * maximumVipCount + indent,
          child: Visibility(
            visible: vips.length > maximumVipCount,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: imageSize + imagePadding * 2,
                  height: imageSize + imagePadding * 2,
                  decoration: BoxDecoration(
                      color: AppColor.grey_400,
                      borderRadius: BorderRadius.circular((imageSize + imagePadding * 2) / 2),
                      boxShadow: AppShadow.box
                  ),
                  child: Text(
                    "+${vips.length - maximumVipCount} ",
                    style: const TextStyle(color: AppColor.white),
                  ),
                ),
                const VerticalSpacer(12),
                SizedBox(
                  width: imageSize,
                  height: nicknameMaxHeight,
                  child: Container(color: AppColor.white),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
