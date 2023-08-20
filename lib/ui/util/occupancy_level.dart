import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';

/// 혼잡도 레벨 객체. 직접 생성하지 말고 factory 객체를 사용할 것.
class OccupancyLevel {
  final String stringValue;
  final NOverlayImage markerImage;
  final String pinImagePath;
  final String thumbImagePath;
  final Color color;
  final Color complementaryColor;
  final String description;

  OccupancyLevel(this.stringValue, this.markerImage, this.pinImagePath,
      this.thumbImagePath, this.color, this.complementaryColor, this.description);

  factory OccupancyLevel.minus() => OccupancyLevel(
      "정보 없음",
      const NOverlayImage.fromAssetImage("asset/image/cafe_icon_0.png"),
      "asset/image/cafe_reverse_pin_0.png",
      "asset/image/cafe_thumb_icon_0.png",
      AppColor.black,
      AppColor.white,
      "정보가 없어요"
  );

  factory OccupancyLevel.zero() => OccupancyLevel(
      "한적",
      const NOverlayImage.fromAssetImage("asset/image/cafe_icon_1.png"),
      "asset/image/cafe_reverse_pin_0.png",
      "asset/image/cafe_thumb_icon_0.png",
      AppColor.white,
      AppColor.black,
      "카페가 한적해요"
  );

  factory OccupancyLevel.one() => OccupancyLevel(
      "보통",
      const NOverlayImage.fromAssetImage("asset/image/cafe_icon_2.png"),
      "asset/image/cafe_reverse_pin_1.png",
      "asset/image/cafe_thumb_icon_1.png",
      AppColor.occupancyLevel1,
      AppColor.white,
      "보통 이에요"
  );

  factory OccupancyLevel.two() => OccupancyLevel(
      "붐빔",
      const NOverlayImage.fromAssetImage("asset/image/cafe_icon_3.png"),
      "asset/image/cafe_reverse_pin_2.png",
      "asset/image/cafe_thumb_icon_2.png",
      AppColor.occupancyLevel2,
      AppColor.white,
      "카페가 조금 붐벼요"
  );

  factory OccupancyLevel.three() => OccupancyLevel(
      "혼잡",
      const NOverlayImage.fromAssetImage("asset/image/cafe_icon_4.png"),
      "asset/image/cafe_reverse_pin_3.png",
      "asset/image/cafe_thumb_icon_3.png",
      AppColor.black,
      AppColor.white,
      "카페가 매우 혼잡해요"
  );
}
