import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';
import 'package:hive/hive.dart';

class BottomSheetCafeVIP extends ConsumerWidget {
  const BottomSheetCafeVIP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapState mapState = ref.watch(mapViewModelProvider);
    final GlobalState globalState = ref.watch(globalViewModelProvider);
    final double imageWidth = (globalState.deviceSize.width-60) / 8;

    // 이미지들의 리스트를 정의합니다.
    final List<Image> images = [
      Image.asset("asset/image/cafe_icon_0.png", width: imageWidth, height: imageWidth),
      Image.asset("asset/image/cafe_icon_1.png", width: imageWidth, height: imageWidth),
      Image.asset("asset/image/cafe_icon_2.png", width: imageWidth, height: imageWidth),
      Image.asset("asset/image/cafe_icon_3.png", width: imageWidth, height: imageWidth),
      Image.asset("asset/image/cafe_icon_4.png", width: imageWidth, height: imageWidth),
      Image.asset("asset/image/cafe_icon_0.png", width: imageWidth, height: imageWidth),
    ];

    // 이미지들을 반복하여 Positioned 위젯으로 감싸서 Stack에 추가합니다.
    List<Widget> positionedImages = List.generate(
      images.length,
          (index) => Positioned(
        left: (imageWidth * index)*0.7,
        top: 0, // 이미지들을 상단에 정렬하도록 top 값을 0으로 설정합니다.
        child: images[index],
      ),
    );

    return Container(
      padding: AppPadding.padding_30,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("카페지기", style: TextSize.textSize_bold_16),
            Container(
              alignment: Alignment.center,
              height: 100,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300,
                      height: 50,
                      child: Stack(
                        children: [
                          ...positionedImages,
                          Positioned(
                            left: (imageWidth * 6)*0.7,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.transparent,
                                  elevation: 0,
                                  shape: CircleBorder()
                              ),
                              onPressed: () => {},
                              child: Container(
                                width: imageWidth,
                                height: imageWidth,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColor.primary
                                ),
                                child: const Icon(CupertinoIcons.plus),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]
              ),
            ),
          ]
      ),
    );
  }
}