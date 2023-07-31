import 'package:another_xlider/another_xlider.dart';
import 'package:another_xlider/models/handler.dart';
import 'package:another_xlider/models/trackbar.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double>? onChanged;
  final double trackHeight;
  final double thumbRadius;
  final double sliderWidth_padding;

  CustomSlider({
    required this.value,
    this.onChanged,
    required this.sliderWidth_padding,
    this.trackHeight = 10.0,
    this.thumbRadius = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        activeTrackColor: Colors.transparent,
        inactiveTrackColor: Colors.transparent,
        trackHeight: trackHeight,
        thumbShape: RoundSliderThumbShape(
          enabledThumbRadius: thumbRadius,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: (MediaQuery.of(context).size.width - 80 - sliderWidth_padding) / 4,
                height: 10,
                color: AppColor.grey_100,
              ),
              Container(
                width: (MediaQuery.of(context).size.width - 80 - sliderWidth_padding) / 4,
                height: 10,
                color: AppColor.grey_300,
              ),
              Container(
                width: (MediaQuery.of(context).size.width - 80 - sliderWidth_padding) / 4,
                height: 10,
                color: AppColor.grey_500,
              ),
              Container(
                width: (MediaQuery.of(context).size.width - 80 - sliderWidth_padding) / 4,
                height: 10,
                color: AppColor.grey_900,
              ),
            ],
          ),
          FlutterSlider(
            values: [value],
            min: 0,
            max: 100,
            onDragging: (handlerIndex, lowerValue, upperValue) {
              onChanged?.call(lowerValue);
            },
            handler: FlutterSliderHandler(
              child: getIconsForValue(value),
              decoration: BoxDecoration(
                color: getColorForValue(value),
                shape: BoxShape.circle,
              ),
            ),
            trackBar: FlutterSliderTrackBar(
              activeTrackBar: BoxDecoration(
                color: Colors.transparent.withOpacity(0.0),
              ),
              activeTrackBarHeight: 10.0,
            ),
          ),
        ],
      ),
    );
  }

  Color getColorForValue(double value) {
    if (value <= 25) {
      return AppColor.grey_100;
    } else if (value <= 50) {
      return AppColor.grey_300;
    } else if (value <= 75) {
      return AppColor.grey_500;
    } else {
      return AppColor.grey_900;
    }
  }

  Icon getIconsForValue(double value) {
    if (value <= 25) {
      return Icon(CupertinoIcons.person, color: Colors.black);
    } else if (value <= 50) {
      return Icon(CupertinoIcons.person_2, color: Colors.white);
    } else if (value <= 75) {
      return Icon(CupertinoIcons.person_3, color: Colors.white);
    } else {
      return Icon(CupertinoIcons.person_3, color: Colors.white);
    }
  }

}
