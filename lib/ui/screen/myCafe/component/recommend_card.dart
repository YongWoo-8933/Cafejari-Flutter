import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecommendCard extends StatelessWidget {
  final String cafeName;
  final String cafeCrowded;
  final String cafePlug;
  final VoidCallback? onPressed;
  final String? cafeImage;

  RecommendCard({
    required this.cafeName,
    required this.cafeCrowded,
    required this.cafePlug,
    this.onPressed,
    this.cafeImage
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColor.grey_300.withOpacity(0.5), // Shadow color and opacity
            blurRadius: 8, // Spread of the shadow
            offset: Offset(0, 3),
          )
        ]
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
              Image.asset("asset/image/"),
              Text("혼잡도", style: TextSize.textSize_grey_12),
              Text(cafeCrowded, style: TextSize.textSize_bold_12)
            ],
          ),
          Row(
            children: [
              Image.asset("asset/image/"),
              Text("콘센트", style: TextSize.textSize_grey_12),
              Text(cafePlug, style: TextSize.textSize_bold_12)
            ],
          ),
        ],
      ),
    );
  }
}
