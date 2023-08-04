
import 'package:cafejari_flutter/ui/state/my_page_state/my_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';

class MyPageShop extends ConsumerWidget {
  const MyPageShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyPageState myPageState = ref.watch(myPageViewModelProvider);
    final deviceSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        print('shop tapped!');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.brown[900]!,
            width: 2,
          ),
        ),
        height: deviceSize.height * 0.05,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.shopping_cart),
                SizedBox(width: 8),
                Text("포인트상점으로 가기"),
              ],
            ),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}