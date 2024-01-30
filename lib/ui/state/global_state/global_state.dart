import 'package:cafejari_flutter/domain/entity/app_config/app_config.dart';
import 'package:cafejari_flutter/domain/entity/cafe/cafe.dart';
import 'package:cafejari_flutter/domain/entity/challenge/challenge.dart';
import 'package:cafejari_flutter/domain/entity/push/push.dart';
import 'package:cafejari_flutter/ui/components/custom_snack_bar.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cafejari_flutter/domain/entity/user/user.dart';
import 'package:cafejari_flutter/ui/util/screen_route.dart';
import 'package:geolocator/geolocator.dart';

part 'global_state.freezed.dart';

@freezed
class GlobalState with _$GlobalState {
  factory GlobalState({
    required final Versions versions,
    required final String accessToken,
    required final bool isLoggedIn,
    required final User user,
    required final Map<int, OccupancyRateUpdates> myTodayUpdates,
    required final ({int? week, int? month, int? total}) myRanking,
    required final Challengers myChallengers,
    required final Pushes myPushes,
    required final PageType currentPage,
    required final bool isSnackBarOpened,
    required final bool isSnackBarExpanded,
    required final String snackBarText,
    required final SnackBarType snackBarType,
    required final Position? currentDeviceLocation,
    required final InAppWebViewController? webViewController,
    required final String webViewTitle,
    required final Uri webViewUri,
    required final bool isChallengeBadgeVisible,
    required final bool isFlagButtonBadgeVisible
  }) = _GlobalState;

  factory GlobalState.empty() => GlobalState(
    versions: [],
    accessToken: "",
    isLoggedIn: false,
    user: User.empty(),
    myTodayUpdates: {},
    myRanking: (week: null, month: null, total: null),
    myChallengers: [],
    myPushes: [],
    currentPage: PageType.map,
    isSnackBarOpened: false,
    isSnackBarExpanded: false,
    snackBarText: "",
    snackBarType: SnackBarType.complete,
    currentDeviceLocation: null,
    webViewController: null,
    webViewTitle: "",
    webViewUri: Uri.parse("https://google.com"),
    isChallengeBadgeVisible: false,
    isFlagButtonBadgeVisible: false
  );
}
