import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SquareAlertDialog extends StatelessWidget {
  final String title, leftButton, rightButton;
  final Function? leftButtonPressed, rightButtonPressed;
  final Widget content;

  SquareAlertDialog({
    required this.content,
    required this.title,
    required this.leftButton,
    required this.rightButton,
    this.leftButtonPressed,
    this.rightButtonPressed
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: content,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      backgroundColor: AppColor.primary,
    );
  }


  void showTimed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        final alertDialog = AlertDialog(
          content: content,
          actions: [
            ElevatedButton(
                onPressed: () => leftButtonPressed,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Text(leftButton, style: TextSize.textSize_16),
                )
            ),
            ElevatedButton(
                onPressed: () => rightButtonPressed,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.primary
                  ),
                  child: Text(rightButton, style: TextSize.textSize_16),
                )
            )
          ],
        );

        Future.delayed(Duration(seconds: 1), () {
          Navigator.of(context).pop(); // AlertDialog를 닫습니다.
        });

        return alertDialog;
      },
    );
  }
}
