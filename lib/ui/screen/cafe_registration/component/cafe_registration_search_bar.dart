import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/app_shadow.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/state/request_state/request_state.dart';
import 'package:cafejari_flutter/ui/view_model/request_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class CafeRegistrationSearchBar extends ConsumerWidget {
  final double width, height;

  const CafeRegistrationSearchBar({Key? key, required this.width, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final RequestState requestState = ref.watch(requestViewModelProvider);
    final RequestViewModel requestViewModel = ref.watch(requestViewModelProvider.notifier);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height / 2),
          boxShadow: AppShadow.box
      ),
      child: TextFormField(
        enabled: true,
        controller: requestState.searchQueryController,
        keyboardType: TextInputType.text,
        cursorColor: AppColor.primary,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600
        ),
        textAlignVertical: TextAlignVertical.center,
        onChanged: (value) {
          if (value.length > 1) {
            requestViewModel.searchCafe();
          }
        },
        enableSuggestions: true,
        textInputAction: TextInputAction.search,
        onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        decoration: InputDecoration(
          hintText: "추가하려는 카페를 찾아보세요",
          hintStyle: const TextStyle(
            color: AppColor.grey_600,
            fontWeight: FontWeight.w400,
            fontSize: 14
          ),
          filled: true,
          fillColor: AppColor.white,
          prefixIcon: const Icon(CupertinoIcons.search, size: 24),
          prefixIconColor: AppColor.primary,
          suffixIcon: GestureDetector(
            onTap: () {
              requestState.searchQueryController.text = "";
              requestViewModel.clearSearchCafePredictions();
            },
            child: const Icon(CupertinoIcons.xmark_circle_fill, color: AppColor.grey_300, size: 24),
          ),
          contentPadding: AppPadding.padding_0,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.white),
            borderRadius: BorderRadius.circular(height / 2), // 원하는 border radius 값으로 설정
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.white),
            borderRadius: BorderRadius.circular(height / 2), // 원하는 border radius 값으로 설정
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.white),
            borderRadius: BorderRadius.circular(height / 2), // 원하는 border radius 값으로 설정
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.white),
            borderRadius: BorderRadius.circular(height / 2), // 원하는 border radius 값으로 설정
          ),
        ),
      ),
    );
  }
}