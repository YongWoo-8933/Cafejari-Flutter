import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/buttons/close_button.dart';
import 'package:cafejari_flutter/ui/components/buttons/x_button.dart';
import 'package:cafejari_flutter/ui/components/cati_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CATIDialog extends StatelessWidget {
  final String title, subTitle, leftButton, rightButton;
  final Function? leftButtonPressed, rightButtonPressed;
  final double cati1, cati2, cati3, cati4;

  CATIDialog({
    required this.title,
    required this.subTitle,
    required this.leftButton,
    required this.rightButton,
    required this.cati1,
    required this.cati2,
    required this.cati3,
    required this.cati4,
    this.leftButtonPressed,
    this.rightButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      // backgroundColor: AppColor.primary,
    );
  }


  void showTimed(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;

    showDialog(
      context: context,
      builder: (context) {
        final alertDialog = Dialog(
          elevation: 0,
          backgroundColor: AppColor.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            padding: AppPadding.padding_20,
            width: deviceWidth - 60,
            height: 550,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 4,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 16,
                              height: 1.5,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ),
                      const Flexible(
                          flex: 1,
                          child: XButton(buttonSize: 20)
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(subTitle, style: TextSize.textSize_bold_16),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("아늑함", style: TextSize.textSize_bold_16),
                        Text("개방적", style: TextSize.textSize_bold_16)
                      ],
                    ),
                    CATISlider(
                        value: cati1 ,
                        onChanged: (double newValue) {
                          // mapViewModel.changeUpdatedCrowded(newValue);
                        },
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("아늑함", style: TextSize.textSize_bold_16),
                        Text("개방적", style: TextSize.textSize_bold_16)
                      ],
                    ),
                    CATISlider(
                        value: cati1 ,
                        onChanged: (double newValue) {
                          // mapViewModel.changeUpdatedCrowded(newValue);
                        },
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("아늑함", style: TextSize.textSize_bold_16),
                        Text("개방적", style: TextSize.textSize_bold_16)
                      ],
                    ),
                    CATISlider(
                        value: cati1 ,
                        onChanged: (double newValue) {
                          // mapViewModel.changeUpdatedCrowded(newValue);
                        },
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("아늑함", style: TextSize.textSize_bold_16),
                        Text("개방적", style: TextSize.textSize_bold_16)
                      ],
                    ),
                    CATISlider(
                        value: cati1 ,
                        onChanged: (double newValue) {
                          // mapViewModel.changeUpdatedCrowded(newValue);
                        },
                    ),
                  ],
                ),

                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ActionButtonPrimary(
                          buttonWidth: (deviceWidth - 60) / 2 - 40,
                          buttonHeight: 50,
                          title: leftButton,
                          onPressed: () => {}),
                      ActionButtonPrimary(
                          buttonWidth: (deviceWidth - 60) / 2 - 40,
                          buttonHeight: 50,
                          title: rightButton,
                          onPressed: () => {})
                    ],
                  ),
                )
              ],
            ),
          ),
        );

        Future.delayed(Duration(seconds: 10), () {
          Navigator.of(context).pop(); // AlertDialog를 닫습니다.
        });

        return alertDialog;
      },
    );
  }
}
