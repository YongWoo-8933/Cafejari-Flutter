import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/buttons/question_button.dart';
import 'package:cafejari_flutter/ui/components/cati_blocks.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/view_model/map_view_model.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      decoration: const BoxDecoration(
        color: AppColor.background
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Text("CATI ", style: TextSize.textSize_bold_16),
              const HorizontalSpacer(4),
              QuestionButton(onPressed: () {})
            ],
          ),
          const VerticalSpacer(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CATIBlocks(
                is1stBlockClicked: true,
                is2ndBlockClicked: true,
                is3rdBlockClicked: true,
                is4thBlockClicked: true
              ),
              const VerticalSpacer(20),
              ActionButtonPrimary(
                buttonWidth: 120,
                buttonHeight: 40,
                title: "CATI 평가하기",
                onPressed: () => { },
              )
            ],
          )
        ],
      ),
    );
  }
}

