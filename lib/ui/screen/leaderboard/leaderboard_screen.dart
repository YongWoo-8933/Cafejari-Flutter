import 'dart:io';

import 'package:cafejari_flutter/cafejari_app.dart';
import 'package:cafejari_flutter/core/flutter_local_notification.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_view/photo_view.dart';

class LeaderboardScreen extends ConsumerWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    bool darkMode = ref.watch(darkModeProvider);
    setDark(newValue) {
      ref.watch(darkModeProvider.notifier).update((state) => newValue);
    }

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Text("벑은"),
          onPressed: () => FlutterLocalNotification.showNotification(title: "test", body: "zz"),
        ),
        body:Center(
            child: Platform.isIOS
                ? CupertinoSwitch(
              value: darkMode,
              activeColor: AppColor.brown_300,
              onChanged: setDark,
            )
                : Switch(value: darkMode, onChanged: setDark)));
  }
}
