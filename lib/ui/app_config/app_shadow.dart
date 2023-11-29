
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:flutter/widgets.dart';

class AppShadow {
  static final box = [
    BoxShadow(
      color: AppColor.grey_500.withOpacity(0.4),
      blurRadius: 5,
      spreadRadius: 2,
      offset: const Offset(2, 3),
    )
  ];
}