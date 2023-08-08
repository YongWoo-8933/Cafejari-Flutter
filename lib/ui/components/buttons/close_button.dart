import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CloseButton extends StatelessWidget {
  final double? buttonWidth;
  final double? buttonHeight;
  final VoidCallback? onPressed;

  CloseButton({
    required this.buttonWidth,
    required this.buttonHeight,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          side: const BorderSide(
            color: AppColor.primary, // 테두리 색을 지정합니다.
            width: 1.0, // 테두리 두께를 설정합니다.
          )
        ),
        child: const FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "닫기",
                  style: TextSize.textSize_14,
                ),
              ]
          ),
        ),
      ),
    );
  }
}
