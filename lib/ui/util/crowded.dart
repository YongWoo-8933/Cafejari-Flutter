import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:cafejari_flutter/core/util.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';

/// 혼잡도 객체. 직접 생성하지 말고 factory 객체를 사용할 것.
class Crowded {
  final int intValue;
  final String stringValue;
  final NOverlayImage marker;
  final String iconName;
  final Color color;
  final Color complementaryColor;
  final String description;
  final String image;

  Crowded(this.intValue, this.stringValue, this.marker, this.iconName, this.color,
      this.complementaryColor, this.description, this.image);

  factory Crowded.minus() => Crowded(
      -1,
      "정보없음",
      NOverlayImage.fromAssetImage(getPNGAssetPath("4.0x/cafe_icon")),
      "cafe_icon",
      AppColor.grey_500,
      AppColor.white,
      "정보가 없어요",
      "asset/image/cafe_icon.png"
  );

  factory Crowded.zero([double dpi = 3.0]) => Crowded(
      0,
      "한적",
      NOverlayImage.fromAssetImage(getPNGAssetPath("4.0x/cafe_icon_0")),
      "cafe_icon_0",
      AppColor.crowdedBlue,
      AppColor.white,
      "카페가 한적해요",
      "asset/image/cafe_icon_0.png");

  factory Crowded.one([double dpi = 3.0]) => Crowded(
      1,
      "여유",
      NOverlayImage.fromAssetImage(getPNGAssetPath("4.0x/cafe_icon_1")),
      "cafe_icon_1",
      AppColor.crowdedGreen,
      AppColor.black,
      "카페가 여유로워요",
      "asset/image/cafe_icon_1.png");

  factory Crowded.two([double dpi = 3.0]) => Crowded(
      2,
      "보통",
      NOverlayImage.fromAssetImage(getPNGAssetPath("4.0x/cafe_icon_2")),
      "cafe_icon_2",
      AppColor.crowdedYellow,
      AppColor.black,
      "보통이에요",
      "asset/image/cafe_icon_2.png");

  factory Crowded.three([double dpi = 3.0]) => Crowded(
      3,
      "혼잡",
      NOverlayImage.fromAssetImage(getPNGAssetPath("4.0x/cafe_icon_3")),
      "cafe_icon_#",
      AppColor.crowdedOrange,
      AppColor.white,
      "카페가 붐벼요",
      "asset/image/cafe_icon_3.png");

  factory Crowded.four([double dpi = 3.0]) => Crowded(
      4,
      "만석",
      NOverlayImage.fromAssetImage(getPNGAssetPath("4.0x/cafe_icon_4")),
      "cafe_icon_4",
      AppColor.crowdedRed,
      AppColor.white,
      "남은 자리가 거의 없어요",
      "asset/image/cafe_icon_4.png");
}
