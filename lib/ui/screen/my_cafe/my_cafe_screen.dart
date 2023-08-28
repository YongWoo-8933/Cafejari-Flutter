import 'dart:typed_data';

import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/components/back_button_app_bar.dart';
import 'package:cafejari_flutter/ui/screen/my_cafe/component/cafe_ref_part.dart';
import 'package:cafejari_flutter/ui/screen/my_cafe/component/my_cafe_part.dart';
import 'package:cafejari_flutter/ui/screen/my_cafe/component/my_cati_part.dart';
import 'package:cafejari_flutter/ui/state/my_cafe_state/my_cafe_state.dart';
import 'package:cafejari_flutter/ui/view_model/my_cafe_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';
import 'package:go_router/go_router.dart';

class MyCafeScreen extends ConsumerStatefulWidget {
  const MyCafeScreen({super.key});

  @override
  MyCafeScreenState createState() => MyCafeScreenState();
}

class MyCafeScreenState extends ConsumerState<MyCafeScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      final viewModel = ref.watch(myCafeViewModelProvider.notifier);
      await viewModel.refreshUser();
      await viewModel.setFavoriteCafe();
    });
  }

  @override
  Widget build(BuildContext context) {
    final MyCafeState myCafeState = ref.watch(myCafeViewModelProvider);
    final MyCafeViewModel myCafeViewModel = ref.watch(myCafeViewModelProvider.notifier);

    return Scaffold(
      appBar: BackButtonAppBar(
        backButtonText: "내 카페",
        backGroundColor: AppColor.white,
        onBack: () => {GoRouter.of(context).pop()},
      ),
      backgroundColor: AppColor.white,
      body: const SingleChildScrollView(
        child: Column(
          children: [
            MyCafePart(),
            MyCATIPart(),
            SizedBox(height: 50),
            CafeRefPart(),
          ],
        ),
      ),
    );
  }
}
