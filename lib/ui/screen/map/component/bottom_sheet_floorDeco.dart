import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/viewmodel/map_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';

class BottomSheetFloorDeco extends ConsumerWidget {
  const BottomSheetFloorDeco({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapState mapState = ref.watch(mapViewModelProvider);
    final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);

    return  Column(
        children: [
          Row(
            children: [
              for(int i=0; i<mapState.selectedCafeInfo.cafes.length; i++)
                FittedBox(
                  child: SizedBox(
                    child: Row(
                      children: [
                        InkWell(
                          onTap: (){mapViewModel.changeSelectedCafe(mapState.selectedCafeInfo.cafes[i]);},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: mapState.selectedCafe.id == mapState.selectedCafeInfo.cafes[i].id ? AppColor.secondary : AppColor.white,
                              border: Border.all(
                                color: AppColor.secondary,
                                width: 1
                              )
                            ),
                            width: 50,
                            height: 40.0,
                            child: Center(
                              child: Text(
                                " ${mapState.selectedCafeInfo.firstFloor + i}층 ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: mapState.selectedCafe.id == mapState.selectedCafeInfo.cafes[i].id ? AppColor.white : AppColor.brown_300
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10,height: 30,)
                        //Text("${mapState.selectedCafeInfo.cafes[i].crowded}"),
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

