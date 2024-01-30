import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:flutter/material.dart';

class LeaderBoardMyRanking extends StatelessWidget {
  final String title;
  final int? myRanking;

  const LeaderBoardMyRanking({
    required this.title,
    this.myRanking,
    Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(color: AppColor.grey_300, height: 1, indent: 20),
        const VerticalSpacer(30),
        Column(
          children: [
            Text(title, style: TextSize.textSize_12),
            const VerticalSpacer(10),
            Text(myRanking.isNotNull ? "$myRanking위" : "순위 없음", style: TextSize.textSize_bold_16_w700)
          ],
        ),
        const VerticalSpacer(30),
        const Divider(color: AppColor.grey_300, height: 1, indent: 20),
      ],
    );
  }
}