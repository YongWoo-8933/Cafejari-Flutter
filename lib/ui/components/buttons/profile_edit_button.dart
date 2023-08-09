import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:flutter/material.dart';

class ProfileEditButton extends StatelessWidget {
  final double buttonSize;
  final VoidCallback onPressed;

  const ProfileEditButton({
    super.key,
    required this.buttonSize,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonSize,
      height: buttonSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColor.secondary,
          width: 1.0
        )
      ),
      child: SizedBox(
          width: buttonSize,
          height: buttonSize,
          child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(buttonSize / 2),
            ),
            elevation: 1.0,
            padding: AppPadding.padding_0
          ),
          child: Icon(
            Icons.edit,
            size: buttonSize / 2,
            color: AppColor.secondary,
          ),
        ),
      ),
    );
  }
}
