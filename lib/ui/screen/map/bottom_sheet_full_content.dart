
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/screen/map/component/bottom_sheet_cafe_vip.dart';
import 'package:cafejari_flutter/ui/screen/map/component/bottom_sheet_cati.dart';
import 'package:cafejari_flutter/ui/screen/map/component/bottom_sheet_main_info.dart';
import 'package:cafejari_flutter/ui/screen/map/component/bottom_sheet_more_info.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';
import 'package:cafejari_flutter/ui/view_model/map_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class BottomSheetFullContent extends ConsumerWidget {
  final ScrollController scrollController;

  const BottomSheetFullContent({Key? key, required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapState mapState = ref.watch(mapViewModelProvider);
    final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);
    final Size deviceSize = MediaQuery.of(context).size;

    return Container(
      color: AppColor.white,
      height: deviceSize.height,
      child: ListView.builder(
        controller: scrollController,
        itemCount: 5,
        padding: AppPadding.padding_0,
        itemBuilder: (_, index) {
          switch(index) {
            case 0: return const BottomSheetMainInfo();
            case 1: return const VerticalSpacer(30);
            case 2: return const BottomSheetCATI();
            case 3: return const BottomSheetCafeVIP();
            default: return const BottomSheetMoreInfo();
          }
        },
      ),
    );
  }
}