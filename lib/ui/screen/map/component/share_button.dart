import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/core/extension/double.dart';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/duration.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/components/custom_snack_bar.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';
import 'package:cafejari_flutter/ui/view_model/map_view_model.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk_share/kakao_flutter_sdk_share.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

final _isLoading = StateProvider<bool>((ref) => false);

class ShareButton extends ConsumerWidget {
  final double? buttonSize;

  const ShareButton({super.key, this.buttonSize});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapState mapState = ref.watch(mapViewModelProvider);
    final MapViewModel mapViewModel = ref.watch(mapViewModelProvider.notifier);
    return Container(
      width: buttonSize ?? 48,
      height: buttonSize ?? 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: ElevatedButton(
        onPressed: () async {
          ref.watch(_isLoading.notifier).update((state) => true);
          const urlPrefix = "https://cafejari.page.link";
          final DynamicLinkParameters parameters = DynamicLinkParameters(
            link: Uri.parse("$urlPrefix/map/${mapState.selectedCafe.id}"),
            uriPrefix: urlPrefix,
            androidParameters: const AndroidParameters(packageName: "kr.co.cafejari.cafejari_flutter")
          );
          final Uri dynamicLink = await FirebaseDynamicLinks.instance.buildLink(parameters);
          final template = LocationTemplate(
            address: mapState.selectedCafe.address,
            buttons: [Button(title: "앱에서 보기", link: Link(mobileWebUrl: dynamicLink))],
            content: Content(
              title: mapState.selectedCafe.name,
              description: '현재 혼잡도: ${
                mapState.selectedCafe.recentUpdatedOccupancyRate.isNull ? "정보 없음" :
                mapState.selectedCafe.recentUpdatedOccupancyRate!.toOccupancyLevel().stringValue
              }',
              imageUrl: Uri.parse(
                mapState.selectedCafe.imageUrls.isNotEmpty ? mapState.selectedCafe.imageUrls.first :
                mapState.randomCafeImageUrl ?? "https://cafejariimage.co.kr/cafe/cafe_image/랜덤이미지용카페_cafe_picture_5.jpg"
              ),
              link: Link(mobileWebUrl: dynamicLink),
            ),
          );
          if (await ShareClient.instance.isKakaoTalkSharingAvailable()) {
            try {
              Uri uri = await ShareClient.instance.shareDefault(template: template);
              await ShareClient.instance.launchKakaoTalk(uri);
            } catch (_) {
              mapViewModel.globalViewModel.showSnackBar(
                content: "취소", type: SnackBarType.error
              );
            }
          } else {
            try {
              Uri shareUrl = await WebSharerClient.instance.makeDefaultUrl(template: template);
              await launchBrowserTab(shareUrl, popupOpen: true);
            } catch (error) {
              mapViewModel.globalViewModel.showSnackBar(
                  content: "취소됨", type: SnackBarType.error
              );
            }
          }
          ref.watch(_isLoading.notifier).update((state) => false);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primary,
          padding: AppPadding.padding_0,
          shape: const CircleBorder(),
        ),
        child: AnimatedCrossFade(
          firstChild: const Icon(
            CupertinoIcons.paperplane,
            color: AppColor.white,
            size: 16,
          ),
          secondChild: LoadingAnimationWidget.hexagonDots(color: AppColor.white, size: 16),
          crossFadeState: ref.watch(_isLoading) ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: AppDuration.animationDefault
        ),
      ),
    );
  }
}
