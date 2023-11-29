import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/font.dart';
import 'package:flutter/material.dart';

class Theming {
  static const TextStyle darkText = TextStyle(
    color: AppColor.grey_600,
    fontFamily: AppFont.inter,
    fontWeight: FontWeight.w400
  );

  static const TextStyle lightText = TextStyle(
    color: AppColor.black,
    fontFamily: AppFont.inter,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    fontSize: 14
  );

  static final ThemeData darkTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity, // 시각적 밀도 설정(플렛폼에 따라 밀도를 조정)
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey) // 기본 색상 스웨치를 파란색 계열로 설정
        .copyWith(secondary: Colors.black, brightness: Brightness.dark),
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
    appBarTheme: const AppBarTheme(
      toolbarTextStyle: lightText,
    ),
    primaryTextTheme: const TextTheme(
      displayLarge: lightText,
      displayMedium: lightText,
      displaySmall: lightText,
      bodyLarge: lightText,
      bodyMedium: lightText,
      bodySmall: lightText,
      labelMedium: lightText,
      labelLarge: lightText,
      labelSmall: lightText
    ),
    textTheme: const TextTheme(
      bodyLarge: lightText,
      bodyMedium: lightText,
      labelMedium: lightText,
      bodySmall: lightText,
      labelLarge: lightText,
      labelSmall: lightText
    ),
    scaffoldBackgroundColor: AppColor.grey_600,
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
        .copyWith(background: AppColor.grey_300),
  );
}
