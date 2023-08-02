import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionButtonSecondary extends StatelessWidget {
  final double? buttonWidth;
  final double? buttonHeight;
  final VoidCallback? onPressed;
  final String title;
  final bool isClicked;

  ActionButtonSecondary({
    required this.buttonWidth,
    required this.buttonHeight,
    required this.title,
    required this.isClicked,
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
          backgroundColor: isClicked? AppColor.secondary : AppColor.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          side: const BorderSide(
            color: AppColor.secondary, // 테두리 색을 지정합니다.
            width: 2.0, // 테두리 두께를 설정합니다.
          )
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isClicked? AppColor.white : AppColor.secondary
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }
}
