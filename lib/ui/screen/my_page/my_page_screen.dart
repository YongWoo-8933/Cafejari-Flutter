
import 'package:cafejari_flutter/ui/components/cati_blocks.dart';
import 'package:cafejari_flutter/ui/screen/map/bottom_sheet_page2.dart';
import 'package:cafejari_flutter/ui/screen/map/component/bottom_sheet_cafe_vip.dart';
import 'package:cafejari_flutter/ui/screen/my_cafe/component/book_marked_card.dart';
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
    // myPageViewModel.refreshUser();


    return  Scaffold(
      body: Column(
        children: [
          BookMarkedCard(cafeName: "설빙 신촌점1", cafeAddress: "여기저기 어딘가",),
          BookMarkedCard(cafeName: "설빙 신촌점2", cafeAddress: "여기저기 어딘가",),
        ],
      )
    );
  }
}
