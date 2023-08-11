import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/buttons/question_button.dart';
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
                  QuestionButton()
                ],
              ),
              ActionButtonPrimary(
                  buttonWidth: 60,
                  buttonHeight: 30,
                  title: "수정",
                  onPressed: () => {},
                primaryColor: true,
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