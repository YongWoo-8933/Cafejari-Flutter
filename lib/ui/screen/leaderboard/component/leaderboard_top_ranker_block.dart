import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/app_shadow.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/cached_network_image.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LeaderBoardTopRankerBlock extends StatelessWidget {
  final PartialUser ranker;
  final int ranking;
  final double width;
  final double height;

  const LeaderBoardTopRankerBlock({
    super.key,
    required this.ranker,
    required this.ranking,
    required this.width,
    required this.height
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        boxShadow: AppShadow.box,
        color: AppColor.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomCachedNetworkImage(imageUrl: ranker.imageUrl, width: width - 30, height: width - 30),
          const VerticalSpacer(4),
          Text(
            "NO$ranking",
            style: TextStyle(
              fontSize: ranking == 1 ? 14 : 12,
              fontWeight: FontWeight.w800,
              color: AppColor.secondary
            )
          ),
          const VerticalSpacer(4),
          SizedBox(
            width: width - 20,
            child: Text(
              ranker.nickname,
              style: TextSize.textSize_bold_12,
              textAlign: TextAlign.center,
              maxLines: 2,
            )
          ),
          const VerticalSpacer(2),
          Text("${ranker.updateCount}회", style: TextSize.textSize_12),
        ]
      ),
    );
  }
}
