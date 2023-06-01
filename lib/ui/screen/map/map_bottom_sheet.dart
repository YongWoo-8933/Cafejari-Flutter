import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';

class MapBottomSheet extends ConsumerWidget {
  const MapBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapState mapState = ref.watch(mapViewModelProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Text("1"),
        Text("2"),
        Text("3"),
        Text("4"),
        Text("5"),
        Text("6"),
        Text("7"),
        Text("8"),
        Text("9"),
        Text("10"),
      ],
    );
  }
}