import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/x_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';


class OccupancyPredictionDescriptionDialog extends ConsumerWidget {
  const OccupancyPredictionDescriptionDialog({Key? key}) : super(key: key);

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
                const Row(
                  children: [
                    Text("현재 표시되는 정보는 "),
                    Text("예상 혼잡도", style: TextSize.textSize_bold_14),
                    Text("입니다.")
                  ],
                ),
                const Text("실제 정보와 다를 수 있으니, 직접 혼잡도를 등록하여 정확한 정보를 공유해보세요!"),
              ],
            ),
          );
        }
      ),
    );
  }
}