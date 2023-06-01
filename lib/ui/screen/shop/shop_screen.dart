import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/screen/leaderboard/leaderboard_screen.dart';
import 'package:cafejari_flutter/ui/screen/map/map_screen.dart';
import 'package:cafejari_flutter/ui/screen/profile/profile_screen.dart';
import 'package:cafejari_flutter/ui/state/shop_state/shop_state.dart';
import 'package:cafejari_flutter/ui/viewmodel/shop_view_model.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ShopScreen extends ConsumerWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ShopViewModel shopViewModel = ref.read(shopViewModelProvider.notifier);
    final ShopState shopState = ref.watch(shopViewModelProvider);

    return Center(child: SizedBox(
        width: double.infinity,
        height: 200,
        child: PhotoViewGallery.builder(
          scrollPhysics: const BouncingScrollPhysics(),
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: AssetImage("asset/image/cafe_icon_$index.png"),
              initialScale: 1.0,
              maxScale: 5.0,
              minScale: 1.0,
              heroAttributes: PhotoViewHeroAttributes(tag: index, transitionOnUserGestures: true)
            );
          },
          itemCount: 5,
          loadingBuilder: (context, progress) => const SizedBox(
            width: 20.0,
            height: 20.0,
            child: CircularProgressIndicator(),
          ),
        )));
  }
}
