import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChallengeSlider extends StatelessWidget {
  final List<int> challengePoint;
  final List<int> challengeTarget;
  final double? currentProgress;

  ChallengeSlider({
    required this.challengePoint,
    required this.challengeTarget,
    this.currentProgress
  });

  @override
  Widget build(BuildContext context) {
    double progressWidth;

    if (currentProgress.isNotNull && challengeTarget.last != 0) {
      progressWidth = (MediaQuery.of(context).size.width - 60) * (currentProgress! / challengeTarget.last);
    } else if(currentProgress == 0.0){
      progressWidth = (MediaQuery.of(context).size.width - 60) * (1 / challengeTarget.last);
    }else{
      progressWidth = 1;
    }
    return Container(
      child: Column( //말충선
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: progressWidth+63 ,
            alignment: Alignment.topRight,
            child: Stack(
              children: [
                Image.asset(
                  'asset/image/icon_speech_bubble.png',
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 12,
                  left: currentProgress.isNotNull && currentProgress! >= 10 ? 24 : 27,
                  child: Text(
                    "${currentProgress?.floor()}회",
                    style: TextSize.textSize_bold_white_14,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 6),
          Container( // 핀
            width: progressWidth+34,
            alignment: Alignment.topRight,
            child: Image.asset('asset/image/cafe_icon_0.png', width: 17, height: 22),
          ),
          SizedBox(height: 6),
          Container(
            alignment: Alignment.centerLeft,
            width: MediaQuery.of(context).size.width - 60,
            margin: AppPadding.padding_horizon_30,
            height: 20,
            decoration: BoxDecoration(
              color: AppColor.background,
              borderRadius: BorderRadius.circular(20)
            ),
            child: Container(
              width: progressWidth,
                decoration: BoxDecoration(
                    color: AppColor.secondary,
                    borderRadius: BorderRadius.circular(20)
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(challengeTarget.length, (index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 6),
                    Text(
                      '${challengeTarget[index]}P',
                      style: TextStyle(
                        color: AppColor.grey_700,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      '${challengePoint[index]}P',
                      style: TextStyle(
                        color: AppColor.secondary,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ]
                );
              }),
            ),
          )
        ]
    ),
    );
  }
}
