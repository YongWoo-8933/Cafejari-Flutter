import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/nickname_editable.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/state/my_page_state/my_page_state.dart';
import 'package:cafejari_flutter/ui/view_model/my_page_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

final _isLoading = StateProvider((ref) => false);


class NicknameEditorDialog extends ConsumerStatefulWidget {
  const NicknameEditorDialog({super.key});

  @override
  NicknameEditorDialogState createState() => NicknameEditorDialogState();
}


class NicknameEditorDialogState extends ConsumerState<NicknameEditorDialog> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      ref.watch(myPageViewModelProvider).nicknameController.text = ref.watch(globalViewModelProvider).user.nickname;
    });
  }

  @override
  Widget build(BuildContext context) {
    final MyPageState myPageState = ref.watch(myPageViewModelProvider);
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
            NicknameEditable(
              textEditingController: myPageState.nicknameController,
              isError: myPageState.nicknameErrorMessage.isNotEmpty,
              errorMessage: myPageState.nicknameErrorMessage,
              onTextChange: () async => await myPageViewModel.validateNickname(),
              onRefreshButtonClick: () async {
                await myPageViewModel.autoGenerateNickname();
                FocusManager.instance.primaryFocus?.unfocus();
              }
            ),
            const VerticalSpacer(20),
            ActionButtonPrimary(
              buttonWidth: double.infinity,
              buttonHeight: 48,
              title: "닉네임 변경",
              isLoading: ref.watch(_isLoading),
              onPressed: myPageState.nicknameErrorMessage.isEmpty &&
                myPageState.nicknameController.text != globalState.user.nickname &&
                myPageState.nicknameController.text.isNotEmpty ? () async {
                ref.watch(_isLoading.notifier).update((state) => true);
                await myPageViewModel.updateNickname(context: context);
                ref.watch(_isLoading.notifier).update((state) => false);
                if(context.mounted) Navigator.pop(context);
              } : null,
            )
          ],
        )
      )
    );
  }
}