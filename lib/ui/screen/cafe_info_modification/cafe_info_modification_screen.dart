import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/components/back_button_app_bar.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/buttons/edit_apply_button.dart';
import 'package:cafejari_flutter/ui/components/cafe_floor_edit_part.dart';
import 'package:cafejari_flutter/ui/components/cafe_free_edit_part.dart';
import 'package:cafejari_flutter/ui/components/cafe_name_address_block.dart';
import 'package:cafejari_flutter/ui/components/cafe_opening_hour_edit_part.dart';
import 'package:cafejari_flutter/ui/components/cafe_wallsocket_rate_edit_part.dart';
import 'package:cafejari_flutter/ui/components/show_opening_hour_dialog.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/screen/cafe_info_modification/component/cafe_closing_part.dart';
import 'package:cafejari_flutter/ui/screen/cafe_info_modification/component/cafe_coordinate_part.dart';
import 'package:cafejari_flutter/ui/screen/cafe_info_modification/component/cafe_restroom_part.dart';
import 'package:cafejari_flutter/ui/state/cafe_info_modification_state/cafe_info_modification_state.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';
import 'package:cafejari_flutter/ui/view_model/cafe_info_modification_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


class CafeInfoModificationScreen extends ConsumerStatefulWidget {
  const CafeInfoModificationScreen({super.key});

  @override
  CafeInfoModificationScreenState createState() => CafeInfoModificationScreenState();
}


class CafeInfoModificationScreenState extends ConsumerState<CafeInfoModificationScreen> {
  CafeInfoModificationScreenState();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      ref.watch(cafeInfoModificationViewModelProvider.notifier).initViewModel(
        selectedCafe: ref.watch(mapViewModelProvider).selectedCafe
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    Future.delayed(Duration.zero, () {
      ref.watch(cafeInfoModificationViewModelProvider.notifier).clearViewModel();
    });
  }

  Widget _divider() {
    return const Divider(
      height: 1,
      thickness: 1,
      color: AppColor.grey_300,
    );
  }

