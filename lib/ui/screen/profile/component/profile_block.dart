import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileBlock extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;

  ProfileBlock({
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.white,
          side: const BorderSide(
            color: AppColor.secondary, // 테두리 색을 지정합니다.
            width: 2.0, // 테두리 두께를 설정합니다.
          )
      ),
      child: Container(
        padding: AppPadding.padding_10,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: AppColor.unselectedTextColor
            )
          )
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextSize.textSize_14,
              ),
            ]
        ),
      ),
    );
  }
}
