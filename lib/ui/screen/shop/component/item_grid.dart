import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/domain/entity/shop/shop.dart';
import 'package:cafejari_flutter/ui/app_config/app_shadow.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/cached_network_image.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/screen/shop/component/item_dialog.dart';
import 'package:cafejari_flutter/ui/state/shop_state/shop_state.dart';
import 'package:cafejari_flutter/ui/view_model/shop_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
    const double itemMinimumWidth = 180;
    final refreshController = RefreshController();
    final Items selectedItems = shopState.itemList.where((element) => element.brandId == brand.id).toList();

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
                    builder: (_) => ItemDialog(item: item)
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