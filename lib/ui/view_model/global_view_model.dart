import 'dart:async';
import 'dart:math';
import 'package:cafejari_flutter/core/app_version.dart';
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/domain/entity/app_config/app_config.dart';
import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/domain/entity/push/push.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:cafejari_flutter/domain/use_case/app_config_use_case.dart';
import 'package:cafejari_flutter/domain/use_case/cafe_use_case.dart';
import 'package:cafejari_flutter/domain/use_case/challenge_use_case.dart';
import 'package:cafejari_flutter/domain/use_case/leaderboard_use_case.dart';
import 'package:cafejari_flutter/domain/use_case/push_use_case.dart';
import 'package:cafejari_flutter/domain/use_case/user_use_case.dart';
import 'package:cafejari_flutter/ui/app_config/duration.dart';
import 'package:cafejari_flutter/ui/components/custom_snack_bar.dart';
import 'package:cafejari_flutter/ui/components/review_dialog.dart';
import 'package:cafejari_flutter/ui/components/square_alert_dialog.dart';
import 'package:cafejari_flutter/ui/util/web_view_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/domain/use_case/token_use_case.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:launch_review/launch_review.dart';
import 'package:permission_handler/permission_handler.dart';


class GlobalViewModel extends StateNotifier<GlobalState> {
  final AppConfigUseCase _appConfigUseCase;
  final TokenUseCase _tokenUseCase;
  final UserUseCase _userUseCase;
  final CafeUseCase _cafeUseCase;
  final LeaderboardUseCase _leaderboardUseCase;
  final ChallengeUseCase _challengeUseCase;
  final PushUseCase _pushUseCase;
  Timer? _showSnackBarTimer1;
  Timer? _showSnackBarTimer2;
  Timer? _appFeedbackTimer;

  GlobalViewModel(
    this._appConfigUseCase,
    this._tokenUseCase,
    this._userUseCase,
    this._cafeUseCase,
    this._leaderboardUseCase,
    this._challengeUseCase,
    this._pushUseCase,
    this._showSnackBarTimer1,
    this._showSnackBarTimer2,
  ) : super(GlobalState.empty());

  checkVersion({required BuildContext context}) async {
    try {
      final Versions versions = await _appConfigUseCase.getAppVersions();
      state = state.copyWith(versions: versions);
      if (versions.isNotEmpty) {
        final Version latestVersion = versions.first;
        if(
          latestVersion.major == LocalAppVersion.major &&
          latestVersion.minor == LocalAppVersion.minor &&
          latestVersion.patch > LocalAppVersion.patch
        ) {
          // 권장 업데이트
          if (context.mounted) {
            showDialog(context: context, builder: (_) => SquareAlertDialog(
              text: "앱의 최신 버전이 있어요. 업데이트 화면으로 이동할까요?",
              negativeButtonText: "아니오",
              positiveButtonText: "네",
              onDismiss: () => Navigator.of(context).pop(),
              onNegativeButtonPress: () {},
              onPositiveButtonPress: () => LaunchReview.launch(
                androidAppId: "kr.co.cafejari.cafejari_flutter",
                iOSAppId: "6467621695",
                writeReview: false
              )
            ));
          }
        } else if (
          latestVersion.major > LocalAppVersion.major ||
          latestVersion.minor > LocalAppVersion.minor
        ) {
          // 필수 업데이트
          if (context.mounted) {
            showDialog(context: context, barrierDismissible: false, builder: (_) => PopScope(
              canPop: false,
              onPopInvoked: (result) => SystemNavigator.pop(),
              child: SquareAlertDialog(
                text: "필수 업데이트가 있습니다. 앱의 원활한 사용을 위해 업데이트 후 진행해주세요",
                negativeButtonText: "나중에",
                positiveButtonText: "업데이트",
                onDismiss: () => SystemNavigator.pop(),
                onNegativeButtonPress: () {},
                onPositiveButtonPress: () => LaunchReview.launch(
                  androidAppId: "kr.co.cafejari.cafejari_flutter",
                  iOSAppId: "6467621695",
                  writeReview: false
                )
              ),
            ));
          }
        }
      }
    } on ErrorWithMessage {
      null;
    }
  }

