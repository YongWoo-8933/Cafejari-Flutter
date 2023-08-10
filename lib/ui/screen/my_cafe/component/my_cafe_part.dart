import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/screen/my_cafe/component/book_marked_card.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';

class MyCafePart extends ConsumerWidget {
  const MyCafePart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: AppPadding.padding_horizon_30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("내 카페 PICK", style: TextSize.textSize_bold_16),
          SizedBox(height: 10),
          SizedBox(
            height: 180, // 원하는 높이로 조정하세요
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                BookMarkedCard(cafeName: "설빙 신촌점1", cafeAddress: "여기저기 어딘가fffdfda"),
                SizedBox(width: 10),
                BookMarkedCard(cafeName: "설빙 신촌점2", cafeAddress: "여기저기 어딘가"),
                SizedBox(width: 10),
                BookMarkedCard(cafeName: "설빙 신촌점2", cafeAddress: "여기저기 어딘가"),
                SizedBox(width: 10),
                BookMarkedCard(cafeName: "설빙 신촌점2", cafeAddress: "여기저기 어딘가"),
                SizedBox(width: 10),
                BookMarkedCard(cafeName: "설빙 신촌점2", cafeAddress: "여기저기 어딘가"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 내카페 출력 로직 확인 필요

// ListView.builder(
//   scrollDirection: Axis.horizontal,
//   itemCount: myPageState.user.favoriteCafes.length,
//   itemBuilder: (BuildContext context, int index) {
//     final favoriteCafeId = myPageState.user.favoriteCafes[index];
//     final matchingCafe = mapState.cafes.where((cafe) => cafe.id == favoriteCafeId).firstOrNull;
//
//     if (matchingCafe != null) {
//       return BookMarkedCard(
//         cafeName: matchingCafe.name,
//         cafeAddress: matchingCafe.address,
//       );
//     } else {
//       return Container(); // 혹은 원하는 위젯을 반환
//     }
//   },
// )