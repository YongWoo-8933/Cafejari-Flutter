import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/duration.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ShareButton extends StatelessWidget {
  final double? buttonSize;
  final bool isLoading;
  final Function? onPressed;

  const ShareButton({super.key,
    required this.buttonSize,
    required this.isLoading,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonSize,
      height: buttonSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: ElevatedButton(
        onPressed: () {
          if (onPressed != null) {
            onPressed!(); // 콜백 함수 호출
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primary,
          padding: AppPadding.padding_0,
          shape: const CircleBorder(),
        ),
        child: AnimatedCrossFade(
          firstChild: const Icon(
            CupertinoIcons.paperplane,
            color: AppColor.white,
            size: 16,
          ),
          secondChild: LoadingAnimationWidget.hexagonDots(color: AppColor.white, size: 16),
          crossFadeState: isLoading ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: AppDuration.animationDefault
        ),
      ),
    );
  }
}
