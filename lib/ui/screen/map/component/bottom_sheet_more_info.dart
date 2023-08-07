
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';

class BottomSheetMoreInfo extends ConsumerWidget {
  const BottomSheetMoreInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapState mapState = ref.watch(mapViewModelProvider);

    return Container(
      padding: AppPadding.padding_30,
      decoration: const BoxDecoration(
        color: AppColor.background
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("상세 정보", style: TextSize.textSize_bold_16),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('asset/image/icon_watch.png'),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("월요일 ", style: TextSize.textSize_grey_14),
                        Text(mapState.selectedCafe.openingHour?.mon != null ? '${convertTo12HourFormat(mapState.selectedCafe.openingHour!.mon)}' : '정보없음')
                      ],
                    ),
                    Row(
                      children: [
                        Text("화요일 ", style: TextSize.textSize_grey_14),
                        Text(mapState.selectedCafe.openingHour?.tue != null ? '${convertTo12HourFormat(mapState.selectedCafe.openingHour!.tue)}' : '정보없음')
                      ],
                    ),
                    Row(
                      children: [
                        Text("수요일 ", style: TextSize.textSize_grey_14),
                        Text(mapState.selectedCafe.openingHour?.wed != null ? '${convertTo12HourFormat(mapState.selectedCafe.openingHour!.wed)}' : '정보없음')
                      ],
                    ),
                    Row(
                      children: [
                        Text("목요일 ", style: TextSize.textSize_grey_14),
                        Text(mapState.selectedCafe.openingHour?.thu != null ? '${convertTo12HourFormat(mapState.selectedCafe.openingHour!.thu)}' : '정보없음')
                      ],
                    ),
                    Row(
                      children: [
                        Text("금요일 ", style: TextSize.textSize_grey_14),
                        Text(mapState.selectedCafe.openingHour?.fri != null ? '${convertTo12HourFormat(mapState.selectedCafe.openingHour!.fri)}' : '정보없음')
                      ],
                    ),
                    Row(
                      children: [
                        Text("토요일 ", style: TextSize.textSize_grey_14),
                        Text(mapState.selectedCafe.openingHour?.sat != null ? '${convertTo12HourFormat(mapState.selectedCafe.openingHour!.sat)}' : '정보없음')
                      ],
                    ),
                    Row(
                      children: [
                        Text("일요일 ", style: TextSize.textSize_grey_14),
                        Text(mapState.selectedCafe.openingHour?.son != null ? '${convertTo12HourFormat(mapState.selectedCafe.openingHour!.son)}' : '정보없음')
                        Text(mapState.selectedCafe.openingHour?.sun != null ? '${convertTo12HourFormat(mapState.selectedCafe.openingHour!.sun)}' : '정보없음')
                      ],
                    ),
                  ],
                )
              ],
            )
          ],
      ),
    );
  }
}

String convertTo12HourFormat(String openingHours) {
  // Split the opening hours string into start and end times
  List<String> times = openingHours.split(' - ');

  // Parse the times and extract hours and minutes
  List<TimeOfDay> parsedTimes = times.map((time) {
    List<String> parts = time.split(':');
    int hour = int.parse(parts[0]);
    int minute = int.parse(parts[1]);
    return TimeOfDay(hour: hour, minute: minute);
  }).toList();

  // Convert each time to 12-hour format with AM or PM
  List<String> formattedTimes = parsedTimes.map((time) {
    int hour = time.hour;
    int minute = time.minute;
    String period = (hour < 12) ? '오전' : '오후';

    if (hour > 12) {
      hour -= 12;
    } else if (hour == 0) {
      hour = 12;
    }

    return '$period ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }).toList();

  return '${formattedTimes[0]} - ${formattedTimes[1]}';
}

