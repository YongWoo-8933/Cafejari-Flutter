import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_secondary.dart';
import 'package:cafejari_flutter/ui/components/buttons/x_button.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/screen/cafe_registration/component/registration_opening_hour/registration_day_button.dart';
import 'package:cafejari_flutter/ui/screen/cafe_registration/component/registration_opening_hour/registration_opening_hour.dart';
import 'package:cafejari_flutter/ui/screen/cafe_registration/component/registration_opening_hour/registration_opening_hour_datepicker.dart';
import 'package:cafejari_flutter/ui/state/request_state/request_state.dart';
import 'package:cafejari_flutter/ui/viewmodel/request_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
as picker;

showOpeningHourDialog(BuildContext context, RequestState requestState, RequestViewModel requestViewModel) async {
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
          width: 328,
          height: 400.0,
          color: AppColor.white,
          child: Column(

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("요일 및 시간을 선택해 주세요", style: TextSize.textSize_16,),
                  XButton(buttonSize: 15, onPressed: () => {Navigator.of(context).pop()}),
                ],
              ),
              VerticalSpacer(30),
              Row(
                children: [
                  DayButton(
                    buttonHeight: 38,
                    buttonWidth: 38,
                    isClicked: bool.parse(requestState.clickedDay.mon),
                    title: '월',
                    onPressed: () => requestViewModel.setDayClicked(
                        OpeningHour(mon: "true", tue: "false", wed: "false", thu: "false", fri: "false", sat: "false", sun: "false")
                    ),
                  ),
                  HorizontalSpacer(3),
                  DayButton(
                    buttonHeight: 38,
                    buttonWidth: 38,
                    isClicked: bool.parse(requestState.clickedDay.tue),
                    title: '화',
                    onPressed: () => requestViewModel.setDayClicked(
                        OpeningHour(mon: "false", tue: "true", wed: "false", thu: "false", fri: "false", sat: "false", sun: "false")
                    ),
                  ),
                  HorizontalSpacer(3),
                  DayButton(
                    buttonHeight: 38,
                    buttonWidth: 38,
                    isClicked: bool.parse(requestState.clickedDay.wed),
                    title: '수',
                    onPressed: () => requestViewModel.setDayClicked(
                        OpeningHour(mon: "false", tue: "false", wed: "true", thu: "false", fri: "false", sat: "false", sun: "false")
                    ),
                  ),
                  HorizontalSpacer(3),
                  DayButton(
                    buttonHeight: 38,
                    buttonWidth: 38,
                    isClicked: bool.parse(requestState.clickedDay.thu),
                    title: '목',
                    onPressed: () => requestViewModel.setDayClicked(
                        OpeningHour(mon: "false", tue: "false", wed: "false", thu: "true", fri: "false", sat: "false", sun: "false")
                    ),
                  ),
                  HorizontalSpacer(3),
                  DayButton(
                    buttonHeight: 38,
                    buttonWidth: 38,
                    isClicked: bool.parse(requestState.clickedDay.fri),
                    title: '금',
                    onPressed: () => requestViewModel.setDayClicked(
                        OpeningHour(mon: "false", tue: "false", wed: "false", thu: "false", fri: "true", sat: "false", sun: "false")
                    ),
                  ),
                  HorizontalSpacer(3),
                  DayButton(
                    buttonHeight: 38,
                    buttonWidth: 38,
                    isClicked: bool.parse(requestState.clickedDay.sat),
                    title: '토',
                    onPressed: () => requestViewModel.setDayClicked(
                        OpeningHour(mon: "false", tue: "false", wed: "false", thu: "false", fri: "false", sat: "true", sun: "false")
                    ),
                  ),
                  HorizontalSpacer(3),
                  DayButton(
                    buttonHeight: 38,
                    buttonWidth: 38,
                    isClicked: bool.parse(requestState.clickedDay.sun),
                    title: '일',
                    onPressed: () => requestViewModel.setDayClicked(
                        OpeningHour(mon: "false", tue: "false", wed: "false", thu: "false", fri: "false", sat: "false", sun: "true")
                    ),
                  )
                ],
              ),
              VerticalSpacer(16),
              GestureDetector(
                onTap:  () => {
                picker.DatePicker.showTimePicker(context,
                showTitleActions: true, onChanged: (date) {
                print('change $date in time zone ' +
                date.timeZoneOffset.inHours.toString());
                }, onConfirm: (date) {
                print('confirm $date');
                }, currentTime: DateTime.now())
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: AppColor.grey_400,
                      width: 1,
                    ),
                  ),
                  width: 256,
                  height: 48,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("여는 시간", style: TextSize.textSize_bold_16_w700),
                      Text(
                        " ${getOpeningTime(requestState.openingHour, requestState.clickedDay).split('-')[0]}",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              VerticalSpacer(16),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: AppColor.grey_400,
                    width: 1,
                  ),
                ),
                width: 256,
                height: 48,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("닫는 시간", style: TextSize.textSize_bold_16_w700),
                    Text(
                      "${getOpeningTime(requestState.openingHour, requestState.clickedDay).split('-')[1]} ",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          )
        ),
        actions: [
          Container(
            padding: AppPadding.padding_7,
            child: Column(
              children: [
                VerticalSpacer(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  SizedBox(
                  width: 138,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () => {Navigator.of(context).pop()},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(99),
                        side: BorderSide(color: AppColor.grey_400, width: 1),
                      ),
                      elevation: 0
                    ),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('닫기', style: TextSize.textSize_16),
                        ],
                      ),
                    ),
                  ),
                ),
                    ActionButtonPrimary(
                      buttonWidth: 138,
                      buttonHeight: 48,
                      title: "저장",
                      onPressed: () => {Navigator.of(context).pop()},
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.of(context).pop();
                    //   },
                    //   child: Text('닫기', style: TextStyle(
                    //       fontWeight: FontWeight.w400,
                    //       fontSize: 17
                    //   ),),
                    // ),
                    // GestureDetector(
                    //   onTap: () {
                    //     print("${requestState.maxFloorIndex} @@@@ ${requestState.minFloorIndex}");
                    //     Navigator.of(context).pop();
                    //   },
                    //   child: Text('선택', style: TextStyle(
                    //       fontWeight: FontWeight.w700,
                    //       fontSize: 17,
                    //       color: AppColor.secondary
                    //   )),
                    // ),
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

String getOpeningTime(OpeningHour openingHour, OpeningHour clickedDay) {
  if (bool.parse(clickedDay.mon)) {
    return convertTo12HourFormat(openingHour.mon);
  } else if (bool.parse(clickedDay.tue)) {
    return convertTo12HourFormat(openingHour.tue);
  } else if (bool.parse(clickedDay.wed)) {
    return convertTo12HourFormat(openingHour.wed);
  } else if (bool.parse(clickedDay.thu)) {
    return convertTo12HourFormat(openingHour.thu);
  } else if (bool.parse(clickedDay.fri)) {
    return convertTo12HourFormat(openingHour.fri);
  } else if (bool.parse(clickedDay.sat)) {
    return convertTo12HourFormat(openingHour.sat);
  } else if (bool.parse(clickedDay.sun)) {
    return convertTo12HourFormat(openingHour.sun);
  } else {
    return "N/A"; // 선택된 요일이 없을 경우
  }
}

class CustomPicker extends picker.CommonPickerModel {
  String digits(int value, int length) {
    return '$value'.padLeft(length, "0");
  }

  CustomPicker({DateTime? currentTime, picker.LocaleType? locale})
      : super(locale: locale) {
    this.currentTime = currentTime ?? DateTime.now();
    this.setLeftIndex(this.currentTime.hour);
    this.setMiddleIndex(this.currentTime.minute);
    this.setRightIndex(this.currentTime.second);
  }

  @override
  String? leftStringAtIndex(int index) {
    if (index >= 0 && index < 24) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String? middleStringAtIndex(int index) {
    if (index >= 0 && index < 60) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String? rightStringAtIndex(int index) {
    if (index >= 0 && index < 60) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String leftDivider() {
    return "|";
  }

  @override
  String rightDivider() {
    return "|";
  }

  @override
  List<int> layoutProportions() {
    return [1, 2, 1];
  }

  @override
  DateTime finalTime() {
    return currentTime.isUtc
        ? DateTime.utc(
        currentTime.year,
        currentTime.month,
        currentTime.day,
        this.currentLeftIndex(),
        this.currentMiddleIndex(),
        this.currentRightIndex())
        : DateTime(
        currentTime.year,
        currentTime.month,
        currentTime.day,
        this.currentLeftIndex(),
        this.currentMiddleIndex(),
        this.currentRightIndex());
  }
}