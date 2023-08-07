
import 'package:cafejari_flutter/core/extension/double.dart';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';

class BottomSheetDetailFloor extends ConsumerWidget {
  const BottomSheetDetailFloor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapState mapState = ref.watch(mapViewModelProvider);

    return Container(
      width: double.infinity,
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mapState.selectedCafe.cafeFloors.length * 2, // 아이템과 디바이더 개수의 총합
        itemBuilder: (context, index) {
          if (index.isEven) { // index가 짝수인 경우 (층 정보 위젯)
            final cafeIndex = index ~/ 2;
            final cafeFloor = mapState.selectedCafe.cafeFloors[cafeIndex];
            final floor = mapState.selectedCafe.cafeFloors.first.floor + cafeIndex;

            return Container(
              width: (MediaQuery.of(context).size.width-100) / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Image.asset(
                    cafeFloor.recentUpdates.isNotEmpty
                        ? cafeFloor.recentUpdates.first.occupancyRate.toOccupancyLevel().thumbImagePath
                        : 'asset/image/cafe_icon_0.png',
                    width: 50,
                    height: 50,
                  ),
                  SizedBox(height: 10),
                  Text(
                    cafeFloor.recentUpdates.isNotEmpty
                        ? cafeFloor.recentUpdates.first.occupancyRate.toOccupancyLevel().stringValue
                        : "정보없음",
                    style: TextSize.textSize_bold_16,
                  ),
                  SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("혼잡도 ", style: TextSize.textSize_grey_12),
                      Text(
                        cafeFloor.recentUpdates.isNotEmpty
                            ? "${(cafeFloor.recentUpdates.first.occupancyRate * 100).floor()}%"
                            : "정보없음",
                        style: TextSize.textSize_bold_12,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("콘센트 비율 ", style: TextSize.textSize_grey_12),
                      Text(cafeFloor.wallSocketRate.isNotNull ? "${(cafeFloor.wallSocketRate!*100).floor()}%" : "정보없음", style: TextSize.textSize_bold_12)
                    ],
                  ),
                  FittedBox(
                    child: Text(cafeFloor.restroom.isNotNull ? cafeFloor.restroom! : "", style: TextSize.textSize_bold_12)
                    ,
                  )
                ],
              ),
            );
          } else { // index가 홀수인 경우 (디바이더)
            return const VerticalDivider(
              color: AppColor.grey_300,
              thickness: 1,
              indent: 20,
              endIndent: 20,
            );
          }
        },
      ),
    );
  }
}
