import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/app_shadow.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:flutter/material.dart';

class CATIBlocks extends StatelessWidget {
  final bool hasOpenness;
  final bool isCoffeeFocused;
  final bool isWorkFriendly;
  final bool is4thBlockClicked;

  const CATIBlocks({
    super.key,
    required this.hasOpenness,
    required this.isCoffeeFocused,
    required this.isWorkFriendly,
    required this.is4thBlockClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildCategoryColumn(topText: "개방", bottomText: "아늑", isTopFilled: hasOpenness),
        const HorizontalSpacer(10),
        _buildCategoryColumn(topText: "커피", bottomText: "디저트", isTopFilled: isCoffeeFocused),
        const HorizontalSpacer(10),
        _buildCategoryColumn(topText: "공부/업무", bottomText: "힐링/감성", isTopFilled: isWorkFriendly),
        const HorizontalSpacer(10),
        _buildCategoryColumn(topText: "네번째", bottomText: "뭔가", isTopFilled: is4thBlockClicked),
      ],
    );
  }

  Widget _buildCategoryColumn({
    required String topText,
    required String bottomText,
    required bool isTopFilled
  }) {
    const double blockHeight = 84;
    const double blockWidth = 72;
    const double cornerRadius = 15;

    return Container(
      alignment: Alignment.center,
      width: blockWidth,
      height: blockHeight,
      decoration: BoxDecoration(
        color: isTopFilled ? AppColor.secondary : AppColor.white,
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
              color: isTopFilled ? AppColor.secondary : AppColor.white,
              child: Text(
                topText,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: isTopFilled ? AppColor.white : AppColor.black,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: blockWidth,
              height: blockHeight / 2,
              color: isTopFilled ? AppColor.white : AppColor.secondary,
              child: Text(
                bottomText,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: isTopFilled ? AppColor.black : AppColor.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
