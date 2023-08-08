import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/cati_blocks.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';

class MyCATIPart extends ConsumerWidget {
  const MyCATIPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapState mapState = ref.watch(mapViewModelProvider);
    final GlobalState globalState = ref.watch(globalViewModelProvider);

    return Container(
      padding: AppPadding.padding_horizon_30,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('내가 선호하는 CATI ', style: TextSize.textSize_bold_16),
                  Container(
                    width: 18,
                    height: 18,
                    decoration: const BoxDecoration(
                      color: AppColor.explanationButton,
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
                  ),
                ],
              ),
              ActionButtonPrimary(
                  buttonWidth: 60,
                  buttonHeight: 30,
                  title: "수정",
                  onPressed: () => {}
              )
            ],
          ),
          SizedBox(height: 10),
          CATIBlocks(is_clicked_1: true, is_clicked_2: true, is_clicked_3: true, is_clicked_4: true),
        ],
      ),
    );
  }
}