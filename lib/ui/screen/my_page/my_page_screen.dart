
import 'package:cafejari_flutter/ui/screen/my_page/component/my_page_image.dart';
import 'package:cafejari_flutter/ui/screen/my_page/component/my_page_point.dart';
import 'package:cafejari_flutter/ui/screen/my_page/component/my_page_shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MyPageScreen extends ConsumerWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myPageState = ref.watch(myPageViewModelProvider);
    final myPageViewModel = ref.watch(myPageViewModelProvider.notifier);
    String _url = "https://cafejari.software/information/tos/";
    myPageViewModel.refreshUser();


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
            MyPageImage(),
            MyPagePoint(),
            MyPageShop(),
          ]
        )
    );
  }
}
