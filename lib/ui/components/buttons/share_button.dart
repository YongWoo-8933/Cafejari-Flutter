import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShareButton extends StatelessWidget {
  final double? buttonSize;
  final Function? onPressed;

  const ShareButton({super.key,
    required this.buttonSize,
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
        child: const Icon(
          CupertinoIcons.paperplane,
          color: AppColor.white,
          size: 16,
        ),
      ),
    );
  }
}
