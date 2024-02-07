import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';


final _selectedAppInconvenienceCategory = StateProvider((ref) => AppInconvenienceCategory.none);
final _selectedCafeReason = StateProvider((ref) => _cafeReasons.first);
final _selectedOccupancyReason = StateProvider((ref) => _occupancyReasons.first);
final _selectedAppUseReason = StateProvider((ref) => _appUseReasons.first);
final _selectedPointReason = StateProvider((ref) => _pointReasons.first);

const List<String> _cafeReasons = [
  "",
  "가려는 카페가 없어요",
  "내 주변에 카페가 없어요",
  "가려는 지역에 카페가 없어요",
  "카페에 잘 가지 않아요",
  "앱이 운영되고 있는지 모르겠어요",
];

const List<String> _occupancyReasons = [
  "",
  "혼잡도 정보가 필요없어요",
  "가려는 카페의 혼잡도가 없어요",
  "제공중인 혼잡도 정보가 적어요",
  "앱이 운영되고 있는지 모르겠어요",
];

const List<String> _appUseReasons = [
  "",
  "앱을 어떻게 사용하는지 모르겠어요",
  "앱이 사용하기 불편해요",
  "앱이 운영되고 있는지 모르겠어요",
];

const List<String> _pointReasons = [
  "",
  "혼잡도 등록으로 \n포인트를 벌기 힘들어요",
  "제공되는 포인트의 양이 적어요",
];

enum AppInconvenienceCategory { none, cafe, occupancy, point, appUse }

class ReviewDialog extends ConsumerWidget {

  const ReviewDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = MediaQuery.of(context).size;
    final globalViewModel = ref.watch(globalViewModelProvider.notifier);
    final selectedCategory = ref.watch(_selectedAppInconvenienceCategory);
    final selectedCafeReason = ref.watch(_selectedCafeReason);
    final selectedOccupancyReason = ref.watch(_selectedOccupancyReason);
    final selectedAppUseReason = ref.watch(_selectedAppUseReason);
    final selectedPointReason = ref.watch(_selectedPointReason);

    return Dialog(
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
      backgroundColor: AppColor.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("피드백 제출", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const VerticalSpacer(6),
            const Text(
              "서비스 이용에 불편을 드려 죄송합니다. \n개선할 점을 선택해주세요",
              style: TextStyle(color: AppColor.grey_800)
            ),
            const VerticalSpacer(20),
            // 카테고리 선택
            DropdownButton<AppInconvenienceCategory>(
              value: selectedCategory,
              icon: const Icon(CupertinoIcons.chevron_down),
              elevation: 3,
              onChanged: (AppInconvenienceCategory? value) {
                ref.watch(_selectedAppInconvenienceCategory.notifier).update((state) => value ?? state);
                ref.watch(_selectedCafeReason.notifier).update((state) => "");
                ref.watch(_selectedOccupancyReason.notifier).update((state) => "");
                ref.watch(_selectedAppUseReason.notifier).update((state) => "");
                ref.watch(_selectedPointReason.notifier).update((state) => "");
              },
              items: const [
                DropdownMenuItem(value: AppInconvenienceCategory.none, child: Text("선택")),
                DropdownMenuItem(value: AppInconvenienceCategory.cafe, child: Text("카페")),
                DropdownMenuItem(value: AppInconvenienceCategory.occupancy, child: Text("혼잡도")),
                DropdownMenuItem(value: AppInconvenienceCategory.appUse, child: Text("앱 사용성")),
                DropdownMenuItem(value: AppInconvenienceCategory.point, child: Text("포인트"))
              ],
            ),
            const VerticalSpacer(10),
            // 이유 선택 - cafe
            Visibility(
              visible: selectedCategory == AppInconvenienceCategory.cafe,
              child: DropdownButton<String>(
                value: selectedCafeReason,
                icon: const Icon(CupertinoIcons.chevron_down),
                elevation: 3,
                onChanged: (String? value) {
                  ref.watch(_selectedCafeReason.notifier).update((state) => value ?? state);
                },
                items: _cafeReasons.map((e) => DropdownMenuItem(value: e, child: Text(e.isNotEmpty ? e : "사유 선택"))).toList(),
              ),
            ),
            // 이유 선택 - occupancy
            Visibility(
              visible: selectedCategory == AppInconvenienceCategory.occupancy,
              child: DropdownButton<String>(
                value: selectedOccupancyReason,
                icon: const Icon(CupertinoIcons.chevron_down),
                elevation: 3,
                onChanged: (String? value) {
                  ref.watch(_selectedOccupancyReason.notifier).update((state) => value ?? state);
                },
                items: _occupancyReasons.map((e) => DropdownMenuItem(value: e, child: Text(e.isNotEmpty ? e : "사유 선택"))).toList(),
              ),
            ),
            // 이유 선택 - appUse
            Visibility(
              visible: selectedCategory == AppInconvenienceCategory.appUse,
              child: DropdownButton<String>(
                value: selectedAppUseReason,
                icon: const Icon(CupertinoIcons.chevron_down),
                elevation: 3,
                onChanged: (String? value) {
                  ref.watch(_selectedAppUseReason.notifier).update((state) => value ?? state);
                },
                items: _appUseReasons.map((e) => DropdownMenuItem(value: e, child: Text(e.isNotEmpty ? e : "사유 선택"))).toList(),
              ),
            ),
            // 이유 선택 - point
            Visibility(
              visible: selectedCategory == AppInconvenienceCategory.point,
              child: DropdownButton<String>(
                value: selectedPointReason,
                icon: const Icon(CupertinoIcons.chevron_down),
                elevation: 3,
                onChanged: (String? value) {
                  ref.watch(_selectedPointReason.notifier).update((state) => value ?? state);
                },
                items: _pointReasons.map((e) => DropdownMenuItem(value: e, child: Text(e.isNotEmpty ? e : "사유 선택"))).toList(),
              ),
            ),
            const VerticalSpacer(30),
            ActionButtonPrimary(
              buttonWidth: deviceSize.width - 20 * 2 - 30 * 2,
              buttonHeight: 48,
              title: "제출",
              onPressed: (
                selectedCategory == AppInconvenienceCategory.cafe && selectedCafeReason.isNotEmpty ||
                selectedCategory == AppInconvenienceCategory.occupancy && selectedOccupancyReason.isNotEmpty ||
                selectedCategory == AppInconvenienceCategory.appUse && selectedAppUseReason.isNotEmpty ||
                selectedCategory == AppInconvenienceCategory.point && selectedPointReason.isNotEmpty
              ) ? () async {
                await globalViewModel.setIsReviewSubmitted(true);
                String reason = "";
                switch(selectedCategory) {
                  case AppInconvenienceCategory.none: reason = "";
                  case AppInconvenienceCategory.cafe: reason = selectedCafeReason;
                  case AppInconvenienceCategory.occupancy: reason = selectedOccupancyReason;
                  case AppInconvenienceCategory.point: reason = selectedPointReason;
                  case AppInconvenienceCategory.appUse: reason = selectedAppUseReason;
                }
                if (context.mounted) {
                  await globalViewModel.submitAppFeedback(
                    category: selectedCategory,
                    reason: reason,
                    context: context
                  );
                }
                if(context.mounted) Navigator.pop(context);
              } : null
            )
          ],
        ),
      ),
    );
  }
}
