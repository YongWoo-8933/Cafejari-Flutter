
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/components/top_app_bar.dart';
import 'package:cafejari_flutter/ui/screen/login/registration_agreement_part.dart';
import 'package:cafejari_flutter/ui/screen/login/registration_bottom_sheet.dart';
import 'package:cafejari_flutter/ui/screen/login/registration_profile_part.dart';
import 'package:cafejari_flutter/ui/view_model/login_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class RegistrationScreen extends ConsumerStatefulWidget {
  const RegistrationScreen({Key? key}): super(key: key);

  @override
  RegistrationScreenState createState() => RegistrationScreenState();
}

class RegistrationScreenState extends ConsumerState<RegistrationScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      LoginViewModel viewModel = ref.watch(loginViewModelProvider.notifier);
      await viewModel.autoGenerateNickname();
      await viewModel.getDefaultProfileImages();
    });
  }

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginViewModelProvider);

    return WillPopScope(
      onWillPop: () async {
        if(loginState.bottomSheetController.isPanelOpen) {
          loginState.bottomSheetController.close();
          return false;
        } else {
          return true;
        }
      },
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: BackButtonAppBar(
              backGroundColor: AppColor.white,
              onBack: () => GoRouter.of(context).pop()
          ),
          body: SlidingUpPanel(
            controller: loginState.bottomSheetController,
            minHeight: 0,
            maxHeight: MediaQuery.of(context).size.height * 0.8,
            isDraggable: false,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.elliptical(20.0, 20.0),
              topRight: Radius.elliptical(20.0, 20.0)
            ),
            body: ListView(
              children: const [
                ProfilePart(),
                AgreementPart(),
              ],
            ),
            panelBuilder: (ScrollController sc) => const RegistrationBottomSheet()
          )
        ),
      ),
    );
  }
}