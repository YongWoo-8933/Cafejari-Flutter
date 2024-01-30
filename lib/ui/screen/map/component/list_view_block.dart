import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/book_mark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListViewBlock extends ConsumerWidget {
  const ListViewBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Stack(children: [
      Container(
        padding: AppPadding.padding_7,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Image.asset("/asset/image/cafe_icon_1.png"),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("#대표태그", style: TextSize.textSize_grey_12),
                  const SizedBox(height: 10),
                  const Text("카페 이름", style: TextSize.textSize_bold_16),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Image.asset("/asset/image/icon_people4_black.png"),
                      const Text(" 혼잡도 ", style: TextSize.textSize_grey_12),
                      const Text("75%", style: TextSize.textSize_bold_12),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset("/asset/image/icon_plug.png"),
                      const Text(" 콘센트 ", style: TextSize.textSize_grey_12),
                      const Text("테이블 대비 75%", style: TextSize.textSize_bold_12),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      const Positioned(
          bottom: 0,
          right: 0,
          child:BookmarkButton(buttonSize: 15)
      )
    ]);
  }
}
