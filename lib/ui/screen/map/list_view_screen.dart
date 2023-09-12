
import 'package:cafejari_flutter/ui/components/square_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/shop_state/shop_state.dart';
import 'package:cafejari_flutter/ui/view_model/shop_view_model.dart';

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