import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:flutter/material.dart';

class ActionButtonPrimary extends StatelessWidget {
  final double? buttonWidth;
  final double? buttonHeight;
  final VoidCallback? onPressed;
  final String title;
  final Widget? icon; // Changed type to Widget
  final bool primaryColor;

  ActionButtonPrimary({
    required this.buttonWidth,
    required this.buttonHeight,
    required this.title,
    required this.primaryColor,
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
          backgroundColor: primaryColor ? AppColor.primary : AppColor.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonHeight ?? 0 / 2),
            side: BorderSide(color: AppColor.grey_300, width: 1.0),
          ),
          elevation: 0,
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) // Conditionally add Icon widget
                Padding(
                  padding: const EdgeInsets.only(right: 8.0), // Adjust as needed
                  child: icon!,
                ),
              Text(
                title,
                style: TextStyle(fontSize: 20, color: primaryColor ? AppColor.white : AppColor.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
