import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/screen/my_cafe/component/book_marked_card.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/state/my_cafe_state/my_cafe_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';

class MyCafePart extends ConsumerWidget {
  const MyCafePart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyCafeState myCafeState = ref.watch(myCafeViewModelProvider);

    return Container(
      padding: AppPadding.padding_horizon_30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("내 카페 PICK", style: TextSize.textSize_bold_16),
          SizedBox(height: 15),
          SizedBox(
            height: 180, // 원하는 높이로 조정하세요
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                BookMarkedCard(cafe: myCafeState.favoriteCafe[0]),
                SizedBox(width: 10),
                BookMarkedCard(cafe: myCafeState.favoriteCafe[0]),
                SizedBox(width: 10),
                BookMarkedCard(cafe: myCafeState.favoriteCafe[0]),
                BookMarkedCard(cafe: myCafeState.favoriteCafe[0]),
                BookMarkedCard(cafe: myCafeState.favoriteCafe[0]),
                BookMarkedCard(cafe: myCafeState.favoriteCafe[0]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
