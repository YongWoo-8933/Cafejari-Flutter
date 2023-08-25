import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/app_shadow.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/cached_network_image.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LeaderBoardTop3Block extends StatelessWidget {
  final PartialUser ranker;
  final int ranking;

  LeaderBoardTop3Block({
    required this.ranker,
    required this.ranking
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.padding_7,
      decoration: BoxDecoration(
          boxShadow: AppShadow.box,
          color: AppColor.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ranking == 1 ? CustomCachedNetworkImage(imageUrl: ranker.imageUrl, width: 110,height: 110) :
            CustomCachedNetworkImage(imageUrl: ranker.imageUrl, width: 77,height: 77),
            Text("NO${ranking}", style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: AppColor.secondary
            )),
            VerticalSpacer(5),
            Text(ranker.nickname, style: TextSize.textSize_bold_12),
            VerticalSpacer(5),
            Text("${ranker.updateCount}회", style: TextSize.textSize_12),
        ]
      ),
    );
  }
}
