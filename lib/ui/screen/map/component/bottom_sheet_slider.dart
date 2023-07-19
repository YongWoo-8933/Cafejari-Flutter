import 'package:cafejari_flutter/ui/app_config/app_color.dart';
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


    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Slider 값: ${mapState.updatedCrowded}',
          style: TextStyle(fontSize: 18.0),
        ),
        SizedBox(height: 10.0),

        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 10.0,
            trackShape: RoundedRectSliderTrackShape(),
            activeTrackColor: AppColor.brown_900,
            inactiveTrackColor: AppColor.brown_700,
            thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: 14.0,
              pressedElevation: 8.0,
            ),
            overlayColor: Colors.pink.withOpacity(0.2),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 32.0),
            tickMarkShape: RoundSliderTickMarkShape(),
            activeTickMarkColor: AppColor.brown_100,
            inactiveTickMarkColor: Colors.white,
            valueIndicatorShape: PaddleSliderValueIndicatorShape(),
            valueIndicatorColor: Colors.black,
            valueIndicatorTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          child: Slider(
            value: mapState.updatedCrowded,
            min: 0.0,
            max: 100.0,
            divisions: 100,
            onChanged: (double newValue) {
              mapViewModel.changeUpdatedCrowded(newValue);
            },
          ),
        )
      ],
    );
  }
}


