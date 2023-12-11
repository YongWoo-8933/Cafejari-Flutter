import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/screen/login/component/refresh_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class NicknameEditable extends ConsumerWidget {
  final TextEditingController textEditingController;
  final bool isError;
  final String errorMessage;
  final VoidCallback onTextChange;
  final VoidCallback onRefreshButtonClick;

  const NicknameEditable({
    Key? key,
    required this.textEditingController,
    required this.isError,
    required this.errorMessage,
    required this.onTextChange,
    required this.onRefreshButtonClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const HorizontalSpacer(40),
            SizedBox(
              width: 160,
              child: TextFormField(
                controller: textEditingController,
                keyboardType: TextInputType.text,
                cursorColor: AppColor.primary,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                maxLength: 10,
                onChanged: (value) => onTextChange(),
                decoration: InputDecoration(
                  counter: null,
                  counterText: "",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: isError ? AppColor.error : AppColor.grey_200,
                        width: 1),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: isError ? AppColor.error : AppColor.grey_100,
                        width: 1),
                  ),
                ),
              ),
            ),
            RefreshButton(buttonSize: 40, onPressed: onRefreshButtonClick)
          ],
        ),
        const VerticalSpacer(10),
        AnimatedOpacity(
          opacity: isError ? 1 : 0,
          duration: const Duration(milliseconds: 500),
          child: Text(
            errorMessage,
            style: const TextStyle(fontSize: 11, color: AppColor.error),
          ),
        ),
      ],
    );
  }
}