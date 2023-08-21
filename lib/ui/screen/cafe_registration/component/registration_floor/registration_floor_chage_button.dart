import 'package:cafejari_flutter/core/extension/double.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/state/request_state/request_state.dart';
import 'package:cafejari_flutter/ui/viewmodel/request_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';

class RegistrationFloorChageButton extends ConsumerWidget {
  final bool plus;
  final bool maxOrMin;
  const RegistrationFloorChageButton({
    Key? key,
    required this.plus,
    required this.maxOrMin
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final RequestState requestState = ref.watch(requestViewModelProvider);
    final RequestViewModel requestViewModel = ref.watch(requestViewModelProvider.notifier);

    final index = maxOrMin ? requestState.maxFloorIndex : requestState.minFloorIndex;

    return SizedBox(
      width: 30,
      height: 30,
      child: ElevatedButton(
        onPressed: plus
            ? maxOrMin ? () => requestViewModel.plusMaxFloor(index == 8 ? 8 : index + 1) : () => requestViewModel.plusMinFloor(index >= requestState.maxFloorIndex ? index : index + 1)
            : maxOrMin ? () => requestViewModel.minusMaxFloor(index <= requestState.minFloorIndex ? index : index - 1) :  () => requestViewModel.minusMinFloor(index == 0 ? 0 : index - 1),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: AppColor.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Icon(
          plus ? CupertinoIcons.plus : CupertinoIcons.minus,
          color: AppColor.white,
          size: 20,
        ),
      ),
    );
  }
}
