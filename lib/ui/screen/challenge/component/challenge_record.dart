import 'package:cafejari_flutter/domain/entity/challenge/challenge.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/screen/challenge/component/challenge_record_block.dart';
import 'package:flutter/material.dart';

class ChallengeRecord extends StatelessWidget {
  final Challenger challenger;

  const ChallengeRecord({super.key, required this.challenger});

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double tableWidth = deviceWidth - 40;

    return Container(
      padding: AppPadding.padding_20,
      color: AppColor.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("내가 받은 포인트", style: TextSize.textSize_16),
          const VerticalSpacer(12),
          const Divider(height: 1, color: AppColor.primary, thickness: 1),
          Container(
            color: AppColor.grey_100,
            height: 48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildHeaderCell(tableWidth / 3, "적용일자"),
                _buildHeaderCell(tableWidth / 3, "적용내역"),
                _buildHeaderCell(tableWidth / 3, "포인트"),
              ],
            ),
          ),
          ...challenger.points.map((e) => ChallengeRecordBlock(width: tableWidth, challengePoint: e)).toList()
        ],
      ),
    );
  }

  Container _buildHeaderCell(double width, String text) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: 48,
      child: Text(text, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
    );
  }
}