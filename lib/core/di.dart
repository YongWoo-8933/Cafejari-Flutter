import 'dart:async';

import 'package:cafejari_flutter/data/repository/cafe_log_repository.dart';
import 'package:cafejari_flutter/data/repository/challenge_repository.dart';
import 'package:cafejari_flutter/data/repository/leaderboard_repository.dart';
import 'package:cafejari_flutter/data/repository/request_repository.dart';
import 'package:cafejari_flutter/data/repository/shop_repository.dart';
import 'package:cafejari_flutter/data/repository/token_repository.dart';
import 'package:cafejari_flutter/data/repository/user_repository.dart';
import 'package:cafejari_flutter/domain/use_case/cafe_log_use_case.dart';
import 'package:cafejari_flutter/domain/use_case/challenge_use_case.dart';
import 'package:cafejari_flutter/domain/use_case/leaderboard_use_case.dart';
import 'package:cafejari_flutter/domain/use_case/push_use_case.dart';
import 'package:cafejari_flutter/domain/use_case/shop_use_case.dart';
import 'package:cafejari_flutter/domain/use_case/user_use_case.dart';
import 'package:cafejari_flutter/ui/state/challenge_state/challenge_state.dart';
import 'package:cafejari_flutter/ui/state/leaderboard_state/leaderboard_state.dart';
import 'package:cafejari_flutter/ui/state/login_state/login_state.dart';
import 'package:cafejari_flutter/ui/state/my_page_state/my_page_state.dart';
import 'package:cafejari_flutter/ui/state/request_state/request_state.dart';
import 'package:cafejari_flutter/ui/view_model/challenge_view_model.dart';
import 'package:cafejari_flutter/ui/view_model/leaderboard_view_model.dart';
import 'package:cafejari_flutter/ui/view_model/login_view_model.dart';
import 'package:cafejari_flutter/ui/view_model/my_page_view_model.dart';
import 'package:cafejari_flutter/ui/view_model/request_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/data/remote/api_service.dart';
import 'package:cafejari_flutter/data/repository/cafe_repository.dart';
import 'package:cafejari_flutter/data/repository/push_repository.dart';
import 'package:cafejari_flutter/domain/use_case/cafe_use_case.dart';
import 'package:cafejari_flutter/domain/use_case/token_use_case.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/state/map_state/map_state.dart';
import 'package:cafejari_flutter/ui/state/shop_state/shop_state.dart';
import 'package:cafejari_flutter/ui/view_model/global_view_model.dart';
import 'package:cafejari_flutter/ui/view_model/map_view_model.dart';
import 'package:cafejari_flutter/ui/view_model/shop_view_model.dart';

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

final challengeRepositoryProvider = Provider<ChallengeRepository>((ref) {
  APIService apiService = ref.watch(apiServiceProvider);
  return ChallengeRepositoryImpl(apiService);
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

final challengeUseCaseProvider = Provider<ChallengeUseCase>((ref) {
  TokenRepository tokenRepository = ref.watch(tokenRepositoryProvider);
  ChallengeRepository challengeRepository = ref.watch(challengeRepositoryProvider);
  return ChallengeUseCaseImpl(tokenRepository: tokenRepository, challengeRepository: challengeRepository);
});


// view model --------------------------------------------------------------------------------------
final globalViewModelProvider = StateNotifierProvider<GlobalViewModel, GlobalState>((ref) {
  final TokenUseCase tokenUseCase = ref.watch(tokenUseCaseProvider);
  return GlobalViewModel(tokenUseCase, null, null);
});

final mapViewModelProvider = StateNotifierProvider<MapViewModel, MapState>((ref) {
  final viewModel = ref.watch(globalViewModelProvider.notifier);
  final CafeUseCase mapUseCase = ref.watch(cafeUseCaseProvider);
  return MapViewModel(mapUseCase: mapUseCase, globalViewModel: viewModel);
});

final myPageViewModelProvider = StateNotifierProvider<MyPageViewModel, MyPageState>((ref) {
  final viewModel = ref.watch(globalViewModelProvider.notifier);
  final UserUseCase userUseCase = ref.watch(userUseCaseProvider);
  return MyPageViewModel(userUseCase: userUseCase, globalViewModel: viewModel);
});

final leaderboardViewModelProvider = StateNotifierProvider<LeaderboardViewModel, LeaderboardState>((ref) {
  final viewModel = ref.watch(globalViewModelProvider.notifier);
  final LeaderboardUseCase leaderboardUseCase = ref.watch(leaderboardUseCaseProvider);
  return LeaderboardViewModel(leaderboardUseCase: leaderboardUseCase, globalViewModel: viewModel);
});

final shopViewModelProvider = StateNotifierProvider<ShopViewModel, ShopState>((ref) {
  final viewModel = ref.watch(globalViewModelProvider.notifier);
  final ShopUseCase shopUseCase = ref.watch(shopUseCaseProvider);
  return ShopViewModel(shopUseCase: shopUseCase, globalViewModel: viewModel);
});

final loginViewModelProvider = StateNotifierProvider<LoginViewModel, LoginState>((ref) {
  final viewModel = ref.watch(globalViewModelProvider.notifier);
  final UserUseCase userUseCase = ref.watch(userUseCaseProvider);
  return LoginViewModel(userUseCase: userUseCase, globalViewModel: viewModel);
});

final challengeViewModelProvider = StateNotifierProvider<ChallengeViewModel, ChallengeState>((ref) {
  final viewModel = ref.watch(globalViewModelProvider.notifier);
  final ChallengeUseCase challengeUseCase = ref.watch(challengeUseCaseProvider);
  final UserUseCase userUseCase = ref.watch(userUseCaseProvider);
  return ChallengeViewModel(challengeUseCase: challengeUseCase, userUseCase: userUseCase, globalViewModel: viewModel);
});

final requestViewModelProvider = StateNotifierProvider<RequestViewModel, RequestState>((ref) {
  return RequestViewModel();
});


// ui ----------------------------------------------------------------------------------------------
final bottomNavBarHeightProvider = Provider<double>((ref) => 65.0);
final bottomNavBarCornerRadiusProvider = Provider<double>((ref) => 20.0);
