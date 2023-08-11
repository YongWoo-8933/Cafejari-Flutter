import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionButton extends StatelessWidget {
  final Function? onPressed;

  QuestionButton({
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Icon(CupertinoIcons.question, color: AppColor.white, size: 14),
      ),
    );
  }
}
