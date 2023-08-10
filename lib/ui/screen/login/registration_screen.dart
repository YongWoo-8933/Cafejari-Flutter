
import 'package:cafejari_flutter/core/di.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/components/top_app_bar.dart';
import 'package:cafejari_flutter/ui/screen/login/registration_agreement_part.dart';
import 'package:cafejari_flutter/ui/screen/login/registration_profile_part.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

// screen이 ConsumerStatefulWidget을 상속받게함
class RegistrationScreen extends ConsumerStatefulWidget {
  const RegistrationScreen({Key? key}): super(key: key);

  @override
  RegistrationScreenState createState() => RegistrationScreenState();
}

// screenstate를 구현하고 initstate나 build등의 로직은 여기에 작성
class RegistrationScreenState extends ConsumerState<RegistrationScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      ref.watch(loginViewModelProvider.notifier).autoGenerateNickname();
      print("한번만 뜨는지 확인할 것");
    });
  }

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginViewModelProvider);
    final globalState = ref.watch(globalViewModelProvider);
    final loginViewModel = ref.watch(loginViewModelProvider.notifier);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: BackButtonAppBar(
            backGroundColor: AppColor.white,
            onBack: () => GoRouter.of(context).pop()
        ),
        body: SlidingUpPanel(
          controller: loginState.bottomSheetController,
          minHeight: 0,
          maxHeight: MediaQuery.of(context).size.height * 0.9,
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
          panelBuilder: (ScrollController sc) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 80,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1
              ),
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: AppColor.crowdedGreen,
                  child: Text("$index"),
                );
              },
            );
          },
        )
      ),
    );
  }
}
