import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/screen/challenge/component/challenge_small_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChallengeInformation extends StatelessWidget {
  final String challengeImage, title, information, date;


  ChallengeInformation({super.key,
    required this.challengeImage,
    required this.title,
    required this.information,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: AppPadding.padding_30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextSize.textSize_bold_16),
                Text(date, style: TextSize.textSize_grey_12),
                SizedBox(height: 10),
                Text(information, style: TextSize.textSize_14),
              ],
            ),
          ),
          Image.asset(
            challengeImage,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
