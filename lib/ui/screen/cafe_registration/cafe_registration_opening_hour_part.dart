import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/screen/cafe_registration/component/edit_apply_button.dart';
import 'package:cafejari_flutter/ui/screen/cafe_registration/component/show_opening_hour_dialog.dart';
import 'package:cafejari_flutter/ui/state/request_state/request_state.dart';
import 'package:cafejari_flutter/ui/view_model/request_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';

class CafeRegistrationOpeningHourPart extends ConsumerWidget {
  final double width;

  const CafeRegistrationOpeningHourPart({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final RequestState requestState = ref.watch(requestViewModelProvider);
    final RequestViewModel requestViewModel = ref.watch(requestViewModelProvider.notifier);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const VerticalSpacer(10),
            _TimeEditButton(
                text: "모든 영업시간 수정",
                onPress: () {
                  requestViewModel.pickDay(["월", "화", "수", "목", "금", "토", "일"]);
                  showOpeningHourDialog(context);
                }
            ),
            const HorizontalSpacer(10),
            _TimeEditButton(
                text: "월~금 수정",
                onPress: () {
                  requestViewModel.pickDay(["월", "화", "수", "목", "금"]);
                  showOpeningHourDialog(context);
                }
            ),
            const HorizontalSpacer(10),
            _TimeEditButton(
                text: "토~일 수정",
                onPress: () {
                  requestViewModel.pickDay(["토", "일"]);
                  showOpeningHourDialog(context);
                }
            ),
          ],
        ),
        const VerticalSpacer(20),
        Container(
          width: width,
          decoration: BoxDecoration(color: AppColor.grey_100, borderRadius: BorderRadius.circular(24)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 30, left: 30, right: 10),
              child: Column(
                children: requestState.openingInfos.map((e) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 48,
                        child: Text(e.fullText),
                      ),
                      Row(
                        children: [
                          Text(e.getOpeningHourText()),
                          IconButton(
                            onPressed: () {
                              requestViewModel.pickDay([e.shortText]);
                              showOpeningHourDialog(context);
                            },
                            icon: const Icon(Icons.edit, color: AppColor.secondary, size: 20)
                          ),
                        ]
                      )
                    ],
                  );
                }).toList()
              )
            ),
          ),
        ),
        const VerticalSpacer(40),
        EditApplyButton(
          isApplied: requestState.isOpeningHourEdited,
          width: width,
          onPress: () => requestViewModel.setIsOpeningHourEdited(!requestState.isOpeningHourEdited)
        )
      ],
    );
  }
}

class _TimeEditButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;

  const _TimeEditButton({
    super.key,
    required this.text,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        alignment: Alignment.center,
        padding: AppPadding.padding_horizon_15,
        decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: AppColor.secondary,
              width: 1,
            )
        ),
        height: 48,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: AppColor.secondary,
          ),
        ),
      ),
    );
  }
}
