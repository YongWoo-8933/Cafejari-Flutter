import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class XButton extends StatelessWidget {
  final double? buttonSize;
  final Function? onPressed;

  const XButton({
    Key? key,
    required this.buttonSize,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonSize,
      height: buttonSize,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: FloatingActionButton(
        heroTag: "x_button",
        onPressed: () {
          if (onPressed != null) {
            onPressed!(); // 콜백 함수 호출
          }
        },
        elevation: 0, // 그림자 제거
        backgroundColor: AppColor.white,
        child: Icon(
          CupertinoIcons.xmark,
          color: AppColor.black,
          size: buttonSize! * 0.7,
        ),
      ),
    );
  }
}
