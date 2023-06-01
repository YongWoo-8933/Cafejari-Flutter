import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Text("붩은"),
          onPressed: () => ref.read(mapViewModelProvider.notifier).refreshCafeInfos(),
        ),
        body: const Center(child: Text("여기는 스플래쉬 화면")));
  }
}
