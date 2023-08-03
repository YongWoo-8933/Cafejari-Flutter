import 'package:cafejari_flutter/data/repository/cafe_log_repository.dart';
import 'package:cafejari_flutter/data/repository/leaderboard_repository.dart';
import 'package:cafejari_flutter/data/repository/request_repository.dart';
import 'package:cafejari_flutter/data/repository/shop_repository.dart';
import 'package:cafejari_flutter/data/repository/token_repository.dart';
import 'package:cafejari_flutter/data/repository/user_repository.dart';
import 'package:cafejari_flutter/domain/use_case/cafe_log_use_case.dart';
import 'package:cafejari_flutter/domain/use_case/leaderboard_use_case.dart';
import 'package:cafejari_flutter/domain/use_case/push_use_case.dart';
import 'package:cafejari_flutter/domain/use_case/shop_use_case.dart';
import 'package:cafejari_flutter/domain/use_case/user_use_case.dart';
import 'package:cafejari_flutter/ui/state/leader_state/leader_state.dart';
import 'package:cafejari_flutter/ui/viewmodel/leader_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/data/remote/api_service.dart';
import 'package:cafejari_flutter/data/repository/cafe_repository.dart';
import 'package:cafejari_flutter/data/repository/push_repository.dart';
import 'package:cafejari_flutter/domain/use_case/cafe_use_case.dart';
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


// repository --------------------------------------------------------------------------------------
final tokenRepositoryProvider = Provider<TokenRepository>((ref) {
  APIService apiService = ref.watch(apiServiceProvider);
  return TokenRepositoryImpl(apiService);
});

final cafeRepositoryProvider = Provider<CafeRepository>((ref) {
  APIService apiService = ref.watch(apiServiceProvider);
  return CafeRepositoryImpl(apiService);
});

final cafeLogRepositoryProvider = Provider<CafeLogRepository>((ref) {
  APIService apiService = ref.watch(apiServiceProvider);
  return CafeLogRepositoryImpl(apiService);
});

final userRepositoryProvider = Provider<UserRepository>((ref) {
  APIService apiService = ref.watch(apiServiceProvider);
  return UserRepositoryImpl(apiService);
});

final leaderboardRepositoryProvider = Provider<LeaderboardRepository>((ref) {
  APIService apiService = ref.watch(apiServiceProvider);
  return LeaderboardRepositoryImpl(apiService);
});

final pushRepositoryProvider = Provider<PushRepository>((ref) {
  APIService apiService = ref.watch(apiServiceProvider);
  return PushRepositoryImpl(apiService);
});

final requestRepositoryProvider = Provider<RequestRepository>((ref) {
  APIService apiService = ref.watch(apiServiceProvider);
  return RequestRepositoryImpl(apiService);
});

final shopRepositoryProvider = Provider<ShopRepository>((ref) {
  APIService apiService = ref.watch(apiServiceProvider);
  return ShopRepositoryImpl(apiService);
});


// use_case ----------------------------------------------------------------------------------------
final tokenUseCaseProvider = Provider<TokenUseCase>((ref) {
  TokenRepository tokenRepository = ref.watch(tokenRepositoryProvider);
  return TokenUseCaseImpl(tokenRepository);
});

final cafeUseCaseProvider = Provider<CafeUseCase>((ref) {
  TokenRepository tokenRepository = ref.watch(tokenRepositoryProvider);
  CafeRepository cafeRepository = ref.watch(cafeRepositoryProvider);
  RequestRepository requestRepository = ref.watch(requestRepositoryProvider);
  return CafeUseCaseImpl(
      tokenRepository: tokenRepository,
      cafeRepository: cafeRepository,
      requestRepository: requestRepository);
});

final userUseCaseProvider = Provider<UserUseCase>((ref) {
  TokenRepository tokenRepository = ref.watch(tokenRepositoryProvider);
  UserRepository userRepository = ref.watch(userRepositoryProvider);
  return UserUseCaseImpl(tokenRepository: tokenRepository, userRepository: userRepository);
});

final leaderboardUseCaseProvider = Provider<LeaderboardUseCase>((ref) {
  TokenRepository tokenRepository = ref.watch(tokenRepositoryProvider);
  LeaderboardRepository leaderboardRepository = ref.watch(leaderboardRepositoryProvider);
  return LeaderboardUseCaseImpl(
      tokenRepository: tokenRepository, leaderboardRepository: leaderboardRepository);
});

final cafeLogUseCaseProvider = Provider<CafeLogUseCase>((ref) {
  TokenRepository tokenRepository = ref.watch(tokenRepositoryProvider);
  CafeLogRepository cafeLogRepository = ref.watch(cafeLogRepositoryProvider);
  return CafeLogUseCaseImpl(tokenRepository: tokenRepository, cafeLogRepository: cafeLogRepository);
});

final pushUseCaseProvider = Provider<PushUseCase>((ref) {
  TokenRepository tokenRepository = ref.watch(tokenRepositoryProvider);
  PushRepository pushRepository = ref.watch(pushRepositoryProvider);
  return PushUseCaseImpl(tokenRepository: tokenRepository, pushRepository: pushRepository);
});

final shopUseCaseProvider = Provider<ShopUseCase>((ref) {
  TokenRepository tokenRepository = ref.watch(tokenRepositoryProvider);
  ShopRepository shopRepository = ref.watch(shopRepositoryProvider);
  return ShopUseCaseImpl(tokenRepository: tokenRepository, shopRepository: shopRepository);
});


// view model --------------------------------------------------------------------------------------
final globalViewModelProvider = StateNotifierProvider<GlobalViewModel, GlobalState>((ref) {
  final TokenUseCase tokenUseCase = ref.watch(tokenUseCaseProvider);
  return GlobalViewModel(tokenUseCase);
});

final mapViewModelProvider = StateNotifierProvider<MapViewModel, MapState>((ref) {
  final viewModel = ref.watch(globalViewModelProvider.notifier);
  final CafeUseCase mapUseCase = ref.watch(cafeUseCaseProvider);
  return MapViewModel(mapUseCase: mapUseCase, globalViewModel: viewModel);
});

final profileViewModelProvider = StateNotifierProvider<ProfileViewModel, ProfileState>((ref) {
  final viewModel = ref.watch(globalViewModelProvider.notifier);
  final UserUseCase userUseCase = ref.watch(userUseCaseProvider);
  return ProfileViewModel(userUseCase: userUseCase, globalViewModel: viewModel);
});

final leaderViewModelProvider = StateNotifierProvider<LeaderViewModel, LeaderState>((ref) {
  final viewModel = ref.watch(globalViewModelProvider.notifier);
  final LeaderboardUseCase leaderUseCase = ref.watch(leaderboardUseCaseProvider);
  return LeaderViewModel(leaderUseCase: leaderUseCase, globalViewModel: viewModel);
});

final shopViewModelProvider = StateNotifierProvider<ShopViewModel, ShopState>((ref) {
  final viewModel = ref.watch(globalViewModelProvider.notifier);
  return ShopViewModel(globalViewModel: viewModel);
});
