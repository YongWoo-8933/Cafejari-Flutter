import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListViewScreen extends ConsumerWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(child: SizedBox(
      width: double.infinity,
      height: 200,
      child: ElevatedButton(
        onPressed: () {

        },
        child: const Text('다른 페이지로 이동'),
      ),
    ));
  }
}
