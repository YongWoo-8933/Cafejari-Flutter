import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/screen/cafe_registration/component/registration_wallsocket/registration_wallsocket_slider.dart';
import 'package:cafejari_flutter/ui/state/request_state/request_state.dart';
import 'package:cafejari_flutter/ui/viewmodel/request_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';

class RegistrationWallSocket extends ConsumerWidget {
  const RegistrationWallSocket({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final RequestState requestState = ref.watch(requestViewModelProvider);

    final int numSliders = requestState.maxFloorIndex - requestState.minFloorIndex + 1;
    final List<Widget> sliders = List.generate(numSliders, (index) {
      return WallSocketSlider(value: 0, floor: requestState.minFloor[requestState.minFloorIndex+index], );
    });

    return Container(
      padding: AppPadding.padding_horizon_30,
      decoration: BoxDecoration(
        color: AppColor.white,
      ),
      child: Column(
        children: sliders,
      ),
    );
  }
}


