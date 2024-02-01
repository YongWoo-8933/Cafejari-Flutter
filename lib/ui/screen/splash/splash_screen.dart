import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';
import 'package:cafejari_flutter/ui/view_model/global_view_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}


class SplashScreenState extends ConsumerState<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () async {
      final GlobalViewModel globalViewModel = ref.watch(globalViewModelProvider.notifier);
      if (await globalViewModel.getIsInstalledFirst()) {
        Future.delayed(const Duration(seconds: 1), () {
          if (context.mounted) GoRouter.of(context).goNamed(ScreenRoute.appPermission);
        });
      } else {
        await globalViewModel.init();
        if (context.mounted) await globalViewModel.locationTrackingStart(context: context);
        if (context.mounted) GoRouter.of(context).goNamed(ScreenRoute.root);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "asset/image/splash_image.png",
      fit: BoxFit.cover,
    );
  }
}
