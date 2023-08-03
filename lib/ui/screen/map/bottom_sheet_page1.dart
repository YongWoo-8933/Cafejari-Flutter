import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/buttons/book_mark.dart';
import 'package:cafejari_flutter/ui/components/buttons/share_button.dart';
import 'package:cafejari_flutter/ui/screen/map/component/bottom_sheet_floor.dart';
import 'package:cafejari_flutter/ui/screen/map/component/bottom_sheet_small_slider.dart';
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

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          padding: EdgeInsets.only(left: 20, right: 10, top: 10),
          width: MediaQuery.of(context).size.width/2,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("#대표테그", style: TextSize.textSize_12,),
                  BookmarkButton(isBookmarked: false, buttonSize: 30)
                ],
              ),
              Text("${mapState.selectedCafeInfo.name}",style: TextSize.textSize_24,),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  ActionButtonPrimary(
                    buttonWidth: 120,
                    buttonHeight: 30,
                    title: "혼잡도 등록",
                    onPressed: () => mapState.pageController.jumpToPage(2),
                  ),
                  SizedBox(width: 10),
                  ShareButton(buttonSize: 30),
                ],
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          width: MediaQuery.of(context).size.width/2,
          color: AppColor.secondaryContainer,
          child: Column(
            children: [
              BottomSheetFloor(),
              SizedBox(height: 10),
              BottomSheetSmallSlider(),
              SizedBox(height: 10),
              Row(
                children: [
                  Image(image: AssetImage("asset/image/plug_icon.png"),width: 20, height: 20),
                  Text("콘센트", style: TextStyle(fontSize: 12),),
                  Text("테이블 대비"),
                  Text("${mapState.selectedCafe.wallSocket}")
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}