import 'package:cafejari_flutter/ui/screen/shop/sample_page1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/shop_state/shop_state.dart';
import 'package:cafejari_flutter/ui/viewmodel/shop_view_model.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class SamplePage4 extends ConsumerWidget {
  const SamplePage4 ({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ShopViewModel shopViewModel = ref.read(shopViewModelProvider.notifier);
    final ShopState shopState = ref.watch(shopViewModelProvider);
   // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SamplePage1(), settings: RouteSettings(name: "/")));
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.popUntil(
            context,
            ModalRoute.withName("SamplePage2"),
          );
        },
        child: const Text('다른 페이지로 이동4444'),
      ),
    );
  }
}
