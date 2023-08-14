import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPageRanking extends StatelessWidget {

  MyPageRanking({super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.padding_30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('나의 카페지기 순위', style: TextSize.textSize_12),
              SizedBox(height: 8),
              Text('나의 이달의 샷', style: TextSize.textSize_12),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('500위', style: TextSize.textSize_bold_16),
              SizedBox(height: 8),
              Text('3개', style: TextSize.textSize_bold_16),
            ],
          ),
          SizedBox(width: 30),
          ActionButtonPrimary(
              buttonWidth: 110,
              buttonHeight: 45,
              title: '명예의 전당',
              onPressed: () {},
          )
        ],
      )
    );
  }
}
