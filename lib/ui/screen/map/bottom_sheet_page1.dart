import 'package:cafejari_flutter/core/extension/double.dart';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/buttons/book_mark.dart';
import 'package:cafejari_flutter/ui/components/buttons/share_button.dart';
import 'package:cafejari_flutter/ui/screen/map/component/bottom_sheet_floor.dart';
import 'package:cafejari_flutter/ui/screen/map/component/bottom_sheet_small_slider.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';

class BottomSheetPage1 extends ConsumerWidget {
  const BottomSheetPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapState mapState = ref.watch(mapViewModelProvider);
    final Size deviceSize = MediaQuery.of(context).size;


    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20, right: 10, top: 10),
          width: MediaQuery.of(context).size.width/2,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("#대표테그", style: TextSize.textSize_12,),
                  BookmarkButton(isBookmarked: false, buttonSize: ((deviceSize.width/2)-50)/4*1)
                ],
              ),
              Container( // 재조정 필요
                width: (deviceSize.width / 2 - 30),
                child: Text(
                  "${mapState.selectedCafe.name}",
                  style: TextSize.textSize_24,
                  softWrap: true, // 텍스트 너비를 초과하면 다음 줄로 이동
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  ActionButtonPrimary(
                    buttonWidth: ((deviceSize.width/2)-50)/4*3,
                    buttonHeight: ((deviceSize.width/2)-50)/4*1,
                    title: "혼잡도 등록",
                    onPressed: () => mapState.pageController.jumpToPage(2),
                  ),
                  const SizedBox(width: 10),
                  ShareButton(buttonSize: ((deviceSize.width/2)-50)/4*1),
                ],
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 10, top: 15),
          width: MediaQuery.of(context).size.width/2,
          color: AppColor.secondaryContainer,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BottomSheetFloor(),
              const SizedBox(height: 10),
              Container( // 슬라이더 % 표시부분(슬라이더의 크기 벗어나기 위해 상위에 작성)
                padding: EdgeInsets.only(left:mapState.selectedCafeFloor.recentUpdates.isNotEmpty ?
                (deviceSize.width/2-40)*mapState.selectedCafeFloor.recentUpdates.first.occupancyRate-7 : 0 ),
                decoration: BoxDecoration(
                  color: AppColor.brown_300
                ),
                width: mapState.selectedCafeFloor.recentUpdates.isNotEmpty ? (deviceSize.width/2-40) : 0,
                // alignment: Alignment.bottomRight,
                child: Text(mapState.selectedCafeFloor.recentUpdates.isNotEmpty
                    ? "${((mapState.selectedCafeFloor.recentUpdates.first.occupancyRate)*100).floor()}%" : ""),
              ),
              const BottomSheetSmallSlider(),
              Container(
                padding: EdgeInsets.only(
                  left: mapState.selectedCafeFloor.recentUpdates.isNotEmpty
                      ? (deviceSize.width/2 - 40) * mapState.selectedCafeFloor.recentUpdates.first.occupancyRate - 60
                      : 0,
                ),
                width: mapState.selectedCafeFloor.recentUpdates.isNotEmpty
                    ? (deviceSize.width/2 - 40)
                    : 0,
                child: mapState.selectedCafeFloor.recentUpdates.isNotEmpty
                    ? Image.asset(
                  mapState.selectedCafeFloor.recentUpdates.first.occupancyRate.toOccupancyLevel().pinImagePath,
                  width: 30,
                  height: 40,
                )
                    : null, // 여기에 null 할당
              ),

              const SizedBox(height: 10),
              Row(
                children: [
                  const Image(image: AssetImage("asset/image/icon_plug.png"),width: 20, height: 20),
                  const Text("콘센트", style: TextSize.textSize_12),
                  const Text(" 테이블 대비 ", style: TextSize.textSize_grey_12,),
                  Text(mapState.selectedCafeFloor.wallSocketRate.isNotNull ? "${(mapState.selectedCafeFloor.wallSocketRate!)*100}%" : "정보없음", style: TextSize.textSize_bold_12,)
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}