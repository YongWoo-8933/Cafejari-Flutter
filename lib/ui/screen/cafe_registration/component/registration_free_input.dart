import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/padding.dart';
import 'package:cafejari_flutter/ui/app_config/size.dart';
import 'package:cafejari_flutter/ui/screen/cafe_registration/component/registration_wallsocket/registration_wallsocket_slider.dart';
import 'package:cafejari_flutter/ui/state/request_state/request_state.dart';
import 'package:cafejari_flutter/ui/viewmodel/request_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/core/di.dart';

class RegistrationFreeInput extends ConsumerWidget {
  const RegistrationFreeInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final RequestState requestState = ref.watch(requestViewModelProvider);

    return Container(
      padding: AppPadding.padding_horizon_30,
      decoration: BoxDecoration(
        color: AppColor.white,
      ),
      child: TextFormField(
        obscureText: false,
        decoration: InputDecoration(
          labelText: "FreeInput",
          hintText: "입력해주세요",
          border: OutlineInputBorder(),
        ),
      )
    );
  }
}


