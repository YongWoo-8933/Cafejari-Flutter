import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';

class CafeRefPart extends ConsumerWidget {
  const CafeRefPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Container(
      child: Column(
        children: [
          Text("이런 카페는 어때요")
        ],
      ),
    );
  }
}