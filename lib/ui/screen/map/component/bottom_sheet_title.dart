import 'package:cafejari_flutter/core/extension/double.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';

class BottomSheetTitle extends ConsumerWidget {
  const BottomSheetTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapState mapState = ref.watch(mapViewModelProvider);

    return  Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  mapState.selectedCafe.name,
                  style: TextSize.textSize_20),
              SizedBox(height: 3),
              Center(
                child: Row(
                  children: [
                    Image.asset(
                      "asset/image/icon_small_pin.png",
                      width: 12,
                      height: 12,
                    ),
                    Text(" ${mapState.selectedCafe.address}",
                        style: TextSize.textSize_12)
                  ],
                ),
              )
            ]
        ),
      ]
    );
  }
}