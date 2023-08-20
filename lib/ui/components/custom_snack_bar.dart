import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/app_shadow.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum SnackBarType { complete, error }

class CustomSnackBar extends ConsumerWidget {
  final bool isVisible, isExpanded;
  final SnackBarType type;
  final String content;

  const CustomSnackBar({
    Key? key,
    required this.isVisible,
    required this.isExpanded,
    required this.type,
    required this.content
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      width: isVisible ? (type == SnackBarType.complete ? 150 : 180) : 0,
      height: isVisible ? (type == SnackBarType.complete ? 150 : 180) : 0,
      alignment: Alignment.center,
      padding: AppPadding.padding_20,
      decoration: BoxDecoration(
        color: AppColor.black,
        borderRadius: BorderRadius.circular(20),
        boxShadow: AppShadow.box
      ),
      child: Visibility(
        visible: isExpanded,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              type == SnackBarType.complete ? CupertinoIcons.checkmark_alt : CupertinoIcons.exclamationmark,
              color: AppColor.white,
              size: type == SnackBarType.complete ? 48 : 36
            ),
            const VerticalSpacer(10),
            Text(
              content,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColor.white,
                fontSize: type == SnackBarType.complete ? 20 : 16,
                fontWeight: FontWeight.w700
              )
            )
          ],
        ),
      ),
    );
  }
}

