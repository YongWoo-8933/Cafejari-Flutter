import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPageBlock extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;

  MyPageBlock({
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.white,
        padding: EdgeInsets.zero, // Padding을 여기서 설정합니다.
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColor.unselectedTextColor,
              width: 1.0,
            ),
          ),
          color: AppColor.white
        ),
        child: Padding(
          padding: AppPadding.padding_10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextSize.textSize_14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
