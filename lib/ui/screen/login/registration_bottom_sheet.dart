
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/components/cached_network_image.dart';
import 'package:cafejari_flutter/ui/state/login_state/login_state.dart';
import 'package:cafejari_flutter/ui/view_model/login_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class RegistrationBottomSheet extends ConsumerWidget {
  const RegistrationBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final LoginState loginState = ref.watch(loginViewModelProvider);
    final LoginViewModel loginViewModel = ref.watch(loginViewModelProvider.notifier);

    return GridView.builder(
      padding: AppPadding.padding_20,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 120,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1
      ),
      itemCount: loginState.profileImages.length,
      itemBuilder: (BuildContext context, int index) {
        final ({int profileImageId, String imageUrl}) currentProfileImage = loginState.profileImages[index];
        final bool isSelected = loginState.selectedProfileImage.profileImageId == currentProfileImage.profileImageId;
        return ElevatedButton(
          onPressed: () {
            loginViewModel.selectProfileImages(index);
            loginState.bottomSheetController.close();
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: isSelected? AppColor.grey_100 : AppColor.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              side: BorderSide(
                color: isSelected? AppColor.primary : AppColor.transparent, // 테두리 색을 지정합니다.
                width: 2, // 테두리 두께를 설정합니다.
              )
          ),
          child: CustomCachedNetworkImage(
            imageUrl: loginState.profileImages[index].imageUrl
          ),
        );
      },
    );
  }
}