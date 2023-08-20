import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/screen/cafe_registration/component/registration_wallsocket/registration_wallsocket_slider.dart';
import 'package:cafejari_flutter/ui/state/request_state/request_state.dart';
import 'package:cafejari_flutter/ui/viewmodel/request_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';

class RegistrationOpeningHour extends ConsumerWidget {
  const RegistrationOpeningHour({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final RequestState requestState = ref.watch(requestViewModelProvider);

    return Container(
      padding: AppPadding.padding_horizon_30,
      child: Column(
        children: [
          for (var dayInfo in [
            DayInfo('월', requestState.openingHour.mon),
            DayInfo('화', requestState.openingHour.tue),
            DayInfo('수', requestState.openingHour.wed),
            DayInfo('목', requestState.openingHour.thu),
            DayInfo('금', requestState.openingHour.fri),
            DayInfo('토', requestState.openingHour.sat),
            DayInfo('일', requestState.openingHour.sun),
          ])
            _buildOpeningHourRow(dayInfo),

        ],
      ),
    );
  }

  Widget _buildOpeningHourRow(DayInfo dayInfo) {
    return Column(
      children:[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${dayInfo.day}요일', style: TextSize.textSize_14),
            Row(
              children: [
                Text('${convertTo12HourFormat(dayInfo.hours)}  '),
                Icon(Icons.edit, color: AppColor.secondary),
              ],
            ),
          ],
        ),
        VerticalSpacer(20),
      ]
    );
  }
}

class DayInfo {
  final String day;
  final String hours;

  DayInfo(this.day, this.hours);
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

