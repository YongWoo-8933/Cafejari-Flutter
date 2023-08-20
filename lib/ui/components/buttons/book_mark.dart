import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookmarkButton extends StatelessWidget {
  final bool isBookmarked;
  final double? buttonSize;
  final VoidCallback? onPressed;

  const BookmarkButton({super.key,
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
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isBookmarked ? AppColor.secondary : AppColor.grey_300,
          elevation: 0,
          shape: const CircleBorder(),
          padding: AppPadding.padding_0
        ),
        child: const Icon(
          CupertinoIcons.heart,
          color: AppColor.white,
          size: 16,
        ),
      ),
    );
  }
}
