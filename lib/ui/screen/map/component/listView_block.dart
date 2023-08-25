import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/book_mark.dart';
import 'package:cafejari_flutter/ui/view_model/map_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';

class ListViewBlock extends ConsumerWidget {
  const ListViewBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapState mapState = ref.watch(mapViewModelProvider);
    final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);

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
                  Text("#대표태그", style: TextSize.textSize_grey_12),
                  SizedBox(height: 10),
                  Text("카페 이름", style: TextSize.textSize_bold_16),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Image.asset("/asset/image/icon_people4_black.png"),
                      Text(" 혼잡도 ", style: TextSize.textSize_grey_12),
                      Text("75%", style: TextSize.textSize_bold_12),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset("/asset/image/icon_plug.png"),
                      Text(" 콘센트 ", style: TextSize.textSize_grey_12),
                      Text("테이블 대비 75%", style: TextSize.textSize_bold_12),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      Positioned(
          bottom: 0,
          right: 0,
          child:BookmarkButton(isBookmarked: false, buttonSize: 15)
      )
    ]);
  }
}
