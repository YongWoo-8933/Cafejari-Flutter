import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/components/nickname_editable.dart';
import 'package:cafejari_flutter/ui/components/profile_image_editable.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePart extends ConsumerWidget {
  const ProfilePart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final loginState = ref.watch(loginViewModelProvider);
    final loginViewModel = ref.watch(loginViewModelProvider.notifier);

    return Container(
      color: AppColor.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfileImageEditable(
            size: 160,
            imageUrl: loginState.selectedProfileImage.imageUrl,
            onEditButtonClick: () => loginState.bottomSheetController.open()
          ),
          const VerticalSpacer(20),
          NicknameEditable(
            textEditingController: loginState.nicknameController,
            isError: loginState.nicknameErrorMessage.isNotEmpty,
            errorMessage: loginState.nicknameErrorMessage,
            onTextChange: () async => await loginViewModel.validateNickname(),
            onRefreshButtonClick: () async {
              await loginViewModel.autoGenerateNickname();
              FocusManager.instance.primaryFocus?.unfocus();
            }
          ),
          const VerticalSpacer(20),
        ],
      ),
    );
  }
}