import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:flutter/cupertino.dart';


class EditApplyButton extends StatelessWidget {
  final bool isApplied;
  final double width;
  final VoidCallback onPress;

  const EditApplyButton({
    super.key,
    required this.isApplied,
    required this.width,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isApplied ? AppColor.secondary : AppColor.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: AppColor.secondary,
            width: 1,
          )
        ),
        width: width,
        height: 48,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isApplied ? CupertinoIcons.check_mark_circled_solid : CupertinoIcons.check_mark_circled,
              color: isApplied ? AppColor.white : AppColor.secondary,
              size: 18,
            ),
            const HorizontalSpacer(6),
            Text(
              isApplied ? "적용 됨" : "적용 하기",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: isApplied ? AppColor.white : AppColor.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}