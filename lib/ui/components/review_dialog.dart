import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';


final _selectedAppInconvenienceReason = StateProvider((ref) => AppInconvenienceReason.none);

enum AppInconvenienceReason { none, noCafe, occupancyRate, noNeed, noUse, appUse, etc }

class ReviewDialog extends ConsumerWidget {

  const ReviewDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = MediaQuery.of(context).size;
    final globalViewModel = ref.watch(globalViewModelProvider.notifier);
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
            DropdownButton<AppInconvenienceReason>(
              value: ref.watch(_selectedAppInconvenienceReason),
              icon: const Icon(CupertinoIcons.chevron_down),
              elevation: 3,
              onChanged: (AppInconvenienceReason? value) {
                ref.watch(_selectedAppInconvenienceReason.notifier).update((state) => value ?? state);
              },
              items: const [
                DropdownMenuItem(value: AppInconvenienceReason.none, child: Text("선택")),
                DropdownMenuItem(value: AppInconvenienceReason.noCafe, child: Text("원하는 카페가 없어요")),
                DropdownMenuItem(value: AppInconvenienceReason.occupancyRate, child: Text("혼잡도 정보가 더 자세했으면 좋겠어요\n(ex. 구체적인 자리 정보 등)")),
                DropdownMenuItem(value: AppInconvenienceReason.noUse, child: Text("카페를 자주 방문하지 않아요")),
                DropdownMenuItem(value: AppInconvenienceReason.noNeed, child: Text("여기서 제공 하는 정보는 \n이미 알고있거나 유용하지 않아요")),
                DropdownMenuItem(value: AppInconvenienceReason.appUse, child: Text("앱 사용이 불편해요")),
                DropdownMenuItem(value: AppInconvenienceReason.etc, child: Text("기타")),
              ],
            ),
            const VerticalSpacer(30),
            ActionButtonPrimary(
              buttonWidth: deviceSize.width - 20 * 2 - 30 * 2,
              buttonHeight: 48,
              title: "제출",
              onPressed: ref.watch(_selectedAppInconvenienceReason) == AppInconvenienceReason.none ? null : () async {
                await globalViewModel.setIsReviewSubmitted(true);
                if (context.mounted) {
                  await globalViewModel.submitAppFeedback(
                    reason: ref.watch(_selectedAppInconvenienceReason),
                    context: context
                  );
                }
                if(context.mounted) Navigator.pop(context);
              }
            )
          ],
        ),
      ),
    );
  }
}