  init({
    String? accessToken,
    String? refreshToken,
    User? user,
    Function(GlobalState)? onFinish
  }) async {
    try {
      final String newAccessToken = accessToken ?? await _tokenUseCase.getAccessToken();
      User newUser = user ?? await _userUseCase.getUser(
        accessToken: newAccessToken,
        onAccessTokenRefresh: setAccessToken
      );
      final String? fcmToken = await FirebaseMessaging.instance.getToken();
      if (fcmToken != newUser.fcmToken) {
        newUser = await _userUseCase.updateProfile(
          accessToken: newAccessToken,
          profileId: newUser.profileId,
          fcmToken: fcmToken,
          onAccessTokenRefresh: setAccessToken
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
        myChallengers: await _challengeUseCase.getMyChallengers(
          accessToken: newAccessToken,
          onAccessTokenRefresh: setAccessToken
        ),
        myTodayUpdates: await _cafeUseCase.getMyTodayOccupancyUpdates(
          accessToken: newAccessToken,
          onAccessTokenRefresh: setAccessToken
        ),
        myPushes: await _pushUseCase.getMyPushes(
          accessToken: newAccessToken,
          onAccessTokenRefresh: setAccessToken
        )
      );
    } on RefreshTokenExpired {
      null;
    } on ErrorWithMessage {
      null;
    } finally {
      if(onFinish.isNotNull) onFinish!(state);
    }
  }

  AdManagerBannerAd loadBannerAd() {
    return AdManagerBannerAd(
      adUnitId: '/6499/example/banner',
      request: const AdManagerAdRequest(),
      sizes: [AdSize.banner],
      listener: AdManagerBannerAdListener(),
    )..load();
  }

  startAppFeedbackTimer({required BuildContext context}) async {
    if (await getIsReviewSubmitted()) {
      _appFeedbackTimer?.cancel();
    } else if(_appFeedbackTimer.isNull) {
      _appFeedbackTimer = Timer(const Duration(seconds: 150), () async {
        await startAppFeedbackTimer(context: context);
      });
    } else if(context.mounted) {
      _appFeedbackTimer?.cancel();
      if (!GoRouter.of(context).canPop()) {
        showAppFeedbackDialog(context: context);
        _appFeedbackTimer = Timer(const Duration(seconds: 100), () async {
          await startAppFeedbackTimer(context: context);
        });
      } else {
        _appFeedbackTimer = Timer(const Duration(seconds: 10), () async {
          await startAppFeedbackTimer(context: context);
        });
      }
    }
  }

  showAppFeedbackDialog({required BuildContext context}) async {
    if(context.mounted) {
      final InAppReview inAppReview = InAppReview.instance;
      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => SquareAlertDialog(
          text: "잠깐💡 앱을 평가해주세요! 카페자리가 \n카페 이용에 도움이 되셨나요?",
          negativeButtonText: "별로에요",
          positiveButtonText: "쓸만해요",
          onDismiss: () {},
          onXButtonPress: () => Navigator.pop(context),
          onNegativeButtonPress: () async {
            Navigator.pop(context);
            await showDialog(context: context, builder: (_) => const ReviewDialog());
          },
          onPositiveButtonPress: () async {
            if (await inAppReview.isAvailable()) await inAppReview.requestReview();
            setIsReviewSubmitted(true);
            if (context.mounted) Navigator.pop(context);
          },
        )
      );
    }
  }

  Future<bool> getIsInstalledFirst() async => await _appConfigUseCase.getIsInstalledFirstTime();

  setIsInstalledFirst(bool value) async => await _appConfigUseCase.setIsInstalledFirstTime(value);

  Future<bool> getIsReviewSubmitted() async => await _appConfigUseCase.getIsReviewSubmitted();

  setIsReviewSubmitted(bool value) async => await _appConfigUseCase.setIsReviewSubmitted(value);

  setChallengeBadgeVisible(bool value) => state = state.copyWith(isChallengeBadgeVisible: value);

  setFlagButtonBadgeVisible(bool value) => state = state.copyWith(isFlagButtonBadgeVisible: value);

  Future<bool> getIsFlagButtonTapped() async => await _appConfigUseCase.getIsFlagButtonTapped();

  setIsFlagButtonTapped(bool value) async => await _appConfigUseCase.setIsFlagButtonTapped(value);

  setUser(User user) => state = state.copyWith(user: user);

  setAccessToken(String accessToken) => state = state.copyWith(accessToken: accessToken);

  setMyOccupancyUpdates(Map<int, OccupancyRateUpdates> updates) => state = state.copyWith(myTodayUpdates: updates);

  setMyPushes(Pushes pushes) => state = state.copyWith(myPushes: pushes);

  logout({required BuildContext context}) async {
    try {
      await _userUseCase.logout(
        accessToken: state.accessToken,
        onAccessTokenRefresh: setAccessToken
      );
      clearUserInfo();
      showSnackBar(content: "로그아웃됨", type: SnackBarType.complete);
    } on ErrorWithMessage catch(e) {
      showSnackBar(content: e.message, type: SnackBarType.error);
    } on RefreshTokenExpired {
      if(context.mounted) expireRefreshToken(context: context);
    }
  }

