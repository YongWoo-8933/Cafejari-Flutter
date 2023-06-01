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

final tokenUseCaseProvider = Provider<TokenUseCase>((ref) {
  TokenRepository tokenRepository = ref.watch(tokenRepositoryProvider);
  return TokenUseCaseImpl(tokenRepository);
});

final mapUseCaseProvider = Provider<MapUseCase>((ref) {
  TokenRepository tokenRepository = ref.watch(tokenRepositoryProvider);
  CafeRepository cafeRepository = ref.watch(cafeRepositoryProvider);
  return MapUseCaseImpl(tokenRepository: tokenRepository, cafeRepository: cafeRepository);
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
  return ProfileViewModel(globalViewModel: viewModel);
});

final shopViewModelProvider = StateNotifierProvider<ShopViewModel, ShopState>((ref) {
  final viewModel = ref.watch(globalViewModelProvider.notifier);
  return ShopViewModel(globalViewModel: viewModel);
});
