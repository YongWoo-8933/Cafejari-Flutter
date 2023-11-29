import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RefreshButton extends StatelessWidget { // 크기가 더 작아질시 icon크기 조절 필
  final double buttonSize;
  final VoidCallback onPressed;

  const RefreshButton({super.key,
    required this.buttonSize,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonSize,
      height: buttonSize,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: AppColor.secondary,
              width: 1.0
          )
      ),
      child: SizedBox(
        width: buttonSize,
        height: buttonSize,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(buttonSize / 2),
              ),
              elevation: 1.0,
              padding: AppPadding.padding_0
          ),
          child: Icon(
              CupertinoIcons.arrow_2_circlepath,
            size: buttonSize / 2,
            color: AppColor.secondary,
          ),
        ),
      ),
    );
  }
}
