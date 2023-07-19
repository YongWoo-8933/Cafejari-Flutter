import 'package:flutter/material.dart';

class CustomAlertDialog extends AlertDialog {
  CustomAlertDialog({
    Key? key,
    Widget? title,
    Widget? content,
    List<Widget>? actions,
    EdgeInsets insetPadding = const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
    EdgeInsets? contentPadding,
    ShapeBorder? shape,
    Color? backgroundColor,
    double? elevation,
  }) : super(
    key: key,
    title: title,
    content: content,
    actions: actions,
    insetPadding: insetPadding,
    contentPadding: contentPadding,
    shape: shape,
    backgroundColor: backgroundColor,
    elevation: elevation,
  );
}

