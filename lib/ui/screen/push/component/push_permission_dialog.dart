import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/view_model/my_page_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final _isLoading = StateProvider((ref) => false);
final _isOccupancyEnabled = StateProvider((ref) => false);

class PushPermissionDialog extends ConsumerStatefulWidget {
  const PushPermissionDialog({super.key});

  @override
  PushPermissionDialogState createState() => PushPermissionDialogState();
}


class PushPermissionDialogState extends ConsumerState<PushPermissionDialog> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      ref.watch(_isLoading.notifier).update((state) => false);
      ref.watch(_isOccupancyEnabled.notifier).update((state) => ref.watch(globalViewModelProvider).user.isOccupancyPushEnabled);
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalState globalState = ref.watch(globalViewModelProvider);
    final MyPageViewModel myPageViewModel = ref.watch(myPageViewModelProvider.notifier);

    return Dialog(
        backgroundColor: AppColor.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
            decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const VerticalSpacer(10),
                const Text(
                  "알림 수신 설정",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const VerticalSpacer(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "카페 활동 알림",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "ex) 아직 스타벅스 OO점에 계신가요?",
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColor.grey_500
                          ),
                        ),
                      ],
                    ),
                    CupertinoSwitch(
                      value: ref.watch(_isOccupancyEnabled),
                      thumbColor: AppColor.white,
                      activeColor: AppColor.secondary,
                      onChanged: (value) {
                        ref.watch(_isOccupancyEnabled.notifier).update((state) => value);
                        HapticFeedback.lightImpact();
                      }
                    )
                  ],
                ),
                const VerticalSpacer(30),
                ActionButtonPrimary(
                  buttonWidth: double.infinity,
                  buttonHeight: 48,
                  title: "변경사항 저장",
                  isLoading: ref.watch(_isLoading),
                  onPressed: () async {
                    ref.watch(_isLoading.notifier).update((state) => true);
                    await myPageViewModel.updateOccupancyPushEnabled(
                      context: context, 
                      enabled: ref.watch(_isOccupancyEnabled)
                    );
                    ref.watch(_isLoading.notifier).update((state) => false);
                    if(context.mounted) Navigator.of(context).pop();
                  },
                )
              ],
            )
        )
    );
  }
}
