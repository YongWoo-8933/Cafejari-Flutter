import 'package:cafejari_flutter/ui/viewmodel/map_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';

final scrollPositionProvider = Provider<ScrollController>((ref) => ScrollController());

class BottomSheetFloor extends ConsumerWidget {
  const BottomSheetFloor({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapState mapState = ref.watch(mapViewModelProvider);
    final scrollController = ref.watch(scrollPositionProvider);
    final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);

    return AnimatedBuilder(
      animation: scrollController,
      builder: (context, child) {

        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 19, horizontal: 27),
          child: child,
        );
      },
      child: Column(
        children: [
          Row(
            children: [
              for(int i=0; i<mapState.selectedCafeInfo.cafes.length; i++)
                SizedBox(
                  child: Row(
                    children: [
                      InkWell(
                        onTap: (){mapViewModel.changeSelectedCafe(mapState.selectedCafeInfo.cafes[i]);},
                        child: Container(
                          width: 40.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.0),
                            color: mapState.selectedCafe.id == mapState.selectedCafeInfo.cafes[i].id ? Colors.red : Colors.grey
                          ),
                          child: Center(
                            child: Text(
                              " ${mapState.selectedCafeInfo.firstFloor + i}층 ",
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,height: 30,)
                      //Text("${mapState.selectedCafeInfo.cafes[i].crowded}"),
                    ],
                  ),
                )
            ],
          ),
          
      ]
      ),
    );
  }

}

