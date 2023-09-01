import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:flutter/material.dart';

class SquareAlertDialog extends AlertDialog {
  final String text, negativeButtonText, positiveButtonText;
  final VoidCallback onDismiss, onNegativeButtonPress, onPositiveButtonPress;

  SquareAlertDialog({super.key,
    required this.text,
    required this.negativeButtonText,
    required this.positiveButtonText,
    required this.onDismiss,
    required this.onNegativeButtonPress,
    required this.onPositiveButtonPress,
  }): super(
    backgroundColor: AppColor.white,
    elevation: 3,
    contentPadding: AppPadding.padding_0,
    titlePadding: AppPadding.padding_0,
    actionsPadding: AppPadding.padding_0,
    insetPadding: AppPadding.padding_0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    content: Container(
      width: 330,
      height: 170,
      padding: AppPadding.padding_20,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 330,
            height: 60,
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              style: TextSize.textSize_16,
              maxLines: 3,
            ),
          ),
          const VerticalSpacer(22),
          Row(
            children: [
              SizedBox(
                width: 140,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    onNegativeButtonPress();
                    onDismiss();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    side: const BorderSide(
                      color: AppColor.grey_300,
                      width: 1,
                    )
                  ),
                  child: Text(
                    negativeButtonText,
                    style: TextSize.textSize_14
                  ),
                ),
              ),
              const HorizontalSpacer(10),
              ActionButtonPrimary(
                buttonWidth: 140,
                buttonHeight: 48,
                title: positiveButtonText,
                onPressed: () {
                  onPositiveButtonPress();
                  onDismiss();
                }
              )
            ],
          )
        ],
      ),
    )
  );
}
