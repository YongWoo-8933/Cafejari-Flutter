
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/components/buttons/action_button_primary.dart';
import 'package:cafejari_flutter/ui/components/cati_blocks.dart';
import 'package:cafejari_flutter/ui/screen/my_cafe/component/book_marked_card.dart';
import 'package:cafejari_flutter/ui/screen/my_cafe/component/cafe_ref_part.dart';
import 'package:cafejari_flutter/ui/screen/my_cafe/component/my_cafe_part.dart';
import 'package:cafejari_flutter/ui/screen/my_cafe/component/my_cati_part.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';
import 'package:cafejari_flutter/ui/state/my_page_state/my_page_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:go_router/go_router.dart';

class MyCafeScreen extends ConsumerWidget {
  const MyCafeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MapState mapState = ref.watch(mapViewModelProvider);
    final MyPageState myPageState = ref.watch(myPageViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('내 카페', style: TextSize.textSize_16),
        leading: IconButton(
              onPressed: () {context.go('/map');} ,
              icon: const Icon(CupertinoIcons.left_chevron, color: AppColor.black,)),
        backgroundColor: AppColor.white,
        elevation: 0,

      ),
      backgroundColor: AppColor.white,
      body: const Column(
        children: [
          MyCafePart(),
          MyCATIPart(),
          CafeRefPart()
        ],
      ),

    );
  }
}

