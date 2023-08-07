import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/buttons/book_mark.dart';
import 'package:cafejari_flutter/ui/components/buttons/share_button.dart';
import 'package:cafejari_flutter/ui/screen/map/component/bottom_sheet_cafe_vip.dart';
import 'package:cafejari_flutter/ui/screen/map/component/bottom_sheet_cati.dart';
import 'package:cafejari_flutter/ui/screen/map/component/bottom_sheet_detail_floor.dart';
import 'package:cafejari_flutter/ui/screen/map/component/bottom_sheet_more_info.dart';
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
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: AppPadding.padding_30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BottomSheetTitle(),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ActionButtonPrimary(buttonWidth: MediaQuery.of(context).size.width - 160, buttonHeight: 40, title: "혼잡도 등록",  onPressed: () => mapState.pageController.jumpToPage(2), ),
                      const SizedBox(width: 10),
                      ShareButton(buttonSize: 40,),
                      const SizedBox(width: 10),
                      BookmarkButton(isBookmarked: false, buttonSize: 40)
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text("층별 정보", style: TextSize.textSize_bold_16),
                  const SizedBox(height: 10),
                  const BottomSheetDetailFloor(),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            BottomSheetCATI(),
            Container(
              decoration: const BoxDecoration(
                color: AppColor.secondaryContainer
              ),
              padding: AppPadding.padding_30,
              child:  const Column(
                children: [
                  SizedBox(height: 10),
                  Text("CATI", style: TextSize.textSize_bold_16),
                  // BottomSheetCATI(),
                  SizedBox(height: 10)
                ],
              ),
            ),
            Container(
              padding: AppPadding.padding_30,
              child: const Column(
                children: [
                  Text("카페지기", style: TextSize.textSize_bold_16),
                  SizedBox(height: 10),
                  // BottomSheetCafeVIP(),
                  SizedBox(height: 10)
                ],
              ),
            ),
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