  expireRefreshToken({required BuildContext context}) async {
    await clearUserInfo();
    showSnackBar(content: "로그인 유효기간이 만료되어 로그아웃 됐습니다. 다시 로그인 해주세요", type: SnackBarType.error);
    if(context.mounted) GoRouter.of(context).goNamed(ScreenRoute.login);
  }

  locationTrackingStart({required BuildContext context}) async {
    final permission = await Geolocator.requestPermission();
    if(permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      if(context.mounted) {
        showDialog(context: context, builder: (_) =>
          SquareAlertDialog(
            text: "위치 권한을 허용하지 않으시면 앱 사용이 매우 불편할 수 있어요. 설정화면으로 이동해 권한을 허용하시겠어요?",
            negativeButtonText: "아니오",
            positiveButtonText: "네",
            onDismiss: () => Navigator.of(context).pop(),
            onNegativeButtonPress: () {},
            onPositiveButtonPress: openAppSettings
          )
        );
      }
    } else if (permission == LocationPermission.unableToDetermine) {
      if(context.mounted) locationTrackingStart(context: context);
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
      _showSnackBarTimer2 = Timer(const Duration(milliseconds: 2500), closeSnackBar);
    });
  }

  closeSnackBar() => state = state.copyWith(isSnackBarOpened: false, isSnackBarExpanded: false);

  updateCurrentPageTo(int index) => state = state.copyWith(currentPage: PageType.values[index]);

  Future<bool?> isNearBy({required NLatLng from, required int meter}) async {
    final myLocation = state.currentDeviceLocation ?? await getFirstLocation();
    if (myLocation.isNotNull) {
      final myLatLng = NLatLng(myLocation!.latitude, myLocation.longitude);
      return getDistanceToMeter(from, myLatLng) < meter;
    } else {
      return null;
    }
    // return true;
  }

  initWebViewController(InAppWebViewController controller) => state = state.copyWith(webViewController: controller);

  navigateToWebView({
    required WebViewRoute route,
    required BuildContext context
  }) {
    state = state.copyWith(webViewTitle: route.title, webViewUri: route.uri);
    GoRouter.of(context).goNamed(ScreenRoute.webView);
  }

  clearUserInfo() async {
    await _tokenUseCase.deleteRefreshToken();
    state = state.copyWith(
      user: User.empty(),
      accessToken: "",
      isLoggedIn: false,
      myChallengers: [],
      myRanking: (week: null, month: null, total: null),
      myTodayUpdates: {}
    );
  }

  readPush({required int pushId, required BuildContext context}) async {
    try {
      final Push readPush = await _pushUseCase.readPush(
        accessToken: state.accessToken,
        pushId: pushId,
        onAccessTokenRefresh: setAccessToken
      );
      state = state.copyWith(
        myPushes: state.myPushes.map((e) => e.id == readPush.id ? readPush : e).toList()
      );
    } on ErrorWithMessage catch(e) {
      showSnackBar(content: e.message, type: SnackBarType.error);
    } on RefreshTokenExpired {
      if(context.mounted) expireRefreshToken(context: context);
    }
  }

  submitAppFeedback({required AppInconvenienceReason reason, required BuildContext context}) async {
    try {
      String feedback = "";
      switch(reason) {
        case AppInconvenienceReason.appUse: feedback = "앱 사용성";
        case AppInconvenienceReason.etc: feedback = "기타";
        case AppInconvenienceReason.noCafe: feedback = "카페 없음";
        case AppInconvenienceReason.noNeed: feedback = "정보 필요 없음";
        case AppInconvenienceReason.noUse: feedback = "카페 잘 안감";
        case AppInconvenienceReason.occupancyRate: feedback = "혼잡도 문제";
        default: feedback = "";
      }
      await _userUseCase.appFeedback(
        accessToken: state.isLoggedIn ? state.accessToken : null,
        feedback: feedback,
        onAccessTokenRefresh: setAccessToken
      );
      showSnackBar(content: "제출됨", type: SnackBarType.complete);
    } on ErrorWithMessage catch(e) {
      showSnackBar(content: e.message, type: SnackBarType.error);
    } on RefreshTokenExpired {
      if(context.mounted) expireRefreshToken(context: context);
    }
  }

  int getDistanceToMeter(NLatLng latLng1, NLatLng latLng2) {
    const double latitudeOf1Meter = 0.000009094341;
    const double longitudeOf1Meter = 0.000011268875366;
    final double latDistanceMeter = (latLng1.latitude - latLng2.latitude).abs() / latitudeOf1Meter;
    final double lngDistanceMeter = (latLng1.longitude - latLng2.longitude).abs() / longitudeOf1Meter;
    return sqrt(pow(latDistanceMeter, 2) + pow(lngDistanceMeter, 2)).toInt();
  }
}