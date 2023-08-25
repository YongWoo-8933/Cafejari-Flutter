

import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/state/request_state/request_state.dart';
import 'package:cafejari_flutter/ui/view_model/request_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class CafeRegistrationFreePart extends ConsumerWidget {
  final double width;

  const CafeRegistrationFreePart({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final RequestState requestState = ref.watch(requestViewModelProvider);
    final RequestViewModel requestViewModel = ref.watch(requestViewModelProvider.notifier);

    return Container(
      width: width,
      height: 360,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20)
      ),
      child: TextFormField(
        controller: requestState.freeQueryController,
        keyboardType: TextInputType.text,
        cursorColor: AppColor.primary,
        maxLines: 10,
        onChanged: (value) {},
        textInputAction: TextInputAction.done,
        onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColor.white,
          hintText: "여기에 적어주세요",
          hintStyle: const TextStyle(
            color: AppColor.grey_600,
            fontWeight: FontWeight.w400,
            fontSize: 14
          ),
          contentPadding: AppPadding.padding_20,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.grey_400),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.grey_400),
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.grey_400),
            borderRadius: BorderRadius.circular(20),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.grey_400),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}