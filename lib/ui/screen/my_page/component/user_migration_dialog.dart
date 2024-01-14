import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/buttons/x_button.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/state/my_page_state/my_page_state.dart';
import 'package:cafejari_flutter/ui/view_model/my_page_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

final _isButtonEnabled = StateProvider((ref) => false);
final _isLoading = StateProvider((ref) => false);


class UserMigrationDialog extends ConsumerWidget {
  const UserMigrationDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyPageState myPageState = ref.watch(myPageViewModelProvider);
    final MyPageViewModel myPageViewModel = ref.watch(myPageViewModelProvider.notifier);
    final Size deviceSize = MediaQuery.of(context).size;
    return Dialog(
      backgroundColor: AppColor.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: XButton(
                buttonSize: 28,
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            const Text("사용자 정보 이전", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const VerticalSpacer(6),
            const Text(
              "이전버전 가입에 사용한 번호를 적어주세요. 확인 후 이전해드려요!",
              style: TextStyle(color: AppColor.grey_800)
            ),
            const VerticalSpacer(30),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)
              ),
              child: TextFormField(
                controller: myPageState.userMigrationPhoneNumberController,
                keyboardType: TextInputType.number,
                cursorColor: AppColor.primary,
                maxLines: 1,
                onChanged: (value) => ref.watch(_isButtonEnabled.notifier).update((state) => value.length == 11),
                textInputAction: TextInputAction.done,
                onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColor.white,
                  hintText: "01012345678",
                  hintStyle: const TextStyle(
                    color: AppColor.grey_600,
                    fontWeight: FontWeight.w400,
                    fontSize: 14
                  ),
                  contentPadding: AppPadding.padding_20,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColor.grey_400),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColor.grey_400),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColor.grey_400),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColor.grey_400),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const VerticalSpacer(20),
            ActionButtonPrimary(
              buttonWidth: deviceSize.width - 20 * 2 - 30 * 2,
              buttonHeight: 48,
              title: "제출",
              isLoading: ref.watch(_isLoading),
              onPressed: ref.watch(_isButtonEnabled) ? () {
                ref.watch(_isLoading.notifier).update((state) => true);
                myPageViewModel.userMigrate(context: context);
                ref.watch(_isLoading.notifier).update((state) => false);
                Navigator.pop(context);
              } : null
            )
          ],
        )
      )
    );
  }
}