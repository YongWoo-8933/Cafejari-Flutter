import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:flutter/material.dart';

class ChallengeRecordBlock extends StatelessWidget {
  final double width;
  final String updateTime;
  final int point;
  final String activityName;

  const ChallengeRecordBlock({super.key,
    required this.width,
    required this.updateTime,
    required this.point,
    required this.activityName,
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
              _buildCell(width / 3, updateTime),
              _buildCell(width / 3, activityName),
              _buildCell(width / 3, "${point}p"),
            ],
          ),
          const Divider(height: 1, color: AppColor.grey_200, thickness: 1)
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
