import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/duration.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ActionButtonPrimary extends StatelessWidget {
  final double? buttonWidth;
  final double? buttonHeight;
  final VoidCallback? onPressed;
  final String title;
  final IconData? icon;
  final bool? isLoading;

  const ActionButtonPrimary({super.key,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.title,
    this.onPressed,
    this.icon,
    this.isLoading
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
          disabledBackgroundColor: AppColor.grey_300.withOpacity(0.9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonHeight ?? 0 / 2),
          ),
        ),
        child: AnimatedCrossFade(
          duration: AppDuration.animationDefault,
          firstChild: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon.isNotNull) Icon(icon, color: AppColor.white),
                Text(
                  title,
                  style: TextSize.textSize_white_14,
                ),
              ],
            ),
          ),
          secondChild: LoadingAnimationWidget.hexagonDots(color: AppColor.white, size: 16),
          crossFadeState: isLoading == true ? CrossFadeState.showSecond : CrossFadeState.showFirst
        ),
      ),
    );
  }
}