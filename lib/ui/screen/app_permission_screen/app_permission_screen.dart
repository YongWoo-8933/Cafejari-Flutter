import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/custom_snack_bar.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';
import 'package:cafejari_flutter/ui/view_model/global_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

class AppPermissionScreen extends ConsumerWidget {
  const AppPermissionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double padding = 30;
    final double deviceWidth = MediaQuery.of(context).size.width;
    final GlobalViewModel globalViewModel = ref.watch(globalViewModelProvider.notifier);

    return Scaffold(
      backgroundColor: AppColor.white,
        appBar: AppBar(
            leading: const HorizontalSpacer(1),
            backgroundColor: AppColor.white,
            elevation: 0
        ),
        body: SingleChildScrollView(
          child: Container(
            color: AppColor.white,
            padding: const EdgeInsets.all(padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                    child: Text(
                      "앱 사용권한 확인",
                      style: TextStyle(
                          color: AppColor.secondary,
                          fontSize: 20,
                          fontWeight: FontWeight.w700
                      ),
                    )
                ),
                const VerticalSpacer(60),
                const Text(
                  "강력 추천",
                  style: TextSize.textSize_bold_16,
                ),
                const VerticalSpacer(5),
                const Text("필수는 아니지만, 허용하지 않으면 앱 사용에 큰 불편함을 느낄 수 있어요!"),
                const VerticalSpacer(20),
                const Divider(height: 1, thickness: 1, color: AppColor.grey_200),
                iconRow(iconData: CupertinoIcons.map, text: "내 위치 정보"),
                const Divider(height: 1, thickness: 1, color: AppColor.grey_200),
                iconRow(iconData: CupertinoIcons.bell, text: "알림 (마케팅 알림이 아니에요)"),
                const Divider(height: 1, thickness: 1, color: AppColor.grey_200),
                const VerticalSpacer(40),
                const Text(
                  "선택",
                  style: TextSize.textSize_bold_16,
                ),
                const VerticalSpacer(20),
                const Divider(height: 1, thickness: 1, color: AppColor.grey_200),
                iconRow(iconData: CupertinoIcons.camera, text: "저장소 접근 권한"),
                const Divider(height: 1, thickness: 1, color: AppColor.grey_200),
                const VerticalSpacer(60),
                ActionButtonPrimary(
                  buttonWidth: deviceWidth - padding * 2,
                  buttonHeight: 48,
                  title: "확인",
                  onPressed: () async {
                    await [
                      Permission.location,
                      Permission.notification,
                      Permission.storage
                    ].request();
                    if(context.mounted) await globalViewModel.locationTrackingStart(context: context);
                    Future.delayed(const Duration(milliseconds: 50), () {
                      GoRouter.of(context).goNamed(ScreenRoute.root);
                      globalViewModel.showSnackBar(content: "권한 설정됨", type: SnackBarType.complete);
                    });
                  },
                )
              ],
            ),
          ),
        )
    );
  }

  Widget iconRow({
    required IconData iconData,
    required String text
  }) {
    return SizedBox(
      height: 48,
      child: Row(
        children: [
          Icon(
            iconData,
            size: 18,
            color: AppColor.primary,
          ),
          const HorizontalSpacer(10),
          Text(text)
        ],
      ),
    );
  }
}
