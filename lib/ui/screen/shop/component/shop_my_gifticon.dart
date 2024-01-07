import 'package:cached_network_image/cached_network_image.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/domain/entity/shop/shop.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/app_shadow.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/components/square_alert_dialog.dart';
import 'package:cafejari_flutter/ui/state/shop_state/shop_state.dart';
import 'package:cafejari_flutter/ui/view_model/shop_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShopMyBrandCon extends ConsumerWidget {
  final Brandcon brandcon;
  final double sidePadding;

  const ShopMyBrandCon({super.key, required this.brandcon, required this.sidePadding});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ShopState shopState = ref.watch(shopViewModelProvider);
    final ShopViewModel shopViewModel = ref.watch(shopViewModelProvider.notifier);
    final double deviceWidth = MediaQuery.of(context).size.width;
    const double itemHeight = 120;
    const double spacing = 20;
    final Item item = shopState.itemList.firstWhere((e) => e.itemId == brandcon.itemId, orElse: () => Item.empty());
    final Brand brand = shopState.brandList.firstWhere((e) => e.id == item.brandId, orElse: () => Brand.empty());

    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            insetPadding: AppPadding.padding_horizon_20,
            backgroundColor: AppColor.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const VerticalSpacer(15),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10, right: 10),
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Icon(
                          CupertinoIcons.xmark,
                          size: 28,
                          color: AppColor.primary
                        ),
                      ),
                    ),
                  ),
                  CachedNetworkImage(
                    imageUrl: brandcon.imageUrl,
                    fit: BoxFit.contain
                  ),
                  const VerticalSpacer(20),
                  ActionButtonPrimary(
                    buttonWidth: 240,
                    buttonHeight: 48,
                    title: "사용완료",
                    onPressed: () async {
                      await shopViewModel.updateBrandconIsUsed(brandcon: brandcon, isUsed: true, context: context);
                      if (context.mounted) Navigator.of(context).pop();
                    }
                  ),
                  const VerticalSpacer(20)
                ],
              ),
            ),
          );
        }
      ),
      child: Container(
        alignment: Alignment.center,
        width: deviceWidth - sidePadding * 2,
        height: itemHeight + spacing,
        color: AppColor.white,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: itemHeight,
                      height: itemHeight,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: AppShadow.box,
                          color: AppColor.white
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(imageUrl: item.largeImageUrl, width: itemHeight, height: itemHeight),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      width: deviceWidth - sidePadding * 2 - itemHeight,
                      height: itemHeight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(brand.name, style: const TextStyle(color: AppColor.secondary, fontWeight: FontWeight.bold)),
                              const VerticalSpacer(6),
                              Text(item.name, maxLines: 2, style: TextSize.textSize_bold_16),
                            ],
                          ),
                          Text(
                              "만료일자:  ${brandcon.expirationDate.toString().substring(0, 10)}",
                              style: const TextStyle(color: AppColor.grey_800, fontSize: 12)
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Visibility(
                  visible: brandcon.isUsed,
                  child: GestureDetector(
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) {
                        return SquareAlertDialog(
                          text: "브랜드콘을 사용 가능한 상태로 만들겠어요?",
                          negativeButtonText: "아니오",
                          positiveButtonText: "네",
                          onDismiss: () => Navigator.of(context).pop(),
                          onNegativeButtonPress: () {},
                          onPositiveButtonPress: () async {
                            await shopViewModel.updateBrandconIsUsed(brandcon: brandcon, isUsed: false, context: context);
                          }
                        );
                      }
                    ),
                    onLongPress: () => showDialog(
                      context: context,
                      builder: (context) {
                        return SquareAlertDialog(
                          text: "사용한 브랜드콘을 삭제 하시겠습니까?",
                          negativeButtonText: "아니오",
                          positiveButtonText: "네",
                          onDismiss: () => Navigator.of(context).pop(),
                          onNegativeButtonPress: () {},
                          onPositiveButtonPress: () async => await shopViewModel.deleteBrandcon(brandcon: brandcon, context: context)
                        );
                      }
                    ),
                    child: Container(
                      width: deviceWidth - sidePadding * 2,
                      height: itemHeight,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColor.transparentBlack_500,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: const Text(
                        "사용이 완료된 브랜드콘 입니다",
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700
                        )
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const VerticalSpacer(spacing)
          ],
        ),
      ),
    );
  }
}