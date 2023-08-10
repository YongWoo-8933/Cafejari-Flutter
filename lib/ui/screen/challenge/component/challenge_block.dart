import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/screen/challenge/component/challenge_small_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChallengeBlock extends StatelessWidget {
  final String challengeImage;
  final String title;
  final int point;
  final VoidCallback? onPressed;
  final double width, height;

  ChallengeBlock({
    required this.challengeImage,
    required this.title,
    required this.point,
    required this.width,
    required this.height,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            width: width,
            height: height * 0.7,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColor.grey_300.withOpacity(0.5),
                  blurRadius: 10, // 그림자 번짐 정도 조절
                  offset: Offset(0, 3), // 그림자 위치 조정
                ),
              ],
              // color: AppColor.secondary, // 배경색을 주석 처리하거나 투명하게 설정
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Image.asset(
                'asset/image/testimage.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 5),
            width: width,
            height: height*0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: AppColor.grey_300.withOpacity(0.5), // 그림자 색상과 불투명도
                  blurRadius: 5, // 그림자 번짐 정도
                  offset: Offset(1, 1), // 그림자 위치 조정
                ),
              ],
              color: AppColor.white,
            ),
            padding: AppPadding.padding_10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${point}포인트 지급",
                  style: TextStyle(color: AppColor.secondary, fontSize: 14),
                ),
                SizedBox(height: 5),
                Text(title, style: TextSize.textSize_bold_16),
                SizedBox(height: 5),
                ChallengeSmallProfile(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
