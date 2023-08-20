import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/state/request_state/request_state.dart';
import 'package:cafejari_flutter/ui/viewmodel/request_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showCupertinoPicker(BuildContext context, RequestState requestState, RequestViewModel requestViewModel, bool maxOrMin) async {

  await showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColor.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
        ),
        content: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(0),
          height: 150.0,
          color: AppColor.white,
          child: CupertinoPicker(
            itemExtent: 40.0,
            onSelectedItemChanged: (int index) {
              maxOrMin ? requestViewModel.selectMaxFloor(index) : requestViewModel.selectMinFloor(index) ;
              print("${requestState.maxFloorIndex} @@ ${requestState.minFloorIndex}");

            },
            children: maxOrMin ? requestState.maxFloor.map((e) => Container(child: Text('$e'),alignment: Alignment.center,)).toList()
                : requestState.minFloor.map((e) => Container(child: Text('$e'),alignment: Alignment.center,)).toList(),
          ),
        ),
        actions: [
          Container(
            padding: AppPadding.padding_7,
            child: Column(
              children: [
                Divider(height: 1, color: AppColor.grey_400),
                VerticalSpacer(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('닫기', style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 17
                      ),),
                    ),
                    GestureDetector(
                      onTap: () {
                        // maxOrMin ? requestState.maxFloorIndex < requestState.minFloorIndex ? requestViewModel.minusMinFloor(requestState.maxFloorIndex) : {}
                        //     : requestState.maxFloorIndex < requestState.minFloorIndex ? requestViewModel.plusMaxFloor(requestState.minFloorIndex) : {};
                        print("${requestState.maxFloorIndex} @@@@ ${requestState.minFloorIndex}");
                        Navigator.of(context).pop();
                      },
                      child: Text('선택', style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                        color: AppColor.secondary
                      )),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      );
    },
  );
}
