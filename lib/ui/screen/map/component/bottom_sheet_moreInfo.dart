import 'package:cafejari_flutter/core/extension/int.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';

class BottomSheetMoreInfo extends ConsumerWidget {
  const BottomSheetMoreInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapState mapState = ref.watch(mapViewModelProvider);

    return Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(children: [
            Icon(Icons.copy, size: 15.0),
            Text("${mapState.selectedCafeInfo.fullAddress}")
          ],),
          Row(children: [
            Icon(Icons.copy, size: 15.0),
            Text(mapState.selectedCafe.wallSocket)
          ],),
          Row(children: [
            Icon(Icons.copy, size: 15.0),
            Text(mapState.selectedCafe.restroom)
          ],),

        ],
    );
  }
}