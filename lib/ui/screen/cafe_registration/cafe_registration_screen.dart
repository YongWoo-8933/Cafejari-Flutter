
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/components/top_app_bar.dart';
import 'package:cafejari_flutter/ui/screen/cafe_registration/component/registration_address.dart';
import 'package:cafejari_flutter/ui/screen/cafe_registration/component/registration_floor/registration_floor.dart';
import 'package:cafejari_flutter/ui/screen/cafe_registration/component/registration_free_input.dart';
import 'package:cafejari_flutter/ui/screen/cafe_registration/component/registration_map.dart';
import 'package:cafejari_flutter/ui/screen/cafe_registration/component/registration_opening_hour/registration_opening_hour.dart';
import 'package:cafejari_flutter/ui/screen/cafe_registration/component/registration_photo.dart';
import 'package:cafejari_flutter/ui/screen/cafe_registration/component/registration_wallsocket/registration_wallsocket.dart';
import 'package:cafejari_flutter/ui/state/request_state/request_state.dart';
import 'package:cafejari_flutter/ui/viewmodel/request_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';


class CafeRegistrationScreen extends ConsumerStatefulWidget {
  const CafeRegistrationScreen({super.key});

  @override
  CafeRegistrationScreenState createState() => CafeRegistrationScreenState();
}


class CafeRegistrationScreenState extends ConsumerState<CafeRegistrationScreen> {

  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      final viewModel = ref.watch(requestViewModelProvider.notifier);
      await viewModel.setFloor();
    });
  }


  @override
  Widget build(BuildContext context) {
    final RequestState requestState = ref.watch(requestViewModelProvider);
    final RequestViewModel requestViewModel = ref.watch(requestViewModelProvider.notifier);
    final double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: BackButtonAppBar(backGroundColor: AppColor.white, backButtonText: "신규 카페 등록"),
      backgroundColor: AppColor.white,
      body: ListView( // ListView로 감싸서 슬라이드 가능하게 만듦
        children: [
          Column(
            children: [
              RegistrationMap(),
              _buildHeaderCell(deviceWidth),
              RegistrationAddress(cafeName: requestState.cafeName, cafeAddress: requestState.cafeAddress),
              _buildHeaderCell(deviceWidth),
              ExpansionTile(
                title: Text("층 수 정보"),
                trailing: requestState.tileExpand ? Icon(CupertinoIcons.minus) : Icon(CupertinoIcons.plus),
                onExpansionChanged: (bool expanded) {
                  requestViewModel.setTileExpand(expanded);
                },
                children: [
                  RegistrationFloor()
                ],
              ),
              ExpansionTile(
                title: Text("콘센트 정보"),
                trailing: requestState.tileExpand ? Icon(CupertinoIcons.minus) : Icon(CupertinoIcons.plus),
                onExpansionChanged: (bool expanded) {
                  requestViewModel.setTileExpand(expanded);
                },
                children: [
                  RegistrationWallSocket(),
                ],
              ),
              ExpansionTile(
                title: Text("영업시간 정보"),
                trailing: requestState.tileExpand ? Icon(CupertinoIcons.minus) : Icon(CupertinoIcons.plus),
                onExpansionChanged: (bool expanded) {
                  requestViewModel.setTileExpand(expanded);
                },
                children: [
                  RegistrationOpeningHour(),
                ],
              ),
              ExpansionTile(
                title: Text("사진 추가"),
                trailing: requestState.tileExpand ? Icon(CupertinoIcons.minus) : Icon(CupertinoIcons.plus),
                onExpansionChanged: (bool expanded) {
                  requestViewModel.setTileExpand(expanded);
                },
                children: [
                  RegistrationPhoto(),
                ],
              ),
              ExpansionTile(
                title: Text("자유 입력"),
                trailing: requestState.tileExpand ? Icon(CupertinoIcons.minus) : Icon(CupertinoIcons.plus),
                onExpansionChanged: (bool expanded) {
                  requestViewModel.setTileExpand(expanded);
                },
                children: [
                  RegistrationFreeInput(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _buildHeaderCell(double width) {
    return Container(
      padding: AppPadding.padding_vertical_20,
      height: 41,
      width: width-60,
      child: Divider(
        height: 1,
        color: AppColor.grey_500,
    ));
  }
}
