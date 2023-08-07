import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/viewmodel/map_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';

class BottomSheetFloor extends ConsumerWidget {
  const BottomSheetFloor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapState mapState = ref.watch(mapViewModelProvider);
    final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);

    return  Column(
        children: [
          Row(
            children: [
              for(int i=0; i<mapState.selectedCafe.cafeFloors.length; i++)
                FittedBox(
                  child: SizedBox(
                    child: Row(
                      children: [
                        InkWell(
                          onTap: (){mapViewModel.changeSelectedCafeFloor(mapState.selectedCafe.cafeFloors[i]);},
                          child: Container(
                            width: 30,
                            height: 30.0,
                            child: Center(
                              child: Text(
                                " ${mapState.selectedCafe.cafeFloors[i].floor}층 ",
                                style: TextStyle(
                                    fontWeight: FontWeight. bold,
                                    color: mapState.selectedCafeFloor.id == mapState.selectedCafe.cafeFloors[i].id ? AppColor.black : AppColor.unselectedTextColor
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10,height: 30)
                      ],
                    ),
                  ),
                )
            ],
          ),
        ]
    );
  }
}

