import 'package:cafejari_flutter/ui/components/slider.dart';
import 'package:cafejari_flutter/ui/viewmodel/map_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';

class BottomSheetSlider extends ConsumerWidget {
  const BottomSheetSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final MapState mapState = ref.watch(mapViewModelProvider);
    final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);

    // return CustomSlider(
    //     value: mapState.updatedCrowded,
    //     onChanged: (double newValue) {
    //       mapViewModel.changeUpdatedCrowded(newValue);
    //     },
    //     sliderWidth_padding: 300);
    return Container();
  }
}
