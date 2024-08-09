import 'package:cafejari_flutter/data/repository/app_config_repository.dart';
import 'package:cafejari_flutter/data/repository/challenge_repository.dart';
import 'package:cafejari_flutter/data/repository/leaderboard_repository.dart';
import 'package:cafejari_flutter/data/repository/request_repository.dart';
import 'package:cafejari_flutter/data/repository/shop_repository.dart';
import 'package:cafejari_flutter/data/repository/token_repository.dart';
import 'package:cafejari_flutter/data/repository/user_repository.dart';
import 'package:cafejari_flutter/domain/repository.dart';
import 'package:cafejari_flutter/domain/use_case/app_config_use_case.dart';
import 'package:cafejari_flutter/domain/use_case/challenge_use_case.dart';
import 'package:cafejari_flutter/domain/use_case/leaderboard_use_case.dart';
import 'package:cafejari_flutter/domain/use_case/push_use_case.dart';
import 'package:cafejari_flutter/domain/use_case/shop_use_case.dart';
import 'package:cafejari_flutter/domain/use_case/user_use_case.dart';
import 'package:cafejari_flutter/ui/state/cafe_info_modification_state/cafe_info_modification_state.dart';
import 'package:cafejari_flutter/ui/state/cafe_registration_state/cafe_registration_state.dart';
import 'package:cafejari_flutter/ui/state/challenge_state/challenge_state.dart';
import 'package:cafejari_flutter/ui/state/leaderboard_state/leaderboard_state.dart';
import 'package:cafejari_flutter/ui/state/login_state/login_state.dart';
import 'package:cafejari_flutter/ui/state/my_cafe_state/my_cafe_state.dart';
import 'package:cafejari_flutter/ui/state/my_page_state/my_page_state.dart';
import 'package:cafejari_flutter/ui/state/push_state/push_state.dart';
import 'package:cafejari_flutter/ui/view_model/cafe_info_modification_view_model.dart';
import 'package:cafejari_flutter/ui/state/request_state/request_state.dart';
import 'package:cafejari_flutter/ui/view_model/challenge_view_model.dart';
import 'package:cafejari_flutter/ui/view_model/leaderboard_view_model.dart';
import 'package:cafejari_flutter/ui/view_model/login_view_model.dart';
import 'package:cafejari_flutter/ui/view_model/my_cafe_view_model.dart';
import 'package:cafejari_flutter/ui/view_model/my_page_view_model.dart';
import 'package:cafejari_flutter/ui/view_model/push_view_model.dart';
import 'package:cafejari_flutter/ui/view_model/cafe_registration_view_model.dart';
import 'package:cafejari_flutter/ui/view_model/request_view_model.dart';
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
final appConfigRepositoryProvider = Provider<AppConfigRepository>((ref) {
  APIService apiService = ref.watch(apiServiceProvider);
  return AppConfigRepositoryImpl(apiService);
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
final appConfigUseCaseProvider = Provider<AppConfigUseCase>((ref) {
  AppConfigRepository appConfigRepository = ref.watch(appConfigRepositoryProvider);
  return AppConfigUseCase(appConfigRepository);
});

final tokenUseCaseProvider = Provider<TokenUseCase>((ref) {
  TokenRepository tokenRepository = ref.watch(tokenRepositoryProvider);
  return TokenUseCase(tokenRepository);
});

final cafeUseCaseProvider = Provider<CafeUseCase>((ref) {
  TokenRepository tokenRepository = ref.watch(tokenRepositoryProvider);
  CafeRepository cafeRepository = ref.watch(cafeRepositoryProvider);
  RequestRepository requestRepository = ref.watch(requestRepositoryProvider);
  return CafeUseCase(
      tokenRepository: tokenRepository,
      cafeRepository: cafeRepository,
      requestRepository: requestRepository);
});

final userUseCaseProvider = Provider<UserUseCase>((ref) {
  TokenRepository tokenRepository = ref.watch(tokenRepositoryProvider);
  UserRepository userRepository = ref.watch(userRepositoryProvider);
  RequestRepository requestRepository = ref.watch(requestRepositoryProvider);
  return UserUseCase(tokenRepository: tokenRepository, userRepository: userRepository, requestRepository: requestRepository);
});

final leaderboardUseCaseProvider = Provider<LeaderboardUseCase>((ref) {
  TokenRepository tokenRepository = ref.watch(tokenRepositoryProvider);
  LeaderboardRepository leaderboardRepository = ref.watch(leaderboardRepositoryProvider);
  return LeaderboardUseCase(
      tokenRepository: tokenRepository, leaderboardRepository: leaderboardRepository);
});

final pushUseCaseProvider = Provider<PushUseCase>((ref) {
  TokenRepository tokenRepository = ref.watch(tokenRepositoryProvider);
  PushRepository pushRepository = ref.watch(pushRepositoryProvider);
  return PushUseCase(tokenRepository: tokenRepository, pushRepository: pushRepository);
});

final shopUseCaseProvider = Provider<ShopUseCase>((ref) {
  TokenRepository tokenRepository = ref.watch(tokenRepositoryProvider);
  ShopRepository shopRepository = ref.watch(shopRepositoryProvider);
  return ShopUseCase(tokenRepository: tokenRepository, shopRepository: shopRepository);
});

final challengeUseCaseProvider = Provider<ChallengeUseCase>((ref) {
  TokenRepository tokenRepository = ref.watch(tokenRepositoryProvider);
  ChallengeRepository challengeRepository = ref.watch(challengeRepositoryProvider);
  UserRepository userRepository = ref.watch(userRepositoryProvider);
  return ChallengeUseCase(
    tokenRepository: tokenRepository,
    challengeRepository: challengeRepository,
    userRepository: userRepository
  );
});


// view model --------------------------------------------------------------------------------------
final globalViewModelProvider = StateNotifierProvider<GlobalViewModel, GlobalState>((ref) {
  final TokenUseCase tokenUseCase = ref.watch(tokenUseCaseProvider);
  final UserUseCase userUseCase = ref.watch(userUseCaseProvider);
  final LeaderboardUseCase leaderUseCase = ref.watch(leaderboardUseCaseProvider);
  final ChallengeUseCase challengeUseCase = ref.watch(challengeUseCaseProvider);
  final AppConfigUseCase appConfigUseCase = ref.watch(appConfigUseCaseProvider);
  final CafeUseCase cafeUseCase = ref.watch(cafeUseCaseProvider);
  final PushUseCase pushUseCafe = ref.watch(pushUseCaseProvider);
  return GlobalViewModel(appConfigUseCase, tokenUseCase, userUseCase, cafeUseCase, leaderUseCase, challengeUseCase, pushUseCafe, null, null);
});

final mapViewModelProvider = StateNotifierProvider<MapViewModel, MapState>((ref) {
  final viewModel = ref.watch(globalViewModelProvider.notifier);
  final CafeUseCase cafeUseCase = ref.watch(cafeUseCaseProvider);
  final UserUseCase userUseCase = ref.watch(userUseCaseProvider);
  return MapViewModel(cafeUseCase: cafeUseCase, userUseCase: userUseCase, globalViewModel: viewModel);
});

final myCafeViewModelProvider = StateNotifierProvider<MyCafeViewModel, MyCafeState>((ref) {
  final globalViewModel = ref.watch(globalViewModelProvider.notifier);
  final UserUseCase userUseCase = ref.watch(userUseCaseProvider);
  final CafeUseCase cafeUseCase = ref.watch(cafeUseCaseProvider);
  return MyCafeViewModel(userUseCase: userUseCase, cafeUseCase: cafeUseCase, globalViewModel: globalViewModel);
});

final myPageViewModelProvider = StateNotifierProvider<MyPageViewModel, MyPageState>((ref) {
  final viewModel = ref.watch(globalViewModelProvider.notifier);
  final UserUseCase userUseCase = ref.watch(userUseCaseProvider);
  return MyPageViewModel(userUseCase: userUseCase, globalViewModel: viewModel);
});

final pushViewModelProvider = StateNotifierProvider<PushViewModel, PushState>((ref) {
  final viewModel = ref.watch(globalViewModelProvider.notifier);
  final PushUseCase pushUseCase = ref.watch(pushUseCaseProvider);
  return PushViewModel(pushUseCase: pushUseCase, globalViewModel: viewModel);
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
  return ChallengeViewModel(challengeUseCase: challengeUseCase, globalViewModel: viewModel);
});

final cafeRegistrationViewModelProvider = StateNotifierProvider<CafeRegistrationViewModel, CafeRegistrationState>((ref) {
  final CafeUseCase cafeUseCase = ref.watch(cafeUseCaseProvider);
  final GlobalViewModel globalViewModel = ref.watch(globalViewModelProvider.notifier);
  return CafeRegistrationViewModel(cafeUseCase: cafeUseCase, globalViewModel: globalViewModel);
});

final cafeInfoModificationViewModelProvider = StateNotifierProvider<CafeInfoModificationViewModel, CafeInfoModificationState>((ref) {
  final CafeUseCase cafeUseCase = ref.watch(cafeUseCaseProvider);
  final GlobalViewModel globalViewModel = ref.watch(globalViewModelProvider.notifier);
  return CafeInfoModificationViewModel(cafeUseCase: cafeUseCase, globalViewModel: globalViewModel);
});

final requestViewModelProvider = StateNotifierProvider<RequestViewModel, RequestState>((ref) {
  final CafeUseCase cafeUseCase = ref.watch(cafeUseCaseProvider);
  final GlobalViewModel globalViewModel = ref.watch(globalViewModelProvider.notifier);
  return RequestViewModel(cafeUseCase: cafeUseCase, globalViewModel: globalViewModel);
});


// ui ----------------------------------------------------------------------------------------------
final bottomNavBarHeightProvider = Provider<double>((ref) => 65.0);
final bottomNavBarCornerRadiusProvider = Provider<double>((ref) => 20.0);
