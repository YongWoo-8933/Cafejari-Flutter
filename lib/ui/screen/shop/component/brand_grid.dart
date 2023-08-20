import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/screen/challenge/component/challenge_record_block.dart';
import 'package:cafejari_flutter/ui/screen/challenge/component/challenge_small_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BrandGrid extends StatelessWidget {

  const BrandGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final double gridWidth = MediaQuery.of(context).size.width - 80;

    return Container(
      padding: AppPadding.padding_30,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2개의 열로 배치
          crossAxisSpacing: 10.0, // 열 간의 간격
          mainAxisSpacing: 30.0, // 행 간의 간격
        ),
        itemCount: 10, // 전체 아이템 수
        itemBuilder: (context, index) {
          return _buildBlockCell("asset/image/testimage.png","스타벅스 아메리카노", 4000, gridWidth, null);
        },
      ),
    );

  }

  Container _buildBlockCell(String image, String title, int price, double width, int? discount) {
    return Container(
      alignment: Alignment.center,
      width: width / 2,
      height: 230,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: width / 2,
            height: width / 2 - 40,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextSize.textSize_14),
              Row(
                children: [
                  Text("${price}", style: TextSize.textSize_bold_16)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}