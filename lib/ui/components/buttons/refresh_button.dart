import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RefreshButton extends StatelessWidget { // 크기가 더 작아질시 icon크기 조절 필
  final double? buttonSize;
  final Function? onPressed;

  RefreshButton({
    required this.buttonSize,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonSize,
      height: buttonSize,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: AppColor.secondary,
              width: 1.0
          )
      ),
      child: FloatingActionButton(
        onPressed: () {
          if (onPressed != null) {
            onPressed!(); // 콜백 함수 호출
          }
        },
        backgroundColor: AppColor.white,
        child: const Icon(
          CupertinoIcons.arrow_2_circlepath,
          color: AppColor.secondary,
          size: 15,
        ),
      ),
    );
  }
}
