import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:flutter/material.dart';

class ActionButtonSecondary extends StatelessWidget {
  final double buttonWidth;
  final double buttonHeight;
  final VoidCallback? onPressed;
  final String title;
  final bool isClicked;
  final IconData? icon;

  const ActionButtonSecondary({super.key,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.title,
    required this.isClicked,
    this.onPressed,
    this.icon
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
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonHeight / 2),
          ),
          side: const BorderSide(
            color: AppColor.secondary, // 테두리 색을 지정합니다.
            width: 1, // 테두리 두께를 설정합니다.
          )
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: AppColor.white),
                const HorizontalSpacer(8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
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
