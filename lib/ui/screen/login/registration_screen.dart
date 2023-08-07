
import 'package:cafejari_flutter/ui/util/screen_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegistrationScreen extends ConsumerWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        ElevatedButton(
          child: Text("스택확인"),
          onPressed: () { print(GoRouter.of(context).routerDelegate.currentConfiguration.matches); },
        ),
        ElevatedButton(
          onPressed: () => GoRouter.of(context).goNamed(ScreenRoute.root),
          child: Text("샵으로")
        )
      ],
    );
  }
}