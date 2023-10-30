import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/components/custom_snack_bar.dart';
import 'package:cafejari_flutter/ui/screen/map/component/occupancy_update_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class OccupancyUpdateButton extends ConsumerWidget {
  final double? width;
  final double? height;
  final double? textSize;

  const OccupancyUpdateButton({super.key, this.width, this.height, this.textSize});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapState = ref.watch(mapViewModelProvider);
    final mapViewModel = ref.watch(mapViewModelProvider.notifier);
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () {
          if(!mapState.selectedCafe.isOpened) {
            mapViewModel.globalViewModel.showSnackBar(content: "영업시간이 아니에요", type: SnackBarType.error);
          } else {
            showDialog(
              context: context,
              builder: (_) => const OccupancyUpdateDialog()
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primary,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(height.isNotNull ? height! / 2 : 30),
          ),
        ),
        child: Text(
          "혼잡도 등록",
          style: TextStyle(
            fontSize: textSize,
            color: AppColor.white
          ),
        ),
      ),
    );
  }
}
