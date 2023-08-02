import 'package:cafejari_flutter/ui/screen/shop/sample_page3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/shop_state/shop_state.dart';
import 'package:cafejari_flutter/ui/viewmodel/shop_view_model.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class SamplePage2 extends ConsumerWidget {
  const SamplePage2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ShopViewModel shopViewModel = ref.read(shopViewModelProvider.notifier);
    final ShopState shopState = ref.watch(shopViewModelProvider);

    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              settings: RouteSettings(name: "SamplePage2"),
              builder: (context) => SamplePage3(),
            ),
          );
        },
        child: const Text('다른 페이지로 이동22222'),
      ),
    );
  }
}
