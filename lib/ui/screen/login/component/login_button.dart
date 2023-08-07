import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final double? buttonWidth;
  final double? buttonHeight;
  final Color buttonColor;
  final VoidCallback? onPressed;
  final Text title;
  final Image? icon; // Image 타입으로 변경합니다.

  const LoginButton({
    super.key,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.buttonColor,
    required this.title,
    this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonHeight ?? 0 / 2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 12.0, left: 8.0),
                child: icon!, // Image 위젯을 그대로 아이콘으로 사용합니다.
              ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: title,
            ),
          ],
        ),
      ),
    );
  }
}
