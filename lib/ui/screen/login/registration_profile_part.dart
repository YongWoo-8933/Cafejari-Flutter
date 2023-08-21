
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/components/profile_image_editable.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/screen/login/component/refresh_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const HorizontalSpacer(40),
              SizedBox(
                width: 160,
                child: TextFormField(
                  controller: loginState.nicknameController,
                  keyboardType: TextInputType.text,
                  cursorColor: AppColor.primary,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                  ),
                  textAlign: TextAlign.center,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  maxLength: 10,
                  onChanged: (value) async => await loginViewModel.validateNickname(),
                  decoration: InputDecoration(
                    counter: null,
                    counterText: "",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: loginState.nicknameErrorMessage.isEmpty ? AppColor.grey_200 : AppColor.error,
                          width: 1),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: loginState.nicknameErrorMessage.isEmpty ? AppColor.grey_100 : AppColor.error,
                          width: 1),
                    ),
                  ),
                ),
              ),
              RefreshButton(buttonSize: 40, onPressed: () async {
                await loginViewModel.autoGenerateNickname();
                FocusManager.instance.primaryFocus?.unfocus();
              })
            ],
          ),
          const VerticalSpacer(10),
          AnimatedOpacity(
            opacity: loginState.nicknameErrorMessage.isEmpty ? 0 : 1,
            duration: const Duration(milliseconds: 500),
            child: Text(
              loginState.nicknameErrorMessage,
              style: const TextStyle(
                  fontSize: 11,
                  color: AppColor.error
              ),
            ),
          ),
          const VerticalSpacer(20),
        ],
      ),
    );
  }
}