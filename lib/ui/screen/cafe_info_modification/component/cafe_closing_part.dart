import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/state/cafe_info_modification_state/cafe_info_modification_state.dart';
import 'package:cafejari_flutter/ui/view_model/cafe_info_modification_view_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class CafeClosingPart extends ConsumerWidget {
  const CafeClosingPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CafeInfoModificationState state = ref.watch(cafeInfoModificationViewModelProvider);
    final CafeInfoModificationViewModel viewModel = ref.watch(cafeInfoModificationViewModelProvider.notifier);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        ElevatedButton(
          onPressed: () {
            HapticFeedback.lightImpact();
            viewModel.setCafeClosed(false);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: state.isCafeClosed ? AppColor.white : AppColor.secondary,
            fixedSize: const Size(140, 42),
            elevation: 0,
            side: BorderSide(
              color: state.isCafeClosed ? AppColor.grey_200 : AppColor.transparent,
              width: 1,
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("🙆  ", style: TextStyle(fontSize: 18)),
              Text(
                  "정상 영업중",
                  style: TextStyle(
                    color: state.isCafeClosed ? AppColor.grey_700 : AppColor.white,
                  )
              ),
            ],
          ),
        ),
        const HorizontalSpacer(8),
        ElevatedButton(
          onPressed: () {
            HapticFeedback.lightImpact();
            viewModel.setCafeClosed(true);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: state.isCafeClosed ? AppColor.secondary : AppColor.white,
              fixedSize: const Size(140, 42),
              elevation: 0,
              side: BorderSide(
                color: state.isCafeClosed ? AppColor.transparent : AppColor.grey_200,
                width: 1,
              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("🙅  ", style: TextStyle(fontSize: 18)),
              Text(
                "폐업함",
                style: TextStyle(
                  color: state.isCafeClosed ? AppColor.white : AppColor.grey_700,
                )
              ),
            ],
          ),
        )
      ],
    );
  }
}