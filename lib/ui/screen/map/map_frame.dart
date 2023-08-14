
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/app_shadow.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';
import 'package:cafejari_flutter/ui/util/n_location.dart';
import 'package:cafejari_flutter/ui/viewmodel/map_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class MapFrame extends ConsumerWidget {
  const MapFrame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);
    final MapState mapState = ref.watch(mapViewModelProvider);
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        NaverMap(
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
        Positioned(
          top: 50,
          left: 20,
          child: Container(
            width: deviceWidth - 40,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              boxShadow: AppShadow.box
            ),
            child: TextFormField(
              controller: mapState.searchQueryController,
              keyboardType: TextInputType.text,
              cursorColor: AppColor.primary,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600
              ),
              textAlignVertical: TextAlignVertical.center,
              onChanged: (value) {},
              enableSuggestions: true,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: "카페명 검색",
                hintStyle: const TextStyle(
                  color: AppColor.grey_600,
                  fontWeight: FontWeight.w400,
                  fontSize: 14
                ),
                filled: true,
                fillColor: AppColor.white,
                prefixIcon: const Icon(CupertinoIcons.search, size: 24),
                prefixIconColor: AppColor.primary,
                suffixIcon: IconButton(
                  onPressed: () {  },
                  icon: Image.asset("asset/image/icon_filter.png", width: 24),
                ),
                contentPadding: AppPadding.padding_0,
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColor.white),
                  borderRadius: BorderRadius.circular(24.0), // 원하는 border radius 값으로 설정
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColor.white),
                  borderRadius: BorderRadius.circular(24.0), // 원하는 border radius 값으로 설정
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColor.white),
                  borderRadius: BorderRadius.circular(24.0), // 원하는 border radius 값으로 설정
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: mapState.bottomSheetController.panelPosition * deviceHeight,
          child: ElevatedButton(
            child: Text("fdsaf"),
            onPressed: () {},
          )
        ),
      ],
    );
  }
}