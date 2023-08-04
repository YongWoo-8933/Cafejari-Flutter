import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/screen/login/component/login_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: AppColor.grey_300,
      child: Column(
        children: [
          SizedBox(height: 30),
          LoginButton(
            buttonWidth: 230,
            buttonHeight: 40,
            buttonColor: AppColor.kakaoYellow,
            title: Text("카카오 계정으로 시작", style: TextSize.textSize_16),
            icon: Image.asset('asset/image/kakao_icon.png'),
            onPressed: () => {},
          ),
          SizedBox(height: 30),
          LoginButton(
            buttonWidth: 230,
            buttonHeight: 40,
            buttonColor: AppColor.primary,
            title: Text("Apple 계정으로 시작", style: TextSize.textSize_white_16),
            icon: Image.asset('asset/image/apple_icon.png'),
            onPressed: () => {},
          ),
          SizedBox(height: 30),
          LoginButton(
            buttonWidth: 230,
            buttonHeight: 40,
            buttonColor: AppColor.white,
            title: Text("Google 계정으로 시작", style: TextSize.textSize_16),
            icon: Image.asset('asset/image/google_icon.png'),
            onPressed: () => {},
          ),
        ],
      ),
    );
  }
}

