import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:flutter/material.dart';

class DayButton extends StatelessWidget {
  final double buttonWidth;
  final double buttonHeight;
  final VoidCallback? onPressed;
  final String title;
  final bool isClicked;

  const DayButton({
    Key? key,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.title,
    required this.isClicked,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isClicked ? AppColor.secondary : AppColor.white,
          borderRadius: BorderRadius.circular(buttonHeight / 2),
          border: Border.all(
            color: AppColor.secondary,
            width: 1,
          )
        ),
        width: buttonWidth,
        height: buttonHeight,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: isClicked ? AppColor.white : AppColor.secondary,
          ),
        ),
      ),
    );
  }
}
