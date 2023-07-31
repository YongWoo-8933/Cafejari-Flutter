import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/viewmodel/map_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';

class ListViewBlock extends ConsumerWidget {
  const ListViewBlock({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapState mapState = ref.watch(mapViewModelProvider);
    final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);

    return Container(
      child: Row(
        children: [
          Container(
            //ImagePart
          ),
          Container(
            child: Column(
              children: [
                Text("#대표태그", style: TextSize.textSize_grey_12),
                Text("카페 이름", style: TextSize.textSize_bold_16),
                SizedBox(height: 10),
                
              ],
            ),
          )
        ],
      ),
    );

  }

}

