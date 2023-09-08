
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:cafejari_flutter/domain/use_case/user_use_case.dart';
import 'package:cafejari_flutter/ui/state/my_cafe_state/my_cafe_state.dart';
import 'package:cafejari_flutter/ui/util/n_location.dart';
import 'package:cafejari_flutter/ui/view_model/map_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/ui/view_model/global_view_model.dart';

class MyCafeViewModel extends StateNotifier<MyCafeState> {
  final GlobalViewModel globalViewModel;
  final MapViewModel mapViewModel;

  MyCafeViewModel({required UserUseCase userUseCase, required this.globalViewModel, required this.mapViewModel})
      : super(MyCafeState.empty());

}
