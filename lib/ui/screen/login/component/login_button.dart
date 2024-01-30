import 'package:cafejari_flutter/ui/app_config/duration.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginButton extends StatelessWidget {
  final double? buttonWidth;
  final double? buttonHeight;
  final Color textColor;
  final Color backgroundColor;
  final Color loadingColor;
  final VoidCallback? onPressed;
  final String imagePath;
  final String text;
  final bool isLoading;
  final String heroTag;

  const LoginButton({
    super.key,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.textColor,
    required this.backgroundColor,
    required this.loadingColor,
    required this.text,
    required this.imagePath,
    required this.isLoading,
    required this.onPressed,
    required this.heroTag
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: FloatingActionButton(
        heroTag: heroTag,
        foregroundColor: textColor,
        backgroundColor: backgroundColor,
        onPressed: onPressed,
        elevation: 1,
        focusElevation: 0,
        hoverElevation: 0,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonHeight ?? 0 / 2),
        ),
        child: Stack(
          children: [
            AnimatedOpacity(
              opacity: isLoading ? 1.0 : 0.0,
              duration: AppDuration.animationDefault,
              child: Center(
                child: LoadingAnimationWidget.hexagonDots(color: loadingColor, size: 20)
              ),
            ),
            AnimatedOpacity(
              opacity: isLoading ? 0.0 : 1.0,
              duration: AppDuration.animationDefault,
              child: Row(
                children: [
                  Padding(
                    padding: AppPadding.padding_horizon_20,
                    child: Image.asset(imagePath), // Image 위젯을 그대로 아이콘으로 사용합니다.
                  ),
                  Center(
                    child: Text(
                      text,
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 14
                      )
                    )
                  ),
                ]
              ),
            ),
          ]
        )
      ),
    );
  }
}
