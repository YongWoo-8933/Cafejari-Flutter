import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/x_button.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';


class CATIDescriptionDialog extends ConsumerWidget {
  const CATIDescriptionDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      elevation: 0,
      backgroundColor: AppColor.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 40),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 15, bottom: 30),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: XButton(
                    buttonSize: 24,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                const Text("CATI란?", style: TextSize.textSize_bold_20),
                const VerticalSpacer(25),
                const Row(
                  children: [
                    Text("CA", style: TextSize.textSize_bold_14),
                    Text("fe "),
                    Text("T", style: TextSize.textSize_bold_14),
                    Text("ype "),
                    Text("I", style: TextSize.textSize_bold_14),
                    Text("ndicator의 약자로,"),
                  ],
                ),
                const VerticalSpacer(15),
                const Text("사람들의 성격을 알기쉽게 분류한 MBTI처럼, 카페의 대략적인 특징을 한눈에 알기 쉽게 정리한 분류체계에요."),
              ],
            ),
          );
        }
      ),
    );
  }
}