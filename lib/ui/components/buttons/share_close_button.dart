import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShareCloseButton extends StatelessWidget {
  final double? buttonWidth;
  final double? buttonHeight;
  final String floor;
  final int occupancyRate;
  final VoidCallback? onPressed;

  ShareCloseButton({
    required this.buttonWidth,
    required this.buttonHeight,
    required this.floor,
    required this.occupancyRate,
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
          backgroundColor: AppColor.onSecondaryContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              floor,
              style: const TextStyle(color: AppColor.secondary, fontSize: 12),
            ),
            Text("${occupancyRate}", style: TextSize.textSize_bold_12),
            Icon(CupertinoIcons.xmark)
          ]),
        ),
      ),
    );
  }
}
