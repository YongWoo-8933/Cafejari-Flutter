import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/core/extension/int.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/state/request_state/request_state.dart';
import 'package:cafejari_flutter/ui/view_model/request_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum CafeRegistrationFloorPickerType { max, min }

class CafeRegistrationFloorPicker extends ConsumerWidget {
  final int maximumFloorLimit, minimumFloorLimit;
  final CafeRegistrationFloorPickerType type;

  const CafeRegistrationFloorPicker({
    Key? key,
    required this.maximumFloorLimit,
    required this.minimumFloorLimit,
    required this.type
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final RequestViewModel requestViewModel = ref.watch(requestViewModelProvider.notifier);
    final RequestState requestState = ref.watch(requestViewModelProvider);
    List<({int floor, Widget widget})> pickerItems = [];
    switch(type) {
      case CafeRegistrationFloorPickerType.min:
        for(int i = minimumFloorLimit; i <= requestState.selectedMaxFloor; i++) {
          if(i != 0) {
            pickerItems.add((floor: i, widget: Center(child: Text("${i.toFloor()} 층"))));
          }
        }
      case CafeRegistrationFloorPickerType.max:
        for(int i = requestState.selectedMinFloor; i <= maximumFloorLimit; i++) {
          if(i != 0) {
            pickerItems.add((floor: i, widget: Center(child: Text("${i.toFloor()} 층"))));
          }
        }
    }

    return CupertinoAlertDialog(
      content: Container(
        padding: AppPadding.padding_10,
        child: Column(
          children: [
            SizedBox(
              height: 180,
              child: CupertinoPicker(
                magnification: 1.6,
                squeeze: 1.2,
                useMagnifier: true,
                itemExtent: 36,
                scrollController: FixedExtentScrollController(initialItem: 0),
                onSelectedItemChanged: (index) {
                  HapticFeedback.lightImpact();
                  switch(type) {
                    case CafeRegistrationFloorPickerType.max:
                      requestViewModel.selectMaxFloor(pickerItems[index].floor);
                    case CafeRegistrationFloorPickerType.min:
                      requestViewModel.selectMinFloor(pickerItems[index].floor);
                  }
                },
                children: [...pickerItems.map((e) => e.widget).toList()],
              ),
            ),
          ],
        ),
      )
    );
  }
}