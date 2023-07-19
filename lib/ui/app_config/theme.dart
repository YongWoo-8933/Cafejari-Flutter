import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/font.dart';
import 'package:flutter/material.dart';

class Themings {
  static final TextStyle darkText = TextStyle(
    color: AppColor.grey_500,
    fontFamily: AppFont.inter,
  );

  static final TextStyle lightText = TextStyle(
    color: AppColor.black,
    fontFamily: AppFont.inter,
  );

  static final ThemeData darkTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity, // 시각적 밀도 설정(플렛폼에 따라 밀도를 조정)
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue) // 기본 색상 스웨치를 파란색 계열로 설정
        .copyWith(secondary: Colors.blueAccent, brightness: Brightness.dark),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return Colors.green;
        }
        return null;
      }),
      trackColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return Colors.blue;
        }
        return null;
      }),
    ),
    radioTheme: RadioThemeData( // 라디오 버튼 위젯에 대한 테마 데이터 설정
      fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return Colors.green;
        }
        return null;
      }),
    ),
    checkboxTheme: CheckboxThemeData( // 체크박스 위젯에 대한 테마 데이터 설정
      fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return Colors.blue;
        }
        return null;
      }),
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColor.crowdedBlue,
    appBarTheme: AppBarTheme(
      toolbarTextStyle: lightText,
    ),
    textTheme: TextTheme(
      bodyLarge: lightText,
      bodyMedium: lightText,
      labelMedium: lightText,
      bodySmall: lightText,
      labelLarge: lightText,
      labelSmall: lightText,
    ),
    scaffoldBackgroundColor: AppColor.grey_500,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
        .copyWith(background: AppColor.grey_300),
  );
}
