import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/screen/challenge/component/challenge_record_block.dart';
import 'package:cafejari_flutter/ui/screen/challenge/component/challenge_small_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopMyBrandCon extends StatelessWidget {

  const ShopMyBrandCon({super.key});

  @override
  Widget build(BuildContext context) {
    final double blockWidth = MediaQuery.of(context).size.width - 60;

    return Container(
      padding: AppPadding.padding_30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBlockCell('asset/image/testimage.png', "스타벅스", "아이스 아메리카노", "2023-01-01 ~ 2023-01-03", blockWidth),
          VerticalSpacer(20),
          _buildBlockCell('asset/image/testimage.png', "스타벅스", "아이스 아메리카노", "2023-01-01 ~ 2023-01-03", blockWidth),
          VerticalSpacer(20),
          _buildBlockCell('asset/image/testimage.png', "스타벅스", "아이스 아메리카노", "2023-01-01 ~ 2023-01-03", blockWidth),
          VerticalSpacer(20),
          _buildBlockCell('asset/image/testimage.png', "스타벅스", "아이스 아메리카노", "2023-01-01 ~ 2023-01-03", blockWidth),
          VerticalSpacer(20),
          _buildBlockCell('asset/image/testimage.png', "스타벅스", "아이스 아메리카노", "2023-01-01 ~ 2023-01-03", blockWidth),
          VerticalSpacer(20),
          _buildBlockCell('asset/image/testimage.png', "스타벅스", "아이스 아메리카노", "2023-01-01 ~ 2023-01-03", blockWidth),
          VerticalSpacer(20),

        ],
      ),
    );
  }

  Container _buildBlockCell(String image, String brand, String title, String period, double width) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: 100,
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color:AppColor.grey_200,
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect( // 모서리를 둥글게 하기 위해 ClipRRect 사용
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(image, fit: BoxFit.cover),
            ),
          ),
          HorizontalSpacer(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(brand, style: TextStyle(color: AppColor.secondary, fontSize: 14, fontWeight: FontWeight.bold)),
                  Text(title,style: TextSize.textSize_bold_16),
                ],
              ),
              Text(period, style: TextSize.textSize_grey_12)
            ],
          )
        ],
      ),
    );
  }
}