import 'package:cafejari_flutter/ui/components/profile_image_editable.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/state/my_page_state/my_page_state.dart';
import 'package:cafejari_flutter/ui/view_model/my_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';

class MyPageImage extends ConsumerWidget {
  const MyPageImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyPageState myPageState = ref.watch(myPageViewModelProvider);
    final GlobalState globalState = ref.watch(globalViewModelProvider);
    final MyPageViewModel myPageViewModel = ref.watch(myPageViewModelProvider.notifier);

    final deviceSize = MediaQuery.of(context).size;

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Container(
        width: deviceSize.width * 0.3,
        height: deviceSize.width * 0.3,
        decoration: BoxDecoration(
           shape: BoxShape.circle, // 이미지를 원 모양으로 조절
        ),
          child:  ProfileImageEditable(
            size: 160,
            imageUrl: globalState.user.imageUrl,
            onEditButtonClick: () {}
          ),
        ),
      ],
    );
  }
}