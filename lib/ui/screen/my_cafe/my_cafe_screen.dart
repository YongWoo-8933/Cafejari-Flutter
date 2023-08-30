import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/buttons/question_button.dart';
import 'package:cafejari_flutter/ui/components/cati_blocks.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/screen/my_cafe/component/book_marked_card.dart';
import 'package:cafejari_flutter/ui/screen/my_cafe/component/cafe_recommendation_card.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';
import 'package:cafejari_flutter/ui/view_model/global_view_model.dart';
import 'package:cafejari_flutter/ui/view_model/map_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';

class MyCafeScreen extends ConsumerStatefulWidget {
  const MyCafeScreen({super.key});

  @override
  MyCafeScreenState createState() => MyCafeScreenState();
}

class MyCafeScreenState extends ConsumerState<MyCafeScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
    });
  }

  @override
  Widget build(BuildContext context) {
    final MapState mapState = ref.watch(mapViewModelProvider);
    final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);
    final GlobalViewModel globalViewModel = ref.watch(globalViewModelProvider.notifier);
    final GlobalState globalState = ref.watch(globalViewModelProvider);
    final Size deviceSize = MediaQuery.of(context).size;
    final double bottomNavBarHeight = ref.watch(bottomNavBarHeightProvider);
    final double bottomNavBarCornerRadius = ref.watch(bottomNavBarCornerRadiusProvider);
    const double sidePadding = 20;

    return Container(
      width: deviceSize.width,
      height: deviceSize.height - bottomNavBarHeight + bottomNavBarCornerRadius,
      color: AppColor.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const VerticalSpacer(60),
            // 내 카페 리스트 파트
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: sidePadding),
                  child: Text("내 카페 PICK", style: TextSize.textSize_bold_16),
                ),
                const VerticalSpacer(30),
                SizedBox(
                  width: deviceSize.width,
                  height: 240,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: sidePadding),
                    itemCount: globalState.user.favoriteCafes.length,
                    itemBuilder: (context, index) {
                      final Cafe cafe = globalState.user.favoriteCafes[index];
                      return BookMarkedCard(
                        cafe: cafe,
                        width: 160,
                        height: 240,
                        onPress: () => mapViewModel.updateFavoriteCafeList(cafe.id),
                      );
                    },
                  ),
                ),
              ],
            ),
            const VerticalSpacer(10),
            // Cati 파트
            Container(
              width: deviceSize.width,
              color: AppColor.background,
              padding: const EdgeInsets.all(sidePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text('내가 선호하는 CATI ', style: TextSize.textSize_bold_16),
                          const HorizontalSpacer(4),
                          QuestionButton(
                            onPressed: () {}
                          )
                        ],
                      ),
                      ActionButtonPrimary(
                        buttonWidth: 56,
                        buttonHeight: 36,
                        title: "수정",
                        onPressed: () => {},
                      )
                    ],
                  ),
                  const VerticalSpacer(30),
                  const CATIBlocks(
                    hasOpenness: true,
                    is2ndBlockClicked: false,
                    is3rdBlockClicked: true,
                    is4thBlockClicked: true
                  ),
                  const VerticalSpacer(20)
                ],
              ),
            ),
            Container(
              width: deviceSize.width,
              padding: const EdgeInsets.all(sidePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("이런 카페는 어때요?", style: TextSize.textSize_bold_16),
                  const VerticalSpacer(20),
                  SizedBox(
                    height: 240,
                    width: deviceSize.width,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        CafeRecommendationCard(
                          cafe: mapState.selectedCafe,
                          width: 210,
                          height: 240
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const VerticalSpacer(100),
          ],
        ),
      ),
    );
  }
}
