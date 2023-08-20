import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/cached_network_image.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/components/top_app_bar.dart';
import 'package:cafejari_flutter/ui/screen/shop/component/brand_grid.dart';
import 'package:cafejari_flutter/ui/screen/shop/component/shop_my_gifticon.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/shop_state/shop_state.dart';
import 'package:cafejari_flutter/ui/viewmodel/shop_view_model.dart';
import 'package:go_router/go_router.dart';


class ShopScreen extends ConsumerStatefulWidget {
  const ShopScreen({super.key});

  @override
  ShopScreenState createState() => ShopScreenState();
}


class ShopScreenState extends ConsumerState<ShopScreen>  {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      final viewModel = ref.watch(shopViewModelProvider.notifier);
      await viewModel.refreshBrand();
      await viewModel.refreshItem();
    });
  }

  @override
  Widget build(BuildContext context) {
    final ShopViewModel shopViewModel = ref.read(shopViewModelProvider.notifier);
    final ShopState shopState = ref.watch(shopViewModelProvider);

    final double taBarSize = (MediaQuery.of(context).size.width-60);

    return Scaffold(
      appBar: BackButtonAppBar(
        backButtonText: "포인트 SHOP",
        backGroundColor: AppColor.white,
        onBack: () => {GoRouter.of(context).pop()},
      ),
      backgroundColor: AppColor.white,
      body: DefaultTabController(
        length: 2, // 탭의 수
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                GoRouter.of(context).goNamed(ScreenRoute.point);
              },
              child: Container(
                margin: AppPadding.padding_10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("내 포인트  ", style: TextSize.textSize_grey_14,),
                    Row(
                      children: [
                        Text("45,000", style: TextSize.textSize_bold_20),
                        Icon(CupertinoIcons.right_chevron, size: 16,),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const VerticalSpacer(10),
            Container(
              width: taBarSize,
              height: 48,
              decoration: BoxDecoration(
                color: AppColor.challengeBlock,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: AppPadding.padding_7,
              child: TabBar(
                indicator: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // 모서리 둥글기 조절
                  ),
                  color: AppColor.primary, // 탭의 배경색
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
            const VerticalSpacer(15),
            Expanded(
              child: TabBarView(
                children: [
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
                            unselectedLabelColor: AppColor.grey_300,
                            isScrollable: true, // 스크롤 가능하게 설정
                            tabs: List<Widget>.generate(
                              shopState.brandList.length,
                                  (index) => Tab(child: Row(children: [
                                    CustomCachedNetworkImage(imageUrl: shopState.brandList[index].imageUrl, width: 30, height: 30),
                                    Text(shopState.brandList[index].name)
                                  ])), // 이름에 따라 Tab 생성
                            ),
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            children: List<Widget>.generate(
                              shopState.brandList.length,
                                  (index) => BrandGrid(
                                items: shopState.itemList
                                    .where((item) => item.brandId == shopState.brandList[index].id)
                                    .toList(),
                                brandId: shopState.brandList[index].id,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return ShopMyBrandCon();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}