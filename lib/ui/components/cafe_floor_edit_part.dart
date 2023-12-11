import 'package:cafejari_flutter/core/extension/int.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CafeFloorEditPart extends StatelessWidget {
  final double greyAreaWidth;
  final int selectedMaxFloor, selectedMinFloor;
  final Function(int) onSelectMaxFloor, onSelectMinFloor;

  const CafeFloorEditPart({
    Key? key,
    required this.greyAreaWidth,
    required this.selectedMaxFloor,
    required this.selectedMinFloor,
    required this.onSelectMaxFloor,
    required this.onSelectMinFloor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int maximumFloorLimit = 63;
    const int minimumFloorLimit = -10;

    return Column(
      children: [
        const Text(
          "(필수) 최저층을 입력 해주세요",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14
          ),
        ),
        const VerticalSpacer(15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _CafeFloorChangeButton(
              type: _CafeFloorChangeButtonType.minus,
              onTab: () {
                if(selectedMinFloor >= minimumFloorLimit) {
                  onSelectMinFloor(selectedMinFloor - (selectedMinFloor == 1 ? 2 : 1));
                }
              },
            ),
            const HorizontalSpacer(20),
            _FloorInputFrame(
              onTab: () {
                showCupertinoDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return _CafeFloorPicker(
                      maximumFloorLimit: maximumFloorLimit,
                      minimumFloorLimit: minimumFloorLimit,
                      selectedMaxFloor: selectedMaxFloor,
                      selectedMinFloor: selectedMinFloor,
                      onSelectMaxFloor: onSelectMaxFloor,
                      onSelectMinFloor: onSelectMinFloor,
                      type: _CafeFloorPickerType.min
                    );
                  }
                );
              },
              floorText: selectedMinFloor.toFloor(),
            ),
            const HorizontalSpacer(20),
            _CafeFloorChangeButton(
              type: _CafeFloorChangeButtonType.plus,
              onTab: () {
                if(selectedMinFloor < selectedMaxFloor) {
                  onSelectMinFloor(selectedMinFloor + (selectedMinFloor == -1 ? 2 : 1));
                }
              },
            ),
          ],
        ),
        const VerticalSpacer(40),
        const Text(
          "(필수) 최고층을 입력 해주세요",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14
          ),
        ),
        const VerticalSpacer(15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _CafeFloorChangeButton(
              type: _CafeFloorChangeButtonType.minus,
              onTab: () {
                if(selectedMaxFloor > selectedMinFloor) {
                  onSelectMaxFloor(selectedMaxFloor - (selectedMaxFloor == 1 ? 2 : 1));
                }
              },
            ),
            const HorizontalSpacer(20),
            _FloorInputFrame(
              onTab: () {
                showCupertinoDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return _CafeFloorPicker(
                          maximumFloorLimit: maximumFloorLimit,
                          minimumFloorLimit: minimumFloorLimit,
                          selectedMaxFloor: selectedMaxFloor,
                          selectedMinFloor: selectedMinFloor,
                          onSelectMaxFloor: onSelectMaxFloor,
                          onSelectMinFloor: onSelectMinFloor,
                          type: _CafeFloorPickerType.max
                      );
                    }
                );
              },
              floorText: selectedMaxFloor.toFloor(),
            ),
            const HorizontalSpacer(20),
            _CafeFloorChangeButton(
              type: _CafeFloorChangeButtonType.plus,
              onTab: () {
                if(selectedMaxFloor <= maximumFloorLimit) {
                  onSelectMaxFloor(selectedMaxFloor + (selectedMaxFloor == -1 ? 2 : 1));
                }
              },
            )
          ],
        ),
        const VerticalSpacer(40),
        Container(
          decoration: BoxDecoration(
            color: AppColor.grey_100,
            borderRadius: BorderRadius.circular(12)
          ),
          width: greyAreaWidth,
          height: 48,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${selectedMinFloor.toFloor()}층 ~ ${selectedMaxFloor.toFloor()}층   ",
                style: TextSize.textSize_16
              ),
              Text(
                "총 ${calculateTotalFloor(maxFloor: selectedMaxFloor, minFloor: selectedMinFloor)}개층 입니다",
                style: TextSize.textSize_bold_16
              ),
            ],
          ),
        )
      ],
    );
  }
}

