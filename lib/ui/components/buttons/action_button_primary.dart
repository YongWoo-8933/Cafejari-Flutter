import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionButtonPrimary extends StatelessWidget {
  final double? buttonWidth;
  final double? buttonHeight;
  final VoidCallback? onPressed;
  final String title;
  final IconData? icon;

  const ActionButtonPrimary({super.key,
    required this.buttonWidth,
    required this.buttonHeight,
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
          backgroundColor: AppColor.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonHeight ?? 0 / 2),
          ),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) // Conditionally add Icon widget
                Icon(icon, color: AppColor.white),
              Text(
                title,
                style: TextSize.textSize_white_14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}