import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';
import 'package:cafejari_flutter/ui/util/web_view_route.dart';
import 'package:cafejari_flutter/ui/view_model/global_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class SearchButton extends ConsumerWidget {
  final double? buttonSize;

  const SearchButton({super.key, this.buttonSize});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapState mapState = ref.watch(mapViewModelProvider);
    final GlobalViewModel globalViewModel = ref.watch(globalViewModelProvider.notifier);

    return Container(
      width: buttonSize ?? 48,
      height: buttonSize ?? 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: ElevatedButton(
        onPressed: () async {
          globalViewModel.navigateToWebView(
            route: WebViewRoute.custom(title: "상세정보", url: "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=${mapState.selectedCafe.name}"),
            context: context
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.white,
          padding: AppPadding.padding_0,
          shape: const CircleBorder(),
        ),
        child: const Icon(
          Icons.search,
          color: AppColor.primary,
          size: 16,
        )
      ),
    );
  }
}