import 'package:cached_network_image/cached_network_image.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/domain/entity/shop/shop.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/app_shadow.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/cached_network_image.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/state/shop_state/shop_state.dart';
import 'package:cafejari_flutter/ui/view_model/shop_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

final _isBuyLoading = StateProvider<bool>((ref) => false);

class ItemGrid extends ConsumerWidget {
  final double padding;
  final Brand brand;

  const ItemGrid({
    super.key,
    required this.padding,
    required this.brand
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ShopViewModel shopViewModel = ref.watch(shopViewModelProvider.notifier);
    final ShopState shopState = ref.watch(shopViewModelProvider);
    final GlobalState globalState = ref.watch(globalViewModelProvider);
    const double itemMinimumWidth = 180;
    final refreshController = RefreshController();
    final Items selectedItems = shopState.itemList.where((element) => element.brandId == brand.id).toList();
    const double dialogWidth = 240;

    return SmartRefresher(
      controller: refreshController,
      onRefresh: () async {
        await shopViewModel.refreshData(context: context);
        refreshController.refreshCompleted();
      },
      child: GridView.builder(
        padding: EdgeInsets.all(padding),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: itemMinimumWidth,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 0.6
        ),
        itemCount: selectedItems.length,
        itemBuilder: (context, index) {
          final Item item = selectedItems[index];
          return Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => showDialog(
                    context: context,
                    builder: (_) {
                      return Dialog(
                        insetPadding: AppPadding.padding_0,
                        backgroundColor: AppColor.transparent,
                        child: Container(
                          width: dialogWidth,
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const VerticalSpacer(15),
                              Container(
                                width: dialogWidth,
                                height: 24,
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  onTap: () => Navigator.of(context).pop(),
                                  child: const Icon(
                                    CupertinoIcons.xmark,
                                    size: 24,
                                    color: AppColor.primary
                                  ),
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 100,
                                decoration: const BoxDecoration(shape: BoxShape.circle),
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl: item.smallImageUrl,
                                    width: 100,
                                    height: 100
                                  ),
                                ),
                              ),
                              const VerticalSpacer(10),
                              Padding(
                                padding: AppPadding.padding_horizon_20,
                                child: Text(
                                  item.name,
                                  style: TextSize.textSize_bold_14,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const VerticalSpacer(4),
                              Text(
                                "${item.price}P",
                                style: const TextStyle(
                                  color: AppColor.secondary,
                                  fontWeight: FontWeight.w500
                                )
                              ),
                              const VerticalSpacer(10),
                              Container(
                                width: dialogWidth,
                                height: 160,
                                alignment: Alignment.center,
                                child: ref.watch(_isBuyLoading) ?
                                  const SizedBox(
                                    width: 32,
                                    height: 32,
                                    child: CircularProgressIndicator()
                                  ) :
                                  SingleChildScrollView(
                                    child: Text(item.description)
                                  ),
                              ),
                              const VerticalSpacer(20),
                              ActionButtonPrimary(
                                buttonWidth: dialogWidth,
                                buttonHeight: 48,
                                title: globalState.user.point < item.price ? "포인트 부족" : "구매하기",
                                onPressed: globalState.user.point < item.price ? null : () async {
                                  ref.watch(_isBuyLoading.notifier).update((state) => true);
                                  await shopViewModel.buyBrandcon(item: item, context: context);
                                  ref.watch(_isBuyLoading.notifier).update((state) => false);
                                  if (context.mounted) Navigator.of(context).pop();
                                }
                              ),
                              const VerticalSpacer(15)
                            ],
                          ),
                        ),
                      );
                    }
                  ),
                  child: Container(
                    width: itemMinimumWidth,
                    height: itemMinimumWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: AppShadow.box,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CustomCachedNetworkImage(imageUrl: item.largeImageUrl, width: 150),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const VerticalSpacer(15),
                    Text(item.name, maxLines: 3),
                    const VerticalSpacer(4),
                    Text("${item.price}P", style: TextSize.textSize_bold_16)
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}