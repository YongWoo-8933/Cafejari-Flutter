import 'package:cafejari_flutter/core/flutter_local_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_view/photo_view.dart';

class LeaderboardScreen extends ConsumerWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Text("벑은"),
          onPressed: () => FlutterLocalNotification.showNotification(title: "test", body: "zz"),
        ),
        body: Center(
            child: SizedBox(
                width: 200,
                height: 300,
                child: PhotoView(
                  imageProvider: const AssetImage("asset/image/cafe_icon.png"),
                  loadingBuilder: (context, progress) => const SizedBox(
                    width: 20.0,
                    height: 20.0,
                    child: CircularProgressIndicator(),
                  ),
                  maxScale: 5.0,
                  minScale: 1.0,
                ))));
  }
}
