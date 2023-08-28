import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/cafe_name_address_block.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/components/back_button_app_bar.dart';
import 'package:cafejari_flutter/ui/screen/cafe_registration/cafe_registration_free_part.dart';
import 'package:cafejari_flutter/ui/screen/cafe_registration/component/cafe_registration_search_bar.dart';
import 'package:cafejari_flutter/ui/screen/cafe_registration/cafe_registration_floor_part.dart';
import 'package:cafejari_flutter/ui/screen/cafe_registration/cafe_registration_opening_hour_part.dart';
import 'package:cafejari_flutter/ui/screen/cafe_registration/cafe_registration_wallsocket_part.dart';
import 'package:cafejari_flutter/ui/screen/cafe_registration/component/cafe_registration_search_prediction.dart';
import 'package:cafejari_flutter/ui/state/request_state/request_state.dart';
import 'package:cafejari_flutter/ui/util/n_location.dart';
import 'package:cafejari_flutter/ui/view_model/request_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:go_router/go_router.dart';


final _isWallSocketPartExpandedProvider = StateProvider<bool>((ref) => false);
final _isOpeningHourPartExpanded = StateProvider<bool>((ref) => false);
final _isFreePartExpanded = StateProvider<bool>((ref) => false);

class CafeRegistrationScreen extends ConsumerStatefulWidget {
  const CafeRegistrationScreen({super.key});

  @override
  CafeRegistrationScreenState createState() => CafeRegistrationScreenState();
}


class CafeRegistrationScreenState extends ConsumerState<CafeRegistrationScreen> {
  CafeRegistrationScreenState();

  @override
  void dispose() {
    super.dispose();
    ref.watch(_isWallSocketPartExpandedProvider.notifier).update((state) => false);
    ref.watch(_isOpeningHourPartExpanded.notifier).update((state) => false);
    ref.watch(_isFreePartExpanded.notifier).update((state) => false);
    ref.watch(requestViewModelProvider.notifier).clearViewModel();
  }

  @override
  Widget build(BuildContext context) {
    final RequestState requestState = ref.watch(requestViewModelProvider);
    final RequestViewModel requestViewModel = ref.watch(requestViewModelProvider.notifier);
    final double deviceWidth = MediaQuery.of(context).size.width;
    const greyAreaWidth = 280.0;
    const mapHeight = 240.0;

    return Scaffold(
      appBar: BackButtonAppBar(
        backGroundColor: AppColor.white,
        backButtonText: "신규 카페 등록",
        onBack: () => GoRouter.of(context).pop(),
      ),
      backgroundColor: AppColor.white,
      body: ListView(
        children: [
          const VerticalSpacer(20),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 36),
                child: _NaverMap(height: mapHeight),
              ),
              CafeRegistrationSearchBar(width: deviceWidth - 40, height: 48),
              CafeRegistrationSearchPrediction(width: deviceWidth - 40, height: mapHeight - 20)
            ],
          ),
          const VerticalSpacer(30),
          Padding(
            padding: AppPadding.padding_horizon_20,
            child: Column(
              children: [
                CafeNameAddressBlock(
                  name: requestState.selectedSearchCafe.name,
                  address: requestState.selectedSearchCafe.roadAddress,
                  nameTextSize: 18,
                ),
                const VerticalSpacer(30),
                _divider(),
                const VerticalSpacer(40),
                const CafeRegistrationFloorPart(greyAreaWidth: greyAreaWidth),
                const VerticalSpacer(40),
                _divider(),
                _expansionTile(
                    context: context,
                    title: "(선택)  콘센트 보급율 입력",
                    description: "ex) 총 10테이블에 콘센트 5개 => 50%",
                    isExpanded: ref.watch(_isWallSocketPartExpandedProvider),
                    onExpansionChanged: (bool expanded) {
                      ref.watch(_isWallSocketPartExpandedProvider.notifier).update((
                          state) => expanded);
                    },
                    child: const CafeRegistrationWallSocketPart(width: greyAreaWidth)
                ),
                _divider(),
                _expansionTile(
                    context: context,
                    title: "(선택)  영업시간 정보 입력",
                    description: "",
                    isExpanded: ref.watch(_isOpeningHourPartExpanded),
                    onExpansionChanged: (bool expanded) {
                      ref.watch(_isOpeningHourPartExpanded.notifier).update((
                          state) => expanded);
                    },
                    child: const CafeRegistrationOpeningHourPart(width: greyAreaWidth)
                ),
                _divider(),
                _expansionTile(
                    context: context,
                    title: "(선택)  기타 정보 입력",
                    description: "ex) 1층에는 테이블이 없어요\nex) 공부하기 좋은 카페에요",
                    isExpanded: ref.watch(_isFreePartExpanded),
                    onExpansionChanged: (bool expanded) {
                      ref.watch(_isFreePartExpanded.notifier).update((state) => expanded);
                    },
                    child: const CafeRegistrationFreePart(width: greyAreaWidth)
                ),
                const VerticalSpacer(80),
                ActionButtonPrimary(
                  buttonWidth: greyAreaWidth,
                  buttonHeight: 48,
                  title: "등록 요청",
                  onPressed: () {},
                ),
                const VerticalSpacer(60),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _divider() {
    return const Divider(
      height: 1,
      thickness: 1,
      color: AppColor.grey_400,
    );
  }

  Widget _expansionTile({
    required BuildContext context,
    required String title,
    required String description,
    required bool isExpanded,
    required void Function(bool) onExpansionChanged,
    required Widget child
  }) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: AppColor.transparent),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        title: Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14
          ),
        ),
        trailing: Icon(
            isExpanded ? CupertinoIcons.minus : CupertinoIcons.plus,
            size: 20, color: AppColor.primary
        ),
        onExpansionChanged: onExpansionChanged,
        children: [
          Column(
            children: [
              const VerticalSpacer(10),
              Visibility(
                visible: description.isNotEmpty,
                child: Column(
                  children: [
                    Text(
                      description,
                      style: const TextStyle(
                          color: AppColor.grey_800
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const VerticalSpacer(20)
                  ],
                )
              ),
              child,
              const VerticalSpacer(40),
            ],
          )
        ]
      ),
    );
  }
}

class _NaverMap extends ConsumerWidget {
  final double height;

  const _NaverMap({super.key, required this.height});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final RequestViewModel requestViewModel = ref.watch(requestViewModelProvider.notifier);
    final double deviceWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: deviceWidth,
      height: height,
      child: NaverMap(
        forceGesture: true,
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
          locationButtonEnable: false,
          rotationGesturesEnable: false,
        ),
        onMapReady: (controller) => requestViewModel.initMapController(controller),
        onSymbolTapped: (symbol) {},
        onCameraChange: (position, reason) {},
        onCameraIdle: () {},
      ),
    );
  }
}
