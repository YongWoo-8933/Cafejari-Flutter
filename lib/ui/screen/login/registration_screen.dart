
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/components/profile_image_frame.dart';
import 'package:cafejari_flutter/ui/components/top_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegistrationScreen extends ConsumerWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: BackButtonAppBar(
        backGroundColor: AppColor.white,
        onBack: () => GoRouter.of(context).pop()
      ),
      body: Column(
        children: [
          ProfileImageFrame(
              size: 160,
              imageUrl: "https://cafejariimage.co.kr/user/profile/기본_프로필사진_7309711.png",
              onEditButtonClick: () {}
          )
        ],
      ),
    );
  }
}
