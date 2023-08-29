import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {

  CustomAlertDialog({super.key, });

  @override
  Widget build(BuildContext context) {
    return AlertDialog();
  }

  void showTimed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        final alertDialog = AlertDialog(
          content: Container(
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: AppColor.primary),
            child: const Column(
              children: [
                Icon(CupertinoIcons.check_mark, size: 20),
                Text(
                  "가입 완료",
                  style: TextSize.textSize_white_20,
                )
              ],
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor: AppColor.primary,
        );

        Future.delayed(Duration(seconds: 1), () {
          Navigator.of(context).pop(); // AlertDialog를 닫습니다.
        });

        return alertDialog;
      },
    );
  }
}