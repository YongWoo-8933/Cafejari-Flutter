import 'package:cafejari_flutter/domain/entity/challenge/challenge.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/screen/challenge/component/challenge_record_block.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';
import 'package:cafejari_flutter/ui/util/n_location.dart';
import 'package:cafejari_flutter/ui/viewmodel/map_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di.dart';

class RegistrationMap extends ConsumerWidget {
  const RegistrationMap({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);
    final MapState mapState = ref.watch(mapViewModelProvider);
    final double deviceWidth = MediaQuery.of(context).size.width;

    return Container(
        width: deviceWidth,
        height: 210,
        child: NaverMap(
          options: NaverMapViewOptions(
              initialCameraPosition: NLocation.sinchon().cameraPosition,
              liteModeEnable: true,
              nightModeEnable: true,
              indoorEnable: false,
              symbolScale: 0.8,
              tiltGesturesEnable: false,
              consumeSymbolTapEvents: false,
              scaleBarEnable: false,
              indoorLevelPickerEnable: false,
              locationButtonEnable: true,
              logoMargin: const EdgeInsets.symmetric(vertical: 25, horizontal: 12)
          ),
          forceGesture: true,
          onMapReady: (controller) => mapViewModel.initMapController(controller),
          onMapTapped: (_, latLng) {
            mapState.bottomSheetController.close();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          onSymbolTapped: (symbol) {},
          onCameraChange: (position, reason) {},
          onCameraIdle: () {},
        ),
    );
  }
}