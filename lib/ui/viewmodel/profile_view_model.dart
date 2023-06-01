
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/ui/state/profile_state/profile_state.dart';
import 'package:cafejari_flutter/ui/viewmodel/global_view_model.dart';

class ProfileViewModel extends StateNotifier<ProfileState> {
  final GlobalViewModel globalViewModel;

  ProfileViewModel({required this.globalViewModel})
      : super(ProfileState.empty());

  get add => state = state.copyWith(counter: state.counter + 1);
}