int calculateTotalFloor({required int minFloor, required int maxFloor}) {
  if(minFloor * maxFloor > 0) {
    return maxFloor - minFloor + 1;
  } else if (minFloor * maxFloor < 0) {
    return maxFloor - minFloor;
  } else {
    return 0;
  }
}

enum _CafeFloorChangeButtonType { plus, minus }

class _CafeFloorChangeButton extends StatelessWidget {
  final _CafeFloorChangeButtonType type;
  final VoidCallback onTab;

  const _CafeFloorChangeButton({
    Key? key,
    required this.type,
    required this.onTab
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30,
      height: 30,
      child: ElevatedButton(
        onPressed: onTab,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: AppColor.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Icon(
          type == _CafeFloorChangeButtonType.plus ? CupertinoIcons.plus : CupertinoIcons.minus,
          color: AppColor.white,
          size: 15,
        ),
      ),
    );
  }
}

class _FloorInputFrame extends StatelessWidget {
  final VoidCallback onTab;
  final String floorText;

  const _FloorInputFrame({
    Key? key,
    required this.onTab,
    required this.floorText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        alignment: Alignment.center,
        width: 88,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            width: 1,
            color: AppColor.grey_400
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$floorText  ", style: TextSize.textSize_bold_16_w700),
            const Text("층",style: TextSize.textSize_16)
          ]
        ),
      ),
    );
  }
}

enum _CafeFloorPickerType { max, min }

class _CafeFloorPicker extends StatelessWidget {
  final int maximumFloorLimit, minimumFloorLimit;
  final int selectedMaxFloor, selectedMinFloor;
  final Function(int) onSelectMaxFloor, onSelectMinFloor;
  final _CafeFloorPickerType type;

  const _CafeFloorPicker({
    Key? key,
    required this.maximumFloorLimit,
    required this.minimumFloorLimit,
    required this.selectedMaxFloor,
    required this.selectedMinFloor,
    required this.onSelectMaxFloor,
    required this.onSelectMinFloor,
    required this.type
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<({int floor, Widget widget})> pickerItems = [];
    switch(type) {
      case _CafeFloorPickerType.min:
        for(int i = minimumFloorLimit; i <= selectedMaxFloor; i++) {
          if(i != 0) {
            pickerItems.add((floor: i, widget: Center(child: Text("${i.toFloor()} 층"))));
          }
        }
      case _CafeFloorPickerType.max:
        for(int i = selectedMinFloor; i <= maximumFloorLimit; i++) {
          if(i != 0) {
            pickerItems.add((floor: i, widget: Center(child: Text("${i.toFloor()} 층"))));
          }
        }
    }

    return CupertinoAlertDialog(
        content: Container(
          padding: AppPadding.padding_10,
          child: Column(
            children: [
              SizedBox(
                height: 180,
                child: CupertinoPicker(
                  magnification: 1.6,
                  squeeze: 1.2,
                  useMagnifier: true,
                  itemExtent: 36,
                  scrollController: FixedExtentScrollController(initialItem: 0),
                  onSelectedItemChanged: (index) {
                    HapticFeedback.lightImpact();
                    switch(type) {
                      case _CafeFloorPickerType.max:
                        onSelectMaxFloor(pickerItems[index].floor);
                      case _CafeFloorPickerType.min:
                        onSelectMinFloor(pickerItems[index].floor);
                    }
                  },
                  children: [...pickerItems.map((e) => e.widget).toList()],
                ),
              ),
            ],
          ),
        )
    );
  }
}

