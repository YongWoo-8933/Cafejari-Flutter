import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PointRecord extends StatelessWidget {
  final  String title;

  const PointRecord({super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width - 60;

    return Container(
      padding: AppPadding.padding_30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextSize.textSize_16),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildHeaderCell(deviceWidth, "적용일자"),
              _buildHeaderCell(deviceWidth, "적용내역"),
              _buildHeaderCell(deviceWidth, "포인트"),
            ],
          ),
        ],
      ),
    );
  }

  Container _buildHeaderCell(double width, String text) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColor.challengeBlock,
        border: Border(
          top: BorderSide(
            color: AppColor.black,
            width: 1.0,
          ),
        ),
      ),
      alignment: Alignment.center,
      width: width / 3,
      height: 50,
      child: Text(text, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
    );
  }
}