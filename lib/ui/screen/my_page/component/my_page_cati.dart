import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/buttons/question_button.dart';
import 'package:cafejari_flutter/ui/components/cati_blocks.dart';
import 'package:cafejari_flutter/ui/components/cati_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPageCATI extends StatelessWidget {
  final VoidCallback? onPressed;

  MyPageCATI({
    this.onPressed,
  });

  void _showAlertDialog(BuildContext context) {
    final alertDialog = CATIDialog(
      title: "CATI 등록",
      subTitle: '이 카페의 분위기를 선택해주세요',
      leftButton: "등록하기",
      rightButton: "등록안하기",
      cati1: 70,
      cati2: 30,
      cati3: 10,
      cati4: 50,
    );

    alertDialog.showTimed(context);
  }

  @override
  Widget build(BuildContext context) {
    final bool has_cati = true; // 사용자의 카티정보(지금은 임시로사용)

    return Container(
      padding: AppPadding.padding_30,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text("내가 선호하는 CATI "),
                  QuestionButton(),
                ],
              ),
              ActionButtonPrimary(
                buttonWidth: has_cati ? 50 : 80,
                buttonHeight: 30,
                title: has_cati ? '수정' : '등록하기',
                onPressed: () {_showAlertDialog(context);}, //catiDialog오픈
              )
            ],
          ),
          SizedBox(height: 20),
          Visibility(
            visible: has_cati,
              child: CATIBlocks(
                  hasOpenness: true,
                  is2ndBlockClicked: false,
                  is3rdBlockClicked: true,
                  is4thBlockClicked: false
              )
          )
        ]
      ),
    );
  }
}
