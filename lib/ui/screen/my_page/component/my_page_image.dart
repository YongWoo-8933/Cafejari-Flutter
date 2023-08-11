import 'package:cafejari_flutter/ui/components/profile_image_editable.dart';
import 'package:cafejari_flutter/ui/state/my_page_state/my_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';

class MyPageImage extends ConsumerWidget {
  const MyPageImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyPageState myPageState = ref.watch(myPageViewModelProvider);
    final loginState = ref.watch(loginViewModelProvider);

    final diviceSize = MediaQuery.of(context).size;

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Container(
        width: diviceSize.width * 0.3,
        height: diviceSize.width * 0.3,
        decoration: BoxDecoration(
           shape: BoxShape.circle, // 이미지를 원 모양으로 조절
        ),
          child:  ProfileImageEditable(
              size: 160,
              imageUrl: "https://cafejariimage.co.kr/user/profile/기본_프로필사진_7309711.png",
              onEditButtonClick: () => loginState.bottomSheetController.open()
          ),
        ),
      ],
    );
  }
}