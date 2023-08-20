import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckButton extends StatelessWidget { // 크기가 더 작아질시 icon크기 조절 필요
  final bool isMarked;
  final double? buttonSize;
  final Function? onPressed;

  CheckButton({
    required this.isMarked,
    required this.buttonSize,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonSize,
      height: buttonSize,
      decoration: const BoxDecoration(
        shape: BoxShape.circle
      ),
      child: FloatingActionButton(
        onPressed: () {
          if (onPressed != null) {
            onPressed!(); // 콜백 함수 호출
          }
        },
        backgroundColor: isMarked ? AppColor.secondary : AppColor.grey_300,
        child: const Icon(
          CupertinoIcons.check_mark,
          color: AppColor.white,
          size: 7,
        ),
      ),
    );
  }
}
