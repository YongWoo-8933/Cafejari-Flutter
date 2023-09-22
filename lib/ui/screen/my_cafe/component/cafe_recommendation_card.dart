import 'package:cafejari_flutter/core/extension/int.dart';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/app_shadow.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/cached_network_image.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CafeRecommendationCard extends StatelessWidget {
  final Cafe cafe;
  final double width;

  const CafeRecommendationCard({
    super.key,
    required this.cafe,
    required this.width
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: AppShadow.box,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCachedNetworkImage(
              imageUrl: cafe.imageUrls.isNotEmpty ? cafe.imageUrls.first : cafe.brandImageUrl ?? "",
              width: width,
              height: 120,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cafe.catiTagText, style: TextSize.textSize_grey_12),
                  const VerticalSpacer(8),
                  SizedBox(
                    height: 36,
                    child: Text(cafe.name, style: TextSize.textSize_bold_16)
                  ),
                  const VerticalSpacer(18),
                  Row(
                    children: [
                      Image.asset("asset/image/icon_people4_black.png"),
                      const HorizontalSpacer(4),
                      const Text("혼잡도", style: TextSize.textSize_grey_12),
                      const HorizontalSpacer(4),
                      Text(
                        cafe.recentUpdatedOccupancyRate.isNotNull ? "${(cafe.recentUpdatedOccupancyRate! * 100).toInt()}%" : "정보없음",
                        style: TextSize.textSize_bold_12
                      ),
                    ],
                  ),
                  const VerticalSpacer(4),
                  Row(
                    children: [
                      Image.asset("asset/image/icon_plug.png"),
                      const HorizontalSpacer(4),
                      const Text("콘센트 보급율", style: TextSize.textSize_grey_12),
                      const HorizontalSpacer(4),
                      Text(
                        cafe.maximumWallSocketRate.isNotNull ?
                          "${(cafe.maximumWallSocketRate! * 100).toInt()}% (${cafe.maximumWallSocketFloor!.toFloor()}층)" :
                          "정보없음",
                        style: TextSize.textSize_bold_12
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
