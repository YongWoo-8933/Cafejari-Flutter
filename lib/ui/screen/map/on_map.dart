import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/app_shadow.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/components/custom_snack_bar.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';
import 'package:cafejari_flutter/ui/viewmodel/map_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class OnMap extends ConsumerWidget {
  const OnMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);
    final MapState mapState = ref.watch(mapViewModelProvider);
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const VerticalSpacer(50),
            Container(
              alignment: Alignment.center,
              width: deviceWidth,
              child: Container(
                width: deviceWidth - 40,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  boxShadow: AppShadow.box
                ),
                child: TextFormField(
                  controller: mapState.searchQueryController,
                  keyboardType: TextInputType.text,
                  cursorColor: AppColor.primary,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600
                  ),
                  textAlignVertical: TextAlignVertical.center,
                  onChanged: (value) {},
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
                      onPressed: () {  },
                      icon: Image.asset("asset/image/icon_filter.png", width: 24),
                    ),
                    contentPadding: AppPadding.padding_0,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColor.white),
                      borderRadius: BorderRadius.circular(24.0), // 원하는 border radius 값으로 설정
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColor.white),
                      borderRadius: BorderRadius.circular(24.0), // 원하는 border radius 값으로 설정
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColor.white),
                      borderRadius: BorderRadius.circular(24.0), // 원하는 border radius 값으로 설정
                    ),
                  ),
                ),
              ),
            ),
            const VerticalSpacer(20),
            AnimatedOpacity(
              opacity: mapState.isRefreshButtonVisible ? 1.0 : 0,
              duration: const Duration(milliseconds: 200),
              child: SizedBox(
                height: 36,
                child: FloatingActionButton.extended(
                  elevation: 3,
                  icon: const Icon(size: 18, CupertinoIcons.refresh),
                  onPressed: () => mapViewModel.refreshCafes(context),
                  label: const Text("현 지도에서 검색", style: TextStyle(letterSpacing: 0)),
                  backgroundColor: AppColor.white,
                ),
              ),
            )
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(35),
            child: FloatingActionButton.extended(
              label: const Text("목록보기", style: TextStyle(letterSpacing: 0)),
              icon: const Icon(CupertinoIcons.line_horizontal_3),
              onPressed: () => mapViewModel.globalViewModel.showSnackBar(content: "사용되지않은 기프티콘은 삭제할 수 없습니다. 먼저 사용완료 처리해주세요", type: SnackBarType.error),
              backgroundColor: AppColor.white,
              elevation: 3,
            ),
          ),
        )
      ]
    );
  }
}