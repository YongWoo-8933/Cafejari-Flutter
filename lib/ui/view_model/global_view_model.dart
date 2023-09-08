
import 'dart:async';
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:cafejari_flutter/domain/use_case/challenge_use_case.dart';
import 'package:cafejari_flutter/domain/use_case/leaderboard_use_case.dart';
import 'package:cafejari_flutter/domain/use_case/user_use_case.dart';
import 'package:cafejari_flutter/ui/app_config/app_color.dart';
import 'package:cafejari_flutter/ui/app_config/duration.dart';
import 'package:cafejari_flutter/ui/components/custom_snack_bar.dart';
import 'package:cafejari_flutter/ui/util/web_view_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/domain/use_case/token_use_case.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';


class GlobalViewModel extends StateNotifier<GlobalState> {
  final TokenUseCase _tokenUseCase;
  final UserUseCase _userUseCase;
  final LeaderboardUseCase _leaderboardUseCase;
  final ChallengeUseCase _challengeUseCase;
  Timer? _showSnackBarTimer1;
  Timer? _showSnackBarTimer2;

  GlobalViewModel(
    this._tokenUseCase,
    this._userUseCase,
    this._leaderboardUseCase,
    this._challengeUseCase,
    this._showSnackBarTimer1,
    this._showSnackBarTimer2
  ) : super(GlobalState.empty());

  init({
    String? accessToken,
    String? refreshToken,
    User? user,
  }) async {
    try {
      final String newAccessToken = accessToken ?? await _tokenUseCase.getAccessToken();
      User newUser = user ?? await _userUseCase.getUser(accessToken: newAccessToken);
      final String? fcmToken = await FirebaseMessaging.instance.getToken();
      print(fcmToken);
      if (fcmToken != newUser.fcmToken) {
        newUser = await _userUseCase.updateProfile(
          accessToken: newAccessToken,
          profileId: newUser.profileId,
          fcmToken: fcmToken
        );
      }
      if (refreshToken.isNotNull) _tokenUseCase.saveRefreshToken(newRefreshToken: refreshToken!);
      final PartialUsers weekRankers = await _leaderboardUseCase.getWeekRankers();
      final int weekRankingIndex = weekRankers.indexWhere((e) => e.userId == newUser.userId);
      final PartialUsers monthRankers = await _leaderboardUseCase.getMonthRankers();
      final int monthRankingIndex = monthRankers.indexWhere((e) => e.userId == newUser.userId);
      final PartialUsers totalRankers = await _leaderboardUseCase.getTotalRankers();
      final int totalRankingIndex = totalRankers.indexWhere((e) => e.userId == newUser.userId);
      state = state.copyWith(
        user: newUser,
        accessToken: newAccessToken,
        isLoggedIn: true,
        myRanking: (
          week: weekRankingIndex < 0 ? null : weekRankingIndex + 1,
          month: monthRankingIndex < 0 ? null : monthRankingIndex + 1,
          total: totalRankingIndex < 0 ? null : totalRankingIndex + 1
        ),
        myChallengers: await _challengeUseCase.getMyChallengers(accessToken: newAccessToken)
      );
    } on RefreshTokenExpired {
      null;
    } on ErrorWithMessage {
      null;
    }
  }

  Future<bool> getIsInstalledFirst() async => await _userUseCase.getIsInstalledFirstTime();

  setIsInstalledFirst(bool value) async => await _userUseCase.setIsInstalledFirstTime(value);

  setIsPermissionChecked(bool value) => state = state.copyWith(isPermissionChecked: value);

  setUser(User user) => state = state.copyWith(user: user);

  logout({required BuildContext context}) async {
    try {
      await _userUseCase.logout(accessToken: state.accessToken);
      _clearUserInfo();
      showSnackBar(content: "로그아웃됨", type: SnackBarType.complete);
    } on ErrorWithMessage catch(e) {
      showSnackBar(content: e.message, type: SnackBarType.error);
    } on RefreshTokenExpired {
      if(context.mounted) expireRefreshToken(context: context);
    }
  }

  expireRefreshToken({required BuildContext context}) async {
    _clearUserInfo();
    showSnackBar(content: "로그인 유효기간이 만료되어 로그아웃 됐습니다. 다시 로그인 해주세요", type: SnackBarType.error);
    if(context.mounted) GoRouter.of(context).goNamed(ScreenRoute.login);
  }

  locationTrackingStart() async {
    final permission = await Geolocator.requestPermission();
    if(permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      showSnackBar(content: "위치 권한을 허용해주세요. 3초 후 설정 화면으로 이동합니다", type: SnackBarType.error);
      Future.delayed(const Duration(seconds: 3), () { openAppSettings(); });
    } else if (permission == LocationPermission.unableToDetermine) {
      locationTrackingStart();
    } else {
      const LocationSettings locationSettings = LocationSettings(accuracy: LocationAccuracy.high);
      Geolocator.getPositionStream(locationSettings: locationSettings).listen(
        (Position? position) => state = state.copyWith(currentDeviceLocation: position)
      );
    }
  }

  Future<Position?> getFirstLocation() async {
    final permission = await Geolocator.requestPermission();
    if(permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      showSnackBar(content: "위치 권한을 허용해주세요. 3초 후 설정 화면으로 이동합니다", type: SnackBarType.error);
      Future.delayed(const Duration(seconds: 3), () { openAppSettings(); });
      return null;
    } else if (permission == LocationPermission.unableToDetermine) {
      getFirstLocation();
      return null;
    } else {
      return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    }
  }

  void showSnackBar({required String content, required SnackBarType type}) {
    state = state.copyWith(
      snackBarText: content, snackBarType: type, isSnackBarOpened: true
    );
    _showSnackBarTimer1?.cancel();
    _showSnackBarTimer2?.cancel();
    _showSnackBarTimer1 = Timer(AppDuration.animationDefault, () {
      state = state.copyWith(isSnackBarExpanded: true);
      _showSnackBarTimer2 = Timer(const Duration(milliseconds: 2500), () {
        state = state.copyWith(isSnackBarOpened: false, isSnackBarExpanded: false);
      });
    });
  }

  void updateCurrentPageTo(int index) => state = state.copyWith(currentPage: PageType.values[index]);

  Future<bool> isNearBy({required NLatLng from, required int meter}) async {
    const double latitudeOf1Meter = 0.000009094341;
    const double longitudeOf1Meter = 0.000011268875366;
    final myLocation = state.currentDeviceLocation ?? await getFirstLocation();
    return true;
    // if (myLocation.isNotNull) {
    //   return myLocation!.latitude < from.latitude + latitudeOf1Meter * meter &&
    //     myLocation.latitude > from.latitude - latitudeOf1Meter * meter &&
    //     myLocation.longitude > from.longitude - longitudeOf1Meter * meter &&
    //     myLocation.longitude < from.longitude + longitudeOf1Meter * meter;
    // } else {
    //   return false;
    // }
  }

  initWebViewController(InAppWebViewController controller) => state = state.copyWith(webViewController: controller);

  navigateToWebView({
    required WebViewRoute route,
    required BuildContext context
  }) {
    state = state.copyWith(webViewTitle: route.title, webViewUri: route.uri);
    GoRouter.of(context).goNamed(ScreenRoute.webView);
  }

  showOnBoarding({required BuildContext context}) {
    showDialog(context: context, builder: (_) => Dialog(
      insetPadding: const EdgeInsets.symmetric(vertical: 100, horizontal: 30),
      child: Container(
        color: AppColor.white,
        child: const Text("여기는 온보딩 빠바방"),
      ),
    ));
  }

  _clearUserInfo() {
    state = state.copyWith(
      user: User.empty(),
      accessToken: "",
      isLoggedIn: false,
      myChallengers: [],
      myRanking: (week: null, month: null, total: null)
    );
  }
}