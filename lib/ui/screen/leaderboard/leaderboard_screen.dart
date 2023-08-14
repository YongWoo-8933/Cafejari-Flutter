import 'dart:io';

import 'package:cafejari_flutter/cafejari_app.dart';
import 'package:cafejari_flutter/core/flutter_local_notification.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




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
      body: Column(
        children: [
          Center(
              child: Platform.isIOS
                  ? CupertinoSwitch(
                value: darkMode,
                activeColor: AppColor.brown_300,
                onChanged: setDark,
              )
                  : Switch(value: darkMode, onChanged: setDark)),
          ActionButtonPrimary(
              buttonWidth: 100,
              buttonHeight: 42,
              title: "붵은",
              onPressed: () async {

              },
          )
        ],
      )
    );
  }
}
