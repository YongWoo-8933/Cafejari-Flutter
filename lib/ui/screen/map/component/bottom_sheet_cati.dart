import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/cati_blocks.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/viewmodel/map_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';

class BottomSheetCATI extends ConsumerWidget {
  const BottomSheetCATI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapState mapState = ref.watch(mapViewModelProvider);
    final GlobalState globalState = ref.watch(globalViewModelProvider);
    final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);

    return  Container(
      padding: AppPadding.padding_30,
      decoration: const BoxDecoration(
        color: AppColor.background
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text("CATI ", style: TextSize.textSize_bold_16),
              Container(
                width: 18,
                height: 18,
                decoration: const BoxDecoration(
                  color: AppColor.explanationButton, // 원하는 회색 색상
                  shape: BoxShape.circle,
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.transparent, // 버튼 배경을 투명하게 설정
                    shadowColor: AppColor.transparent, // 그림자 제거
                      padding: EdgeInsets.all(3),
                    elevation: 0
                  ),
                  child: Icon(CupertinoIcons.question, color: Colors.white, size: 14),
                ),
              )
            ],
          ),
          SizedBox(height: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CATIBlocks(is_clicked_1: true, is_clicked_2: true, is_clicked_3: true, is_clicked_4: true),
              SizedBox(height: 20,),
              ActionButtonPrimary(
                  buttonWidth: globalState.deviceSize.width/3,
                  buttonHeight: 30,
                  title: "CATI평가하기",
                  onPressed: () =>{ },
              )
            ],
          )
        ],
      ),
    );
  }
}

