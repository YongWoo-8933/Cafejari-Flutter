import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/core/extension/int.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/components/buttons/edit_apply_button.dart';
import 'package:cafejari_flutter/ui/state/cafe_info_modification_state/cafe_info_modification_state.dart';
import 'package:cafejari_flutter/ui/view_model/cafe_info_modification_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class CafeRestroomPart extends ConsumerWidget {
  final double width;

  const CafeRestroomPart({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CafeInfoModificationState state = ref.watch(cafeInfoModificationViewModelProvider);
    final CafeInfoModificationViewModel viewModel = ref.watch(cafeInfoModificationViewModelProvider.notifier);

    return Column(
      children: [
        ...state.restroomInfos.map((restroomInfo) {
          final int index = state.restroomInfos.indexWhere((e) => e.floor == restroomInfo.floor);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${restroomInfo.floor.toFloor()}층:  ${restroomInfo.text}",
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              const VerticalSpacer(4),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _RestroomButton(
                      isSelected: restroomInfo.text == "남/여 화장실",
                      text: "남/여",
                      onClick: () => viewModel.updateRestroomInfo(index: index, text: "남/여 화장실")
                    ),
                    const HorizontalSpacer(4),
                    _RestroomButton(
                      isSelected: restroomInfo.text == "남자 화장실",
                      text: "남자",
                      onClick: () => viewModel.updateRestroomInfo(index: index, text: "남자 화장실")
                    ),
                    const HorizontalSpacer(4),
                    _RestroomButton(
                      isSelected: restroomInfo.text == "여자 화장실",
                      text: "여자",
                      onClick: () => viewModel.updateRestroomInfo(index: index, text: "여자 화장실")
                    ),
                    const HorizontalSpacer(4),
                    _RestroomButton(
                      isSelected: restroomInfo.text == "외부 화장실",
                      text: "외부",
                      onClick: () => viewModel.updateRestroomInfo(index: index, text: "외부 화장실")
                    ),
                    const HorizontalSpacer(4),
                    _RestroomButton(
                      isSelected: restroomInfo.text == "없음",
                      text: "없음",
                      onClick: () => viewModel.updateRestroomInfo(index: index, text: "없음")
                    )
                  ],
                ),
              ),
              const VerticalSpacer(20)
            ],
          );
        }),
        const VerticalSpacer(40),
        EditApplyButton(
          isApplied: state.isRestroomEdited,
          width: width,
          onPress: () => viewModel.setIsRestroomEdited(!state.isRestroomEdited)
        )
      ],
    );
  }
}

class _RestroomButton extends StatelessWidget {
  final bool isSelected;
  final String text;
  final VoidCallback onClick;
  const _RestroomButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onClick
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? AppColor.secondary : AppColor.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(
              color: isSelected ? AppColor.transparent : AppColor.grey_300,
              width: 1,
            )
          )
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? AppColor.white : AppColor.grey_700,
        )
      ),
    );
  }
}