  @override
  Widget build(BuildContext context) {
    final CafeInfoModificationState state = ref.watch(cafeInfoModificationViewModelProvider);
    final CafeInfoModificationViewModel viewModel = ref.watch(
        cafeInfoModificationViewModelProvider.notifier);
    final MapState mapState = ref.watch(mapViewModelProvider);
    final double deviceWidth = MediaQuery
        .of(context)
        .size
        .width;
    const editButtonWidth = 260.0;
    const sidePadding = 20.0;

    return Scaffold(
        appBar: BackButtonAppBar(
          backGroundColor: AppColor.white,
          backButtonText: "카페 정보 수정",
          onBack: () => GoRouter.of(context).pop(),
        ),
        backgroundColor: AppColor.white,
        body: ListView.builder(
          addAutomaticKeepAlives: false,
            padding: const EdgeInsets.symmetric(horizontal: sidePadding),
            itemCount: 20,
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return const VerticalSpacer(40);
                case 1:
                  return CafeNameAddressBlock(
                    width: deviceWidth - sidePadding * 2,
                    name: mapState.selectedCafe.name,
                    address: mapState.selectedCafe.address,
                    nameTextSize: 18,
                  );
                case 2:
                  return const VerticalSpacer(60);
                case 3:
                  return _divider();
                case 4:
                  return _ExpansionTile(
                      title: "영업정보(폐업 여부)",
                      description: "",
                      isExpanded: state.isClosingPartExpanded,
                      onExpansionChanged: viewModel.setIsClosingPartExpanded,
                      child: const CafeClosingPart()
                  );
                case 5:
                  return _divider();
                case 6:
                  return _ExpansionTile(
                      title: "위치 정보",
                      description: "지도에서 위치를 조정해주세요",
                      isExpanded: state.isCoordinatePartExpanded,
                      onExpansionChanged: viewModel.setIsCoordinatePartExpanded,
                      child: const CafeCoordinatePart(editButtonWidth: editButtonWidth)
                  );
                case 7:
                  return _divider();
                case 8:
                  return _ExpansionTile(
                    title: "층 정보",
                    description: "",
                    isExpanded: state.isFloorPartExpanded,
                    onExpansionChanged: viewModel.setIsFloorPartExpanded,
                    child: Column(
                      children: [
                        CafeFloorEditPart(
                            greyAreaWidth: editButtonWidth,
                            selectedMaxFloor: state.selectedMaxFloor,
                            selectedMinFloor: state.selectedMinFloor,
                            onSelectMaxFloor: viewModel.selectMaxFloor,
                            onSelectMinFloor: viewModel.selectMinFloor
                        ),
                        const VerticalSpacer(40),
                        EditApplyButton(
                            isApplied: state.isFloorEdited,
                            width: editButtonWidth,
                            onPress: () => viewModel.setIsFloorEdited(!state.isFloorEdited)
                        )
                      ],
                    ),
                  );
                case 9:
                  return _divider();
                case 10:
                  return _ExpansionTile(
                      title: "콘센트 정보",
                      description: "ex) 총 10테이블에 콘센트 5개 => 50%",
                      isExpanded: state.isWallSocketPartExpanded,
                      onExpansionChanged: viewModel.setIsWallSocketPartExpanded,
                      child: CafeWallSocketRateEditPart(
                          width: editButtonWidth,
                          wallSocketRates: state.wallSocketRates,
                          onWallSocketRateUpdate: (index, rate) =>
                              viewModel.updateWallSocketRate(index: index, rate: rate),
                          isEdited: state.isWallSocketEdited,
                          onEditButtonClick: () =>
                              viewModel.setIsWallSocketEdited(!state.isWallSocketEdited)
                      )
                  );
                case 11:
                  return _divider();
                case 12:
                  return _ExpansionTile(
                      title: "영업시간 정보",
                      description: "",
                      isExpanded: state.isOpeningHourPartExpanded,
                      onExpansionChanged: viewModel.setIsOpeningHourPartExpanded,
                      child: CafeOpeningHourEditPart(
                        width: editButtonWidth,
                        isEdited: state.isOpeningHourEdited,
                        openingInfos: state.openingInfos,
                        onPickDay: viewModel.pickDay,
                        showOpeningHourDialogType: ShowOpeningHourDialogType.modification,
                        onEditButtonClick: () => viewModel.setIsOpeningHourEdited(!state.isOpeningHourEdited),
                      )
                  );
                case 13:
                  return _divider();
                case 14:
                  return _ExpansionTile(
                      title: "화장실 정보",
                      description: "",
                      isExpanded: state.isRestroomPartExpanded,
                      onExpansionChanged: viewModel.setIsRestroomPartExpanded,
                      child: const CafeRestroomPart(width: editButtonWidth)
                  );
                case 15:
                  return _divider();
                case 16:
                  return _ExpansionTile(
                      title: "기타 정보",
                      description: "ex) 1층에는 테이블이 없어요\nex) 공부하기 좋은 카페에요",
                      isExpanded: state.isFreePartExpanded,
                      onExpansionChanged: viewModel.setIsFreePartExpanded,
                      child: CafeFreeEditPart(
                          width: editButtonWidth,
                          textEditingController: state.freeQueryController
                      )
                  );
                case 17:
                  return const VerticalSpacer(40);
                case 18:
                  return ActionButtonPrimary(
                    buttonWidth: editButtonWidth,
                    buttonHeight: 48,
                    title: "수정 요청",
                    onPressed: () async =>
                    await viewModel.requestCafeModification(context: context, selectedCafe: mapState.selectedCafe),
                  );
                default:
                  return const VerticalSpacer(60);
              }
            }
        )
    );
  }
}

class _ExpansionTile extends StatelessWidget {
  final String title, description;
  final bool isExpanded;
  final Function(bool) onExpansionChanged;
  final Widget child;
  
  const _ExpansionTile({
    super.key,
    required this.title,
    required this.description,
    required this.isExpanded,
    required this.onExpansionChanged,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: AppColor.transparent),
      child: ExpansionTile(
        initiallyExpanded: isExpanded,
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