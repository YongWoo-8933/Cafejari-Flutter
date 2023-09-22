import 'package:cafejari_flutter/domain/entity/shop/shop.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/cached_network_image.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/components/back_button_app_bar.dart';
import 'package:cafejari_flutter/ui/screen/shop/component/item_grid.dart';
import 'package:cafejari_flutter/ui/screen/shop/component/shop_my_gifticon.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/shop_state/shop_state.dart';
import 'package:cafejari_flutter/ui/view_model/shop_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class ShopScreen extends ConsumerStatefulWidget {
  const ShopScreen({super.key});

  @override
  ShopScreenState createState() => ShopScreenState();
}

class ShopScreenState extends ConsumerState<ShopScreen> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      final ShopViewModel shopViewModel = ref.watch(shopViewModelProvider.notifier);
      await shopViewModel.refreshData(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final ShopViewModel shopViewModel = ref.read(shopViewModelProvider.notifier);
    final ShopState shopState = ref.watch(shopViewModelProvider);
    final GlobalState globalState = ref.watch(globalViewModelProvider);
    final Size deviceSize = MediaQuery.of(context).size;
    const double padding = 20.0;
    final RefreshController refreshController = RefreshController();

    return Scaffold(
      appBar: BackButtonAppBar(
        backButtonText: "포인트 SHOP",
        backGroundColor: AppColor.white,
        onBack: () => GoRouter.of(context).pop(),
      ),
      backgroundColor: AppColor.white,
      body: DefaultTabController(
        length: 2, // 탭의 수
        child: Column(
          children: [
            GestureDetector(
              onTap: () => GoRouter.of(context).goNamed(ScreenRoute.point),
              child: Container(
                padding: AppPadding.padding_20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("내 포인트", style: TextSize.textSize_grey_14),
                    const HorizontalSpacer(8),
                    Text("${globalState.user.point}", style: TextSize.textSize_bold_20),
                    // const HorizontalSpacer(4),
                    // const Icon(CupertinoIcons.right_chevron, size: 16)
                  ],
                ),
              ),
            ),
            // 구매하기 / 브랜드콘 탭바
            Container(
              width: deviceSize.width - padding * 2,
              height: 60,
              decoration: BoxDecoration(
                color: AppColor.challengeBlock,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.all(6),
              child: TabBar(
                indicator: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  color: AppColor.primary,
                ),
                labelColor: AppColor.white,
                unselectedLabelColor: AppColor.unselectedTabBarColor,
                tabs: const [
                  Tab(
                    child: Text("구매하기", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  ),
                  Tab(
                    child: Text("내 브랜드콘", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
            ),
            const VerticalSpacer(10),
            // 하단 페이지 뷰
            Visibility(
              visible: shopState.isLoading,
              child: Expanded(
                child: Container(
                  alignment: Alignment.center,
                  color: AppColor.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LoadingAnimationWidget.hexagonDots(color: AppColor.primary, size: 36),
                      const VerticalSpacer(10),
                      const Text("데이터 로드중.."),
                      const VerticalSpacer(60),
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: !shopState.isLoading,
              child: Expanded(
                child: TabBarView(
                  children: [
                    // 구매하기(상점) 파트
                    DefaultTabController(
                      length: shopState.brandList.length, // 탭의 개수
                      child: Column(
                        children: [
                          Container(
                            color: Colors.white, // 원하는 배경색
                            child: TabBar(
                              indicator: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              labelColor: AppColor.black,
                              padding: AppPadding.padding_horizon_10,
                              unselectedLabelColor: AppColor.grey_300,
                              labelStyle: TextSize.textSize_bold_14,
                              unselectedLabelStyle: TextSize.textSize_grey_14,
                              isScrollable: true,
                              tabs: List<Widget>.generate(
                                shopState.brandList.length,
                                    (index) {
                                  final Brand brand = shopState.brandList[index];
                                  return Tab(child: Row(children: [
                                    CustomCachedNetworkImage(
                                      imageUrl: brand.imageUrl,
                                      width: 30,
                                      height: 30
                                    ),
                                    const HorizontalSpacer(8),
                                    Text(brand.name)
                                  ]));
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                ...shopState.brandList.map((brand) => ItemGrid(padding: padding, brand: brand)).toList()
                              ]
                            ),
                          ),
                        ],
                      ),
                    ),
                    // 브랜드콘 파트
                    Stack(
                      children: [
                        Visibility(
                          visible: shopState.myBrandcons.isNotEmpty,
                          child: SmartRefresher(
                            controller: refreshController,
                            onRefresh: () async {
                              await shopViewModel.refreshData(context: context);
                              refreshController.refreshCompleted();
                            },
                            child: ListView.builder(
                              padding: const EdgeInsets.all(30),
                              itemCount: shopState.myBrandcons.length,
                              itemBuilder: (context, index) => ShopMyBrandCon(
                                brandcon: shopState.myBrandcons[index],
                                sidePadding: 30,
                              ),
                            )
                          ),
                        ),
                        Visibility(
                          visible: shopState.myBrandcons.isEmpty,
                          child: Container(
                            alignment: Alignment.center,
                            height: 300,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset("asset/image/icon_empty.png", width: 100),
                                const VerticalSpacer(20),
                                const Text("구매한 상품이 없어요", style: TextSize.textSize_16,),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}