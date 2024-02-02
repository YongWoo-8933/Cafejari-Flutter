import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/components/full_width_banner_ad.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/screen/map/component/bottom_sheet_cafe_vip.dart';
import 'package:cafejari_flutter/ui/screen/map/component/bottom_sheet_cati.dart';
import 'package:cafejari_flutter/ui/screen/map/component/bottom_sheet_main_info.dart';
import 'package:cafejari_flutter/ui/screen/map/component/bottom_sheet_more_info.dart';
import 'package:cafejari_flutter/ui/util/ad_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BottomSheetFullContent extends ConsumerWidget {
  final ScrollController scrollController;

  const BottomSheetFullContent({Key? key, required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size deviceSize = MediaQuery.of(context).size;
    const double sidePadding = 20;

    return Container(
      color: AppColor.white,
      height: deviceSize.height,
      child: ListView.builder(
        controller: scrollController,
        itemCount: 8,
        padding: AppPadding.padding_0,
        itemBuilder: (_, index) {
          switch(index) {
            case 0: return const BottomSheetMainInfo(sidePadding: sidePadding);
            case 1: return const VerticalSpacer(30);
            case 2: return const BottomSheetCATI(sidePadding: sidePadding);
            case 3: return const VerticalSpacer(10);
            case 4: return FullWidthBannerAd(bannerAd: AdManager.instance.bottomFullSheetBannerAd);
            case 5: return const VerticalSpacer(10);
            case 6: return const BottomSheetCafeVIP(sidePadding: sidePadding);
            default: return const BottomSheetMoreInfo(sidePadding: sidePadding);
          }
        },
      ),
    );
  }
}