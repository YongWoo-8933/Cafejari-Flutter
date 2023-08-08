
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/components/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
    decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColor.grey_100),
    child: Stack(
      children: [
        Center(
          child: CustomCachedNetworkImage(imageUrl: imageUrl, width: size * 0.7, height: size * 0.7),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: SizedBox(
            width: 48,
            height: 48,
            child: ElevatedButton(
              onPressed: onEditButtonClick,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                side: const BorderSide(
                  color: AppColor.secondary,
                  width: 1.0,
                ),
                elevation: 1.0,
                padding: AppPadding.padding_0
              ),
              child: const Icon(
                Icons.edit,
                size: 24,
                color: AppColor.secondary,
              ),
            ),
          ),
        )
      ],
    )
  );
}
