import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/buttons/x_button.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/components/square_alert_dialog.dart';
import 'package:cafejari_flutter/ui/view_model/my_page_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _selectedWithdrawalReason = StateProvider<WithdrawalReason>((ref) => WithdrawalReason.none);

class WithdrawalDialog extends ConsumerWidget {

  const WithdrawalDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = MediaQuery.of(context).size;
    final MyPageViewModel myPageViewModel = ref.watch(myPageViewModelProvider.notifier);
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
            Align(
              alignment: Alignment.centerRight,
              child: XButton(
                buttonSize: 28,
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            const Text("회원 탈퇴", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const VerticalSpacer(6),
            const Text(
              "서비스 이용에 불편을 드려 죄송합니다. 탈퇴 사유를 남겨주시면 서비스 발전에 더욱 힘쓰겠습니다.",
              style: TextStyle(color: AppColor.grey_800)
            ),
            const VerticalSpacer(20),
            DropdownButton<WithdrawalReason>(
              value: ref.watch(_selectedWithdrawalReason),
              icon: const Icon(CupertinoIcons.chevron_down),
              elevation: 3,
              onChanged: (WithdrawalReason? value) {
                ref.watch(_selectedWithdrawalReason.notifier).update((state) => value ?? state);
              },
              items: const [
                DropdownMenuItem(value: WithdrawalReason.none, child: Text("탈퇴사유 선택")),
                DropdownMenuItem(value: WithdrawalReason.noCafe, child: Text("원하는 카페가 없어요")),
                DropdownMenuItem(value: WithdrawalReason.occupancyRate, child: Text("혼잡도가 부정확해요")),
                DropdownMenuItem(value: WithdrawalReason.appUse, child: Text("앱 사용이 불편해요")),
                DropdownMenuItem(value: WithdrawalReason.design, child: Text("디자인이 별로에요")),
                DropdownMenuItem(value: WithdrawalReason.etc, child: Text("기타")),
              ],
            ),
            const VerticalSpacer(30),
            ActionButtonPrimary(
              buttonWidth: deviceSize.width - 20 * 2 - 30 * 2,
              buttonHeight: 48,
              title: "다음",
              onPressed: ref.watch(_selectedWithdrawalReason) == WithdrawalReason.none ? null : () => showDialog(
                context: context,
                builder: (_) => SquareAlertDialog(
                  text: "탈퇴 후 계정은 비활성 처리되며, 7일 이내로 완전 삭제됩니다. 진행하시겠어요?",
                  negativeButtonText: "예",
                  positiveButtonText: "아니오",
                  onDismiss: () => Navigator.of(context).pop(),
                  onNegativeButtonPress: () {
                    myPageViewModel.withdraw(reason: ref.watch(_selectedWithdrawalReason), context: context);
                    Navigator.of(context).pop();
                  },
                  onPositiveButtonPress: () => Navigator.of(context).pop()
                )
              )
            )
          ],
        ),
      ),
    );
  }
}

enum WithdrawalReason { none, noCafe, occupancyRate, appUse, design, etc }