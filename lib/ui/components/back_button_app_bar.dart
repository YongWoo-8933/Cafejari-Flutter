
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BackButtonAppBar extends AppBar {
  final String? backButtonText;
  final VoidCallback? onBack;
  final Color backGroundColor;

  BackButtonAppBar({
    super.key,
    this.backButtonText,
    this.onBack,
    required this.backGroundColor
  }) : super(
    leading: Row(
      children: [
        IconButton(
            onPressed: onBack,
            icon: const Icon(CupertinoIcons.left_chevron, color: AppColor.black)
        ),
        Visibility(
            visible: backButtonText.isNotNull,
            child: Text(backButtonText ?? "", style: TextSize.textSize_16)
        )
      ]
    ),
    leadingWidth: 160,
    elevation: 0,
    scrolledUnderElevation: 1.0,
    backgroundColor: backGroundColor,
  );
}
