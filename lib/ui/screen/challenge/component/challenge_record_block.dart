import 'package:cafejari_flutter/domain/entity/challenge/challenge.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:flutter/material.dart';

class ChallengeRecordBlock extends StatelessWidget {
  final double width;
  final ChallengePoint challengePoint;

  const ChallengeRecordBlock({super.key,
    required this.width,
    required this.challengePoint,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      color: AppColor.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCell(width / 3, challengePoint.rewardedAt.toString().substring(0, 11)),
              _buildCell(width / 3, challengePoint.description),
              _buildCell(width / 3, "${challengePoint.point}p"),
            ],
          ),
          const Divider(height: 1, color: AppColor.grey_100, thickness: 1)
        ],
      ),
    );
  }

  Container _buildCell(double width, String text) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: 48,
      child: Text(text, style: TextSize.textSize_12),
    );
  }
}
