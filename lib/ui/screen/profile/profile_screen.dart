import 'package:cafejari_flutter/ui/screen/profile/component/profile_image.dart';
import 'package:cafejari_flutter/ui/screen/profile/component/profile_point.dart';
import 'package:cafejari_flutter/ui/screen/profile/component/profile_shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileViewModelProvider);
    final profileViewModel = ref.watch(profileViewModelProvider.notifier);
    String _url = "https://cafejari.software/information/tos/";
    profileViewModel.refreshUserInfos();


    return Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            Container(
              child: FloatingActionButton(
                child: Text("url"),
                onPressed: () async {
                  await launchUrlString(_url);
                },
              ),
            ),
            ProfileImage(),
            ProfilePoint(),
            ProfileShop(),
          ]
        )
    );
  }
}
