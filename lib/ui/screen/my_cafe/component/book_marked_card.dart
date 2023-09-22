import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/duration.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/cached_network_image.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:flutter/cupertino.dart';

class BookMarkedCard extends StatelessWidget {
  final Cafe cafe;
  final double width;
  final String randomImageUrl;
  final bool isEditMode;
  final VoidCallback? onDelete;
  final VoidCallback? onTap;

  const BookMarkedCard({
    super.key,
    required this.cafe,
    required this.width,
    required this.randomImageUrl,
    required this.isEditMode,
    this.onDelete,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    const double sidePadding = 25;
    const double verticalPadding = 15;
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: verticalPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: sidePadding),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      width: width - sidePadding * 2,
                      height: width - sidePadding * 2,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: ClipOval(
                        child: CustomCachedNetworkImage(
                          imageUrl: cafe.imageUrls.isNotEmpty ? cafe.imageUrls.first :
                            (cafe.brandImageUrl.isNotNull ? cafe.brandImageUrl! : randomImageUrl)
                        ),
                      ),
                    ),
                    AnimatedSize(
                      duration: AppDuration.animationDefault,
                      child: GestureDetector(
                        onTap: onDelete,
                        child: Container(
                          width: isEditMode ? 32 : 0,
                          height: isEditMode ? 32 : 0,
                          padding: AppPadding.padding_0,
                          decoration: const BoxDecoration(
                            color: AppColor.white,
                            shape: BoxShape.circle
                          ),
                          child: Icon(
                            CupertinoIcons.minus_circle_fill,
                            color: AppColor.primary,
                            fill: 1,
                            size: isEditMode ? 32 : 0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const VerticalSpacer(16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: sidePadding - 10),
                child: Column(
                  children: [
                    Text(cafe.name, style: TextSize.textSize_bold_14, textAlign: TextAlign.center),
                    const SizedBox(height: 6),
                    Text(cafe.address, style: TextSize.textSize_grey_12, textAlign: TextAlign.center),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
