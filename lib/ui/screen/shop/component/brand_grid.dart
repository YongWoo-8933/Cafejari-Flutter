import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/domain/entity/shop/shop.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/cached_network_image.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/screen/challenge/component/challenge_record_block.dart';
import 'package:cafejari_flutter/ui/screen/challenge/component/challenge_small_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BrandGrid extends StatelessWidget {
  final Items items;
  final int brandId;

  const BrandGrid({super.key,
    required this.items,
    required this.brandId
  });

  @override
  Widget build(BuildContext context) {
    final double gridWidth = MediaQuery.of(context).size.width - 80;

    final List<Item> brandItems = [];
    for (int i = 0; i < items.length; i++) {
      if (items[i].brandId == brandId) {
        brandItems.add(items[i]);
      }
    }

    return Container(
      padding: AppPadding.padding_30,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 160,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.75
        ),
        itemCount: items.length, // 전체 아이템 수
        itemBuilder: (context, index) {
          return _buildBlockCell(brandItems[index].smallImageUrl,brandItems[index].name, brandItems[index].price, gridWidth, null);
        },
      ),
    );

  }

  Container _buildBlockCell(String image, String title, int price, double width, int? discount) {
    return Container(
      alignment: Alignment.center,
      width: width / 2,
      height: 240,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: width / 2,
            height: width / 2 - 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect( // 모서리를 둥글게 하기 위해 ClipRRect 사용
              borderRadius: BorderRadius.circular(10),
              child: CustomCachedNetworkImage(imageUrl: image, width: 150),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextSize.textSize_14),
              VerticalSpacer(10),
              Row(
                children: [
                  Text("${price}", style: TextSize.textSize_bold_16)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}