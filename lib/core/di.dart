import 'package:cafejari_flutter/data/repository/leader_repository.dart';
import 'package:cafejari_flutter/data/repository/user_repository.dart';
import 'package:cafejari_flutter/domain/use_case/leader_use_case.dart';
import 'package:cafejari_flutter/domain/use_case/user_use_case.dart';
import 'package:cafejari_flutter/ui/state/leader_state/leader_state.dart';
import 'package:cafejari_flutter/ui/viewmodel/leader_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/data/remote/api_service.dart';
import 'package:cafejari_flutter/data/repository/cafe_repository.dart';
import 'package:cafejari_flutter/data/repository/token_repository.dart';
import 'package:cafejari_flutter/domain/use_case/map_use_case.dart';
import 'package:cafejari_flutter/domain/use_case/token_use_case.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';
import 'package:cafejari_flutter/ui/state/profile_state/profile_state.dart';
import 'package:cafejari_flutter/ui/state/shop_state/shop_state.dart';
import 'package:cafejari_flutter/ui/viewmodel/global_view_model.dart';
import 'package:cafejari_flutter/ui/viewmodel/map_view_model.dart';
import 'package:cafejari_flutter/ui/viewmodel/profile_view_model.dart';
import 'package:cafejari_flutter/ui/viewmodel/shop_view_model.dart';

final apiServiceProvider = Provider<APIService>((ref) {
  return APIService();
});

final tokenRepositoryProvider = Provider<TokenRepository>((ref) {
  APIService apiService = ref.watch(apiServiceProvider);
  return TokenRepositoryImpl(apiService);
});

final cafeRepositoryProvider = Provider<CafeRepository>((ref) {
  APIService apiService = ref.watch(apiServiceProvider);
  return CafeRepositoryImpl(apiService);
});

final userRepositoryProvider = Provider<UserRepository>((ref) {
  APIService apiService = ref.watch(apiServiceProvider);
  return UserRepositoryImpl(apiService);
});

final leaderRepositoryProvider = Provider<LeaderRepository>((ref) {
  APIService apiService = ref.watch(apiServiceProvider);
  return LeaderRepositoryImpl(apiService);
});

final tokenUseCaseProvider = Provider<TokenUseCase>((ref) {
  TokenRepository tokenRepository = ref.watch(tokenRepositoryProvider);
  return TokenUseCaseImpl(tokenRepository);
});

final mapUseCaseProvider = Provider<MapUseCase>((ref) {
  TokenRepository tokenRepository = ref.watch(tokenRepositoryProvider);
  CafeRepository cafeRepository = ref.watch(cafeRepositoryProvider);
  return MapUseCaseImpl(tokenRepository: tokenRepository, cafeRepository: cafeRepository);
});

final userUseCaseProvider = Provider<UserUseCase>((ref) {
  TokenRepository tokenRepository = ref.watch(tokenRepositoryProvider);
  UserRepository userRepository = ref.watch(userRepositoryProvider);
  return UserUseCaseImpl(tokenRepository: tokenRepository, userRepository: userRepository);
});

final leaderUseCaseProvider = Provider<LeaderUseCase>((ref) {
  TokenRepository tokenRepository = ref.watch(tokenRepositoryProvider);
  LeaderRepository leaderRepository = ref.watch(leaderRepositoryProvider);
  return LeaderUseCaseImpl(tokenRepository: tokenRepository, leaderRepository: leaderRepository);
});

final globalViewModelProvider = StateNotifierProvider<GlobalViewModel, GlobalState>((ref) {
  final TokenUseCase tokenUseCase = ref.watch(tokenUseCaseProvider);
  return GlobalViewModel(tokenUseCase);
});

final mapViewModelProvider = StateNotifierProvider<MapViewModel, MapState>((ref) {
  final viewModel = ref.watch(globalViewModelProvider.notifier);
  final MapUseCase mapUseCase = ref.watch(mapUseCaseProvider);
  return MapViewModel(mapUseCase: mapUseCase, globalViewModel: viewModel);
});

final profileViewModelProvider = StateNotifierProvider<ProfileViewModel, ProfileState>((ref) {
  final viewModel = ref.watch(globalViewModelProvider.notifier);
  final UserUseCase userUseCase = ref.watch(userUseCaseProvider);
  return ProfileViewModel(userUseCase: userUseCase, globalViewModel: viewModel);
});

final leaderViewModelProvider = StateNotifierProvider<LeaderViewModel, LeaderState>((ref) {
  final viewModel = ref.watch(globalViewModelProvider.notifier);
  final LeaderUseCase leaderUseCase = ref.watch(leaderUseCaseProvider);
  return LeaderViewModel(leaderUseCase: leaderUseCase, globalViewModel: viewModel);
});

final shopViewModelProvider = StateNotifierProvider<ShopViewModel, ShopState>((ref) {
  final viewModel = ref.watch(globalViewModelProvider.notifier);
  return ShopViewModel(globalViewModel: viewModel);
});
