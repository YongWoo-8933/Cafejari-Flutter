import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/book_mark.dart';
import 'package:cafejari_flutter/ui/components/share_button.dart';
import 'package:cafejari_flutter/ui/components/action_button.dart';
import 'package:cafejari_flutter/ui/screen/map/component/bottom_sheet_cafejigi.dart';
import 'package:cafejari_flutter/ui/screen/map/component/bottom_sheet_detail_floor.dart';
import 'package:cafejari_flutter/ui/screen/map/component/bottom_sheet_moreInfo.dart';
import 'package:cafejari_flutter/ui/screen/map/component/bottom_sheet_title.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomSheetPage2 extends ConsumerWidget {
  const BottomSheetPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapState mapState = ref.watch(mapViewModelProvider);

    return SingleChildScrollView( // 세로 스크롤 설정
      child: Padding(
        padding: AppPading.padding_30,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BottomSheetTitle(),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ActionButton(buttonWidth: MediaQuery.of(context).size.width - 160, buttonHeight: 40, title: "혼잡도 등록",  onPressed: () => mapState.pageController.jumpToPage(2), ),
                SizedBox(width: 10),
                ShareButton(buttonSize: 40,),
                SizedBox(width: 10),
                BookmarkButton(isBookmarked: false, buttonSize: 40)
              ],
            ),
            SizedBox(height: 30),
            Text("층별 정보", style: TextSize.textSize_bold_16),
            SizedBox(height: 10),
            BottomSheetDetailFloor(),
            SizedBox(height: 30),
            Text("카페지기", style: TextSize.textSize_bold_16),
            SizedBox(height: 10),
            BottomSheetCafeJigi(),
            SizedBox(height: 30),
            Text("상세 정보", style: TextSize.textSize_bold_16),
            BottomSheetMoreInfo(),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
