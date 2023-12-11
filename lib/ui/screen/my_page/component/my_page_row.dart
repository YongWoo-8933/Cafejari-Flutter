import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:flutter/material.dart';

class MyPageRow extends StatelessWidget {
  final String text;
  final double width;
  final VoidCallback? onPress;

  const MyPageRow({
    super.key,
    required this.text,
    required this.width,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width,
            padding: const EdgeInsets.symmetric(vertical: 16),
            color: AppColor.white,
            alignment: Alignment.centerLeft,
            child: Text(text, style: TextSize.textSize_14),
          ),
          const Divider(height: 1, thickness: 1, color: AppColor.myPageDividerGrey)
        ],
      ),
    );
  }
}