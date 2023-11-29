
import 'package:flutter/material.dart';

class DayOfWeekOpeningInfo {
  final bool isClose;
  final String fullText;
  final String shortText;
  final TimeOfDay openAt;
  final TimeOfDay closeAt;

  const DayOfWeekOpeningInfo({
    required this.isClose,
    required this.fullText,
    required this.shortText,
    required this.openAt,
    required this.closeAt
  });

  DayOfWeekOpeningInfo copyWith({
    bool? isPicked, bool? isEdited, bool? isClose, String? fullText, String? shortText, TimeOfDay? openAt, TimeOfDay? closeAt
  }) {
    return DayOfWeekOpeningInfo(
      isClose: isClose ?? this.isClose,
      fullText: fullText ?? this.fullText,
      shortText: shortText ?? this.shortText,
      openAt: openAt ?? this.openAt,
      closeAt: closeAt ?? this.closeAt,
    );
  }

  factory DayOfWeekOpeningInfo.empty({
    required String fullText,
    required String shortText
  }) => DayOfWeekOpeningInfo(
    isClose: false,
    fullText: fullText,
    shortText: shortText,
    openAt: const TimeOfDay(hour: 9, minute: 0),
    closeAt: const TimeOfDay(hour: 22, minute: 0)
  );

  String getOpeningHourText() {
    final openMinuteString = openAt.minute < 10 ? "0${openAt.minute}" : openAt.minute.toString();
    final closeMinuteString = closeAt.minute < 10 ? "0${closeAt.minute}" : closeAt.minute.toString();
    return "${openAt.hour}:$openMinuteString ~ ${closeAt.hour}:$closeMinuteString";
  }

  String getOpeningHourWithPeriod() {
    final openHourString = openAt.hourOfPeriod < 10 ? "0${openAt.hourOfPeriod}" : openAt.hourOfPeriod.toString();
    final openMinuteString = openAt.minute < 10 ? "0${openAt.minute}" : openAt.minute.toString();
    return "${openAt.period == DayPeriod.am ? "오전" : "오후"}  $openHourString:$openMinuteString";
  }

  String getClosingHourWithPeriod() {
    final closeHourString = closeAt.hourOfPeriod < 10 ? "0${closeAt.hourOfPeriod}" : closeAt.hourOfPeriod.toString();
    final closeMinuteString = closeAt.minute < 10 ? "0${closeAt.minute}" : closeAt.minute.toString();
    return "${closeAt.period == DayPeriod.am ? "오전" : "오후"}  $closeHourString:$closeMinuteString";
  }
}