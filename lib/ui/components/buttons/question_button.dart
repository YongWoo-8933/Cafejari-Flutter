import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const QuestionButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: AppColor.explanationButton,
        borderRadius: BorderRadius.circular(10)
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.transparent,
          disabledBackgroundColor: AppColor.transparent,
          padding: const EdgeInsets.all(3),
          elevation: 0,
          shape: const CircleBorder()
        ),
        child: const Icon(CupertinoIcons.question, color: AppColor.white, size: 14),
      ),
    );
  }
}
