import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileEditButton extends StatelessWidget { // 크기가 더 작아질시 icon크기 조절 필
  final double? buttonSize;
  final Function? onPressed;

  ProfileEditButton({
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
          CupertinoIcons.pencil,
          color: AppColor.secondary,
          size: 15,
        ),
      ),
    );
  }
}
