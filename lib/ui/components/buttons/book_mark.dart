import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookmarkButton extends StatelessWidget {
  final bool isBookmarked;
  final double? buttonSize;
  final Function? onPressed;

  BookmarkButton({
    required this.isBookmarked,
    required this.buttonSize,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonSize,
      height: buttonSize,
      decoration: const BoxDecoration(
        shape: BoxShape.circle
      ),
      child: FloatingActionButton(
        onPressed: () {
          if (onPressed != null) {
            onPressed!(); // 콜백 함수 호출
          }
        },
        backgroundColor: isBookmarked ? AppColor.secondary : AppColor.bookMark,
        child: const Icon(
          CupertinoIcons.heart,
          color: AppColor.white,
          size: 15,
        ),
      ),
    );
  }
}
