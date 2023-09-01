
import 'dart:async';
import 'package:cafejari_flutter/core/exception.dart';
import 'package:cafejari_flutter/core/extension/null.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:cafejari_flutter/domain/use_case/user_use_case.dart';
import 'package:cafejari_flutter/ui/app_config/duration.dart';
import 'package:cafejari_flutter/ui/components/custom_snack_bar.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafejari_flutter/domain/use_case/token_use_case.dart';
import 'package:cafejari_flutter/ui/state/global_state/global_state.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';


class GlobalViewModel extends StateNotifier<GlobalState> {
  final TokenUseCase _tokenUseCase;
  final UserUseCase _userUseCase;
  Timer? _showSnackBarTimer1;
  Timer? _showSnackBarTimer2;

  GlobalViewModel(
    this._tokenUseCase,
    this._userUseCase,
    this._showSnackBarTimer1,
    this._showSnackBarTimer2
  ) : super(GlobalState.empty());

  init() async {
    try {
      final String accessToken = await _tokenUseCase.getAccessToken();
      final User user = await _userUseCase.getUser(accessToken: accessToken);
      saveLoginResult(accessToken: accessToken, user: user);
    } on RefreshTokenExpired {
      null;
    } on ErrorWithMessage catch (e) {
      showSnackBar(content: e.message, type: SnackBarType.error);
    }
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

  void logout() {
    // 로그아웃 로직
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

  void expireRefreshToken() {
    // refresh token이 만료되었을 때 로직
  }

  void updateCurrentPageTo(int index) => state = state.copyWith(currentPage: PageType.values[index]);

  void saveLoginResult({
    required String accessToken,
    required User user,
    String? refreshToken
  }) {
    state = state.copyWith(accessToken: accessToken, user: user, isLoggedIn: true);
    if (refreshToken.isNotNull) {
      _tokenUseCase.saveRefreshToken(newRefreshToken: refreshToken!);
    }
  }

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
}