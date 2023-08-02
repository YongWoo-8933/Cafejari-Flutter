import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends AlertDialog {

  CustomAlertDialog({
    Key? key,
    Widget? content,
    EdgeInsets insetPadding = const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
  }) : super(
    key: key,
    content: content,
    insetPadding: insetPadding,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    backgroundColor: AppColor.primary,
  );

  // 일정 시간이 지난 후에 AlertDialog를 닫기 위해 Future.delayed 사용
  static void showTimed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        final alertDialog = CustomAlertDialog(
          content: Column(
            children: [
              Icon(CupertinoIcons.check_mark, size: 20),
              Text("가입 완료", style: TextSize.textSize_white_20,)
            ],
          ),
        );

        Future.delayed(Duration(seconds: 1), () {
          Navigator.of(context).pop(); // AlertDialog를 닫습니다.
        });

        return alertDialog;
      },
    );
  }
}