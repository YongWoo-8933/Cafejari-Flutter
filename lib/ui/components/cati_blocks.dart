import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/app_shadow.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:flutter/material.dart';

class CATIBlocks extends StatelessWidget {
  final CATI? cati;

  const CATIBlocks({super.key, required this.cati});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildCategoryColumn(topText: "개방적인", bottomText: "아늑한", catiValue: cati?.openness),
        const HorizontalSpacer(8),
        _buildCategoryColumn(topText: "커피맛집", bottomText: "음료맛집", catiValue: cati?.coffee),
        const HorizontalSpacer(8),
        _buildCategoryColumn(topText: "업무공간", bottomText: "감성카페", catiValue: cati?.workspace),
        const HorizontalSpacer(8),
        _buildCategoryColumn(topText: "산미있는", bottomText: "고소한", catiValue: cati?.acidity),
      ],
    );
  }

  Widget _buildCategoryColumn({
    required String topText,
    required String bottomText,
    required int? catiValue
  }) {
    const double blockHeight = 84;
    const double blockWidth = 78;
    const double cornerRadius = 15;

    return Container(
      alignment: Alignment.center,
      width: blockWidth,
      height: blockHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornerRadius),
        boxShadow: AppShadow.box
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(cornerRadius),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: blockWidth,
              height: blockHeight / 2,
              decoration: BoxDecoration(
                color: catiValue.isNotNull && catiValue! > 0 ? AppColor.secondary : AppColor.white,
                border: const Border(
                  bottom: BorderSide(color: AppColor.secondary, width: 0.2, strokeAlign: BorderSide.strokeAlignInside)
                )
              ),
              child: Text(
                topText,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: catiValue.isNotNull && catiValue! > 0 ? AppColor.white : AppColor.black,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: blockWidth,
              height: blockHeight / 2,
              decoration: BoxDecoration(
                color: catiValue.isNotNull && catiValue! < 0 ? AppColor.secondary : AppColor.white,
                border: const Border(
                  top: BorderSide(color: AppColor.secondary, width: 0.2, strokeAlign: BorderSide.strokeAlignInside)
                )
              ),
              child: Text(
                bottomText,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: catiValue.isNotNull && catiValue! < 0 ? AppColor.white : AppColor.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
