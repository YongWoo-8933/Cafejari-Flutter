import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/buttons/x_button.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:flutter/material.dart';

class SquareAlertDialog extends AlertDialog {
  final String text, negativeButtonText, positiveButtonText;
  final VoidCallback onDismiss, onNegativeButtonPress, onPositiveButtonPress;

  SquareAlertDialog({
    VoidCallback? onXButtonPress,
    super.key,
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
      width: 300,
      padding: const EdgeInsets.only(top: 8, left: 24, right: 10, bottom: 20),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24, right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.2,
                  )
                ),
                const VerticalSpacer(30),
                Row(
                  children: [
                    SizedBox(
                      width: 121,
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
                        buttonWidth: 121,
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
          ),
          Visibility(
            visible: onXButtonPress.isNotNull,
            child: XButton(buttonSize: 24, onPressed: onXButtonPress)
          )
        ]
      ),
    )
  );
}
