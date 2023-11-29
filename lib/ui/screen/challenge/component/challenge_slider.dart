import 'package:cafejari_flutter/domain/entity/challenge/challenge.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/app_shadow.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChallengeSlider extends StatelessWidget {
  final Challenge challenge;
  final Challenger challenger;

  const ChallengeSlider({super.key,
    required this.challenge,
    required this.challenger,
  });

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 말풍선
        Row(
          children: [
            HorizontalSpacer((deviceWidth - 80) * challenger.progressRate),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  'asset/image/icon_speech_bubble.png',
                  fit: BoxFit.cover,
                  width: 80,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Text(
                    '${(challenger.progressRate * 100).toInt()}%',
                    style: TextSize.textSize_bold_white_14,
                  ),
                ),
              ],
            ),
          ]
        ),
        // 핀
        Row(
            children: [
              HorizontalSpacer((deviceWidth - 80) * challenger.progressRate + 30),
              Image.asset('asset/image/challenge_marker.png', width: 24)
            ]
        ),
        const VerticalSpacer(8),
        // 바
        Container(
          alignment: Alignment.centerLeft,
          width: deviceWidth - 72,
          height: 20,
          margin: const EdgeInsets.symmetric(horizontal: 36),
          decoration: BoxDecoration(
            color: AppColor.grey_0,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColor.grey_200)
          ),
          child: Container(
            width: (deviceWidth - 72) * challenger.progressRate,
            decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.circular(10)
            )
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...challenge.challengeMilestones.map((e) {
                return SizedBox(
                  width: 48,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${e.count}회',
                        style: const TextStyle(
                          color: AppColor.grey_700,
                          fontSize: 10,
                        ),
                      ),
                      const VerticalSpacer(4),
                      Text(
                        '${e.point}P',
                        style: const TextStyle(
                          color: AppColor.secondary,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ]
                  ),
                );
              }).toList()
            ]
          ),
        )
      ]
    );
  }
}
