import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/screen/my_cafe/component/recommend_card.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';

class CafeRefPart extends ConsumerWidget {
  const CafeRefPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Container(
      padding: AppPadding.padding_horizon_30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("이런 카페는 어때요", style: TextSize.textSize_bold_16),
          SizedBox(height: 10),
          SizedBox(
            height: 200, // 원하는 높이로 조정하세요
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                RecommendCard(cafeName: "설빙 신촌점1"),
                RecommendCard(cafeName: "설빙 신촌점2"),
                RecommendCard(cafeName: "설빙 신촌점3"),
                RecommendCard(cafeName: "설빙 신촌점4"),
                RecommendCard(cafeName: "설빙 신촌점5"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}