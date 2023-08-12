
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/components/buttons/profile_edit_button.dart';
import 'package:cafejari_flutter/ui/components/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileImageEditable extends Container {
  ProfileImageEditable({
    Key? key,
    required double size,
    required String imageUrl,
    required VoidCallback onEditButtonClick,
  }) : super(
    key: key,
    width: size,
    height: size,
    decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColor.grey_300),
    child: Stack(
      children: [
        Center(
          child: CustomCachedNetworkImage(imageUrl: imageUrl, width: size * 0.7, height: size * 0.7),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: ProfileEditButton(buttonSize: 40, onPressed: onEditButtonClick)
        )
      ],
    )
  );
}