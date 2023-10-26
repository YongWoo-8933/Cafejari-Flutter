import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_secondary.dart';
import 'package:cafejari_flutter/ui/components/spacer.dart';
import 'package:cafejari_flutter/ui/util/n_location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _isLocationPartExpanded = StateProvider<bool>((ref) => false);

class BottomSheetFilter extends ConsumerWidget {
  const BottomSheetFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLocationPartExpanded = ref.watch(_isLocationPartExpanded);
    return Container(
      decoration: const BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Theme(
            data: Theme.of(context).copyWith(dividerColor: AppColor.transparent),
            child: ExpansionTile(
                tilePadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                title: const Text(
                  "지역 이동",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14
                  ),
                ),
                trailing: Icon(
                  isLocationPartExpanded ? CupertinoIcons.minus : CupertinoIcons.plus,
                  size: 20, color: AppColor.primary
                ),
                onExpansionChanged: (value) => ref.watch(_isLocationPartExpanded.notifier).update((state) => value),
                children: [
                  Column(
                    children: [
                      const VerticalSpacer(10),
                      SizedBox(
                        height: 300,
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 88,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            childAspectRatio: 2.5
                          ),
                          itemCount: NLocation.locations.length,
                          itemBuilder: (context, index) {
                            final nLocation = NLocation.locations[index];
                            return ActionButtonSecondary(
                              buttonWidth: 88,
                              buttonHeight: 35.2,
                              title: nLocation.name,
                              isClicked: false
                            );
                          },
                        ),
                      ),
                      const VerticalSpacer(10),
                    ],
                  )
                ]
            ),
          )
        ],
      ),
    );
  }
}
