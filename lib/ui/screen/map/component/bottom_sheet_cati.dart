import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/buttons/question_button.dart';
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
    final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);
    final Size deviceSize = MediaQuery.of(context).size;

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
              QuestionButton()
            ],
          ),
          SizedBox(height: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CATIBlocks(is_clicked_1: true, is_clicked_2: true, is_clicked_3: true, is_clicked_4: true),
              SizedBox(height: 20,),
              ActionButtonPrimary(
                  buttonWidth: deviceSize.width/3,
                  buttonHeight: 30,
                  title: "CATI평가하기",
                  onPressed: () =>{ },
                primaryColor: true,
              )
            ],
          )
        ],
      ),
    );
  }
}

