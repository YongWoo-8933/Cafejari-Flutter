import 'package:another_xlider/another_xlider.dart';
import 'package:another_xlider/models/handler.dart';
import 'package:another_xlider/models/tooltip/tooltip.dart';
import 'package:another_xlider/models/trackbar.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WallSocketSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double>? onChanged;
  final String floor;
  final double trackHeight;
  final double thumbRadius;

  WallSocketSlider({
    required this.value,
    required this.floor,
    this.onChanged,
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
      child: Row(
        children: [
          Container(
            width: 40,
            child: Text("${floor}층"),
          ),
          Container(
            width: MediaQuery.of(context).size.width-100,
            height: 100,
            alignment: Alignment.bottomRight,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width - 130) / 4,
                      height: 10,
                      decoration: BoxDecoration(
                        color: AppColor.grey_100,
                        border: Border.all(
                          color: AppColor.grey_300, // 테두리 색상 설정
                          width: 1.0,          // 테두리 두께 설정
                        ),
                      ),
                    ),
                    Container(
                      width: (MediaQuery.of(context).size.width - 130) / 4,
                      height: 10,
                      color: AppColor.grey_300,
                    ),
                    Container(
                      width: (MediaQuery.of(context).size.width - 130) / 4,
                      height: 10,
                      color: AppColor.grey_600,
                    ),
                    Container(
                      width: (MediaQuery.of(context).size.width - 130) / 4,
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
                  handlerWidth: 24,
                  handlerHeight: 24,
                  handler: FlutterSliderHandler(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.white,
                      )
                    ),
                  ),
                  trackBar: FlutterSliderTrackBar(
                    activeTrackBar: BoxDecoration(
                      color: Colors.transparent.withOpacity(0.0),
                    ),
                    activeTrackBarHeight: 10.0,
                  ),
                  tooltip: FlutterSliderTooltip(
                    alwaysShowTooltip: true,
                    custom: (value) {
                      return Container(
                        decoration: BoxDecoration(
                          color: AppColor.secondary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.all(8),
                        child: Text(
                          '${value.floor()}%',
                          style: TextStyle(
                              color: AppColor.white
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ]
      ),
    );
  }
}
