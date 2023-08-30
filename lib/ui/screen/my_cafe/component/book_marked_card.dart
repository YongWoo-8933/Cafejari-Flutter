import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/cached_network_image.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookMarkedCard extends StatelessWidget {
  final Cafe cafe;
  final double width;
  final double height;
  final VoidCallback? onPress;

  const BookMarkedCard({
    super.key,
    required this.cafe,
    required this.width,
    required this.height,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: ClipOval(
              child: CustomCachedNetworkImage(
                imageUrl: cafe.imageUrls.isNotEmpty ? cafe.imageUrls.first :
                  (cafe.brandImageUrl.isNotNull ? cafe.brandImageUrl! : "")
              ),
            ),
          ),
          const VerticalSpacer(12),
          Text(cafe.name, style: TextSize.textSize_bold_14, textAlign: TextAlign.center),
          const SizedBox(height: 4),
          Text(cafe.address, style: TextSize.textSize_grey_12, textAlign: TextAlign.center),
          const SizedBox(height: 8),
          SizedBox(
            height: 36,
            child: ElevatedButton(
              onPressed: onPress,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: const BorderSide(color: AppColor.grey_300),
                ),
                backgroundColor: AppColor.white,
                elevation: 0
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "삭제",
                    style: TextSize.textSize_12,
                  ),
                  HorizontalSpacer(4),
                  Icon(
                    CupertinoIcons.clear,
                    color: AppColor.black,
                    size: 12,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
