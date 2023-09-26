import 'package:cached_network_image/cached_network_image.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/domain/entity/shop/shop.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/view_model/shop_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _isBuyLoading = StateProvider<bool>((ref) => false);


class ItemDialog extends ConsumerWidget {
  final Item item;

  const ItemDialog({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ShopViewModel shopViewModel = ref.watch(shopViewModelProvider.notifier);
    final GlobalState globalState = ref.watch(globalViewModelProvider);
    const double dialogWidth = 240;

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
                isLoading: ref.watch(_isBuyLoading),
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
}