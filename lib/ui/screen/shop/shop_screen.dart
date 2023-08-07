import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/components/alert_dialog_square.dart';
import 'package:cafejari_flutter/ui/components/snack_bar.dart';
import 'package:cafejari_flutter/ui/screen/login/login_screen.dart';
import 'package:cafejari_flutter/ui/screen/shop/sample_page1.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/shop_state/shop_state.dart';
import 'package:cafejari_flutter/ui/viewmodel/shop_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ShopScreen extends ConsumerWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ShopViewModel shopViewModel = ref.read(shopViewModelProvider.notifier);
    final ShopState shopState = ref.watch(shopViewModelProvider);
    final GlobalState globalState = ref.watch(globalViewModelProvider);


    return Center(child: SizedBox(
        width: double.infinity,
        height: 200,
        child: ElevatedButton(
          onPressed: () {
            // final customSnackBar = CustomSnackBar(
            //   content: Text('커스텀 SnackBar'),
            //   action: SnackBarAction(
            //     label: '닫기',
            //     onPressed: () {},
            //   ),
            //   contentTextStyle: TextStyle(
            //     color: Colors.white,
            //     fontSize: 18.0,
            //   ),
            // );
            //
            // // 커스텀 SnackBar를 보여줍니다.
            // ScaffoldMessenger.of(context).showSnackBar(customSnackBar);
            // showDialog(
            //   context: context,
            //   builder: (BuildContext context) {
            //     return CustomAlertDialog(
            //       title: Text('알림'),
            //       content: Text('다이얼로그 내용'),
            //       actions: [
            //         FloatingActionButton(
            //           child: Text('확인'),
            //           onPressed: () {
            //             Navigator.of(context).pop();
            //           },
            //         ),
            //       ],
            //     );
            //   },
            // );
            GoRouter.of(context).pushNamed(ScreenRoute.splash);
          },
          child: Text("${globalState.deviceSize.width}, ${globalState.deviceSize.height}"),
        ),
    ));
              GoRouter.of(context).goNamed(ScreenRoute.registration);
            },
            child: Text("${globalState.deviceSize.width}, ${globalState.deviceSize.height}"),
          ),
        )
    );
  }
}
