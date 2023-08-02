import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:flutter/material.dart';

class CustomSnackBar extends SnackBar {
  CustomSnackBar({
    Key? key,
    required Widget content,
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
    Color backgroundColor = AppColor.brown_300,
    double elevation = 6.0,
    TextStyle contentTextStyle = const TextStyle(fontSize: 16.0),
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(horizontal: 16.0),
    ShapeBorder shape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    SnackBarBehavior behavior = SnackBarBehavior.floating,
  }) : super(
    key: key,
    content: content,
    duration: duration,
    action: action,
    backgroundColor: backgroundColor,
    elevation: elevation,
    padding: padding,
    shape: shape,
    behavior: behavior,
  );
}
