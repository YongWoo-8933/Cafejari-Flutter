
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';

class BottomSheetCafeJigi extends ConsumerWidget {
  const BottomSheetCafeJigi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapState mapState = ref.watch(mapViewModelProvider);
    final double imageWidth = (MediaQuery.of(context).size.width-60)/8;

    // 이미지들의 리스트를 정의합니다.
    final List<Image> images = [
      // Image(image: image1, width: imageWidth),
      // Image(image: image2, width: imageWidth),
      // Image(image: image3, width: imageWidth),
      // Image(image: image4, width: imageWidth),
      // Image(image: image5, width: imageWidth),
      // Image(image: image6, width: imageWidth),
    ];

    // 이미지들을 반복하여 Positioned 위젯으로 감싸서 Stack에 추가합니다.
    List<Widget> positionedImages = List.generate(
      images.length,
          (index) => Positioned(
        left: imageWidth * index - 4,
        child: images[index],
      ),
    );

    return Stack(
      children: [
        ...positionedImages,
        ElevatedButton(
            onPressed:() => {},
            child: Container(
              width: imageWidth,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: const Icon(CupertinoIcons.plus),
            )
        )
      ],
    );
  }
}
