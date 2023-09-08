import 'package:cached_network_image/cached_network_image.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LeaderBoardRankingBlock extends StatelessWidget {
  final PartialUser ranker;
  final int ranking;

  const LeaderBoardRankingBlock({
    super.key,
    required this.ranker,
    required this.ranking
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.padding_horizon_20,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text("NO.$ranking", style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 12,
                  color: AppColor.secondary,
                ),),
                const HorizontalSpacer(15),
                CachedNetworkImage(imageUrl: ranker.imageUrl, width: 60, height: 60),
                const HorizontalSpacer(15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(ranker.nickname, style: TextSize.textSize_bold_14),
                    const VerticalSpacer(4),
                    Text("${ranker.updateCount}회", style: TextSize.textSize_12)
                  ],
                )
              ],
            ),
          ),
          const Divider(color: AppColor.grey_100, height: 1, thickness: 1)
        ],
      ),
    );
  }
}
