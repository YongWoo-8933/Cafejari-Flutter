import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecommendCard extends StatelessWidget {
  final String cafeName;
  final String? cafeCrowded;
  final String? cafePlug;
  final VoidCallback? onPressed;
  final String? cafeImage;

  RecommendCard({
    required this.cafeName,
    this.cafeCrowded,
    this.cafePlug,
    this.onPressed,
    this.cafeImage
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppPadding.padding_7,
      padding: AppPadding.padding_10,
      decoration: BoxDecoration(
        color: AppColor.background,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColor.grey_400.withOpacity(0.5), // Shadow color and opacity
            blurRadius: 5, // Spread of the shadow
            offset: Offset(1, 1),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(cafeImage ?? " ")
              ),
            ),
          ),
          SizedBox(height: 6),
          Text("#대표태그", style: TextSize.textSize_grey_12),
          Text(cafeName, style: TextSize.textSize_bold_16),
          SizedBox(height: 10),
          Row(
            children: [
              Image.asset("asset/image/icon_people4_black.png"),
              Text(" 혼잡도 ", style: TextSize.textSize_grey_12),
              Text(cafeCrowded ?? "정보없음", style: TextSize.textSize_bold_12),
            ],
          ),
          Row(
            children: [
              Image.asset("asset/image/icon_plug.png"),
              Text(" 콘센트 ", style: TextSize.textSize_grey_12),
              Text(cafePlug ?? "정보없음", style: TextSize.textSize_bold_12),
            ],
          ),
        ],
      ),
    );
  }
}
