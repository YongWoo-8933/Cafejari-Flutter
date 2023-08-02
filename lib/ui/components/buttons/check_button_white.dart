import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckButtonWhite extends StatelessWidget { // 크기가 더 작아질시 icon크기 조절 필요
  final double? buttonSize;
  final Function? onPressed;

  CheckButtonWhite({
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
        backgroundColor: AppColor.white,
        child: const Icon(
          CupertinoIcons.check_mark,
          color: AppColor.primary,
          size: 15,
        ),
      ),
    );
  }
}
