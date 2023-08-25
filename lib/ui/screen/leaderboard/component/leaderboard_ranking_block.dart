import 'package:cached_network_image/cached_network_image.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LeaderBoardRankingBlock extends StatelessWidget {
  final PartialUser ranker;
  final int ranking;

  LeaderBoardRankingBlock({
    required this.ranker,
    required this.ranking
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text("NO.${ranking}", style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 12,
            color: AppColor.secondary,
          ),),
          HorizontalSpacer(15),
          CachedNetworkImage(imageUrl: ranker.imageUrl, width: 48, height: 48),
          HorizontalSpacer(15),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(ranker.nickname, style: TextSize.textSize_bold_14),
                Text("${ranker.updateCount}회", style: TextSize.textSize_12)
              ],
            ),
          )
        ],
      ),
    );
  }
}
