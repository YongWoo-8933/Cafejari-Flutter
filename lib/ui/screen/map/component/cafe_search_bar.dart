import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/app_shadow.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';
import 'package:cafejari_flutter/ui/view_model/map_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class CafeSearchBar extends ConsumerWidget {
  final double width, height;

  const CafeSearchBar({Key? key, required this.width, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapState mapState = ref.watch(mapViewModelProvider);
    final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(height / 2),
              boxShadow: AppShadow.box
          ),
          child: TextFormField(
            enabled: mapState.isSearchPageVisible,
            autofocus: true,
            controller: mapState.searchQueryController,
            keyboardType: TextInputType.text,
            cursorColor: AppColor.primary,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600
            ),
            textAlignVertical: TextAlignVertical.center,
            onChanged: (value) {
              value.isEmpty ? mapViewModel.emptySearchPredictions() : null;
              value.length > 1 ? mapViewModel.searchCafe() : null;
            },
            enableSuggestions: true,
            textInputAction: TextInputAction.search,
            onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
            decoration: InputDecoration(
              hintText: "카페명 검색",
              hintStyle: const TextStyle(
              color: AppColor.grey_600,
              fontWeight: FontWeight.w400,
              fontSize: 14
              ),
              filled: true,
              fillColor: AppColor.white,
              prefixIcon: const Icon(CupertinoIcons.search, size: 24),
              prefixIconColor: AppColor.primary,
              suffixIcon: IconButton(
                onPressed: () {
                  mapState.searchQueryController.text = "";
                  mapViewModel.emptySearchPredictions();
                },
                icon: mapState.isSearchPageVisible ?
                const Icon(CupertinoIcons.xmark_circle_fill, color: AppColor.grey_300, size: 24) :
                Image.asset("asset/image/icon_filter.png", width: 24),
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
        ),
        Visibility(
          visible: !mapState.isSearchPageVisible,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  mapViewModel.openSearchPage();
                  mapViewModel.closeBottomSheetPreview();
                },
                child: Container(
                  width: width - 48,
                  height: height,
                  color: AppColor.transparent,
                ),
              ),
              GestureDetector(
                onTap: () => print("필터부분 클릭"),
                child: Container(
                  width: 48,
                  height: height,
                  color: AppColor.transparent,
                ),
              ),
            ],
          )
        )
      ],
    );
  }
}