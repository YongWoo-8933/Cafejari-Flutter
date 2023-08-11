import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:flutter/material.dart';

class ChallengeRecordBlock extends StatelessWidget {
  final String updateTime;
  final int point;
  final String? activityName;

  ChallengeRecordBlock({
    required this.updateTime,
    required this.point,
    this.activityName,
  });

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width - 60;

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildCell(deviceWidth, updateTime),
          _buildCell(deviceWidth, activityName ?? "혼잡도 공유 활동"),
          _buildCell(deviceWidth, "${point}p"),
        ],
      ),
    );
  }

  Container _buildCell(double width, String text) {
    return Container(
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: AppColor.background,
            width: 1.0,
          ),
        ),
      ),
      alignment: Alignment.center,
      width: width / 3,
      height: 50,
      child: Text(text, style: TextSize.textSize_12),
    );
  }
}
