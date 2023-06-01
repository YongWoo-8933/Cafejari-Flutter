import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileViewModelProvider);
    final profileViewModel = ref.watch(profileViewModelProvider.notifier);
    return Scaffold(
        floatingActionButton: Column(
          children: [
            FloatingActionButton(
              child: const Text("카운터"),
              onPressed: () => profileViewModel.add,
            )
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: Text("여기는 프로필 화면, 카운터1 ${profileState.counter}"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: Text("여기는 프로필 화면, 카운터1 ${profileState.counter}"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: Text("여기는 프로필 화면, 카운터1 ${profileState.counter}"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: Text("여기는 프로필 화면, 카운터1 ${profileState.counter}"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: Text("여기는 프로필 화면, 카운터1 ${profileState.counter}"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: Text("여기는 프로필 화면, 카운터1 ${profileState.counter}"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: Text("여기는 프로필 화면, 카운터1 ${profileState.counter}"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: Text("여기는 프로필 화면, 카운터1 ${profileState.counter}"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: Text("여기는 프로필 화면, 카운터1 ${profileState.counter}"),
            ),

          ]
        )
    );
  }
}
