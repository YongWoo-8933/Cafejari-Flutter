import 'package:cafejari_flutter/domain/entity/app_config/app_config.dart';
import 'package:cafejari_flutter/domain/entity/challenge/challenge.dart';
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
    required final bool isPermissionChecked,
    required final String accessToken,
    required final bool isLoggedIn,
    required final User user,
    required final ({int? week, int? month, int? total}) myRanking,
    required final Challengers myChallengers,
    required final PageType currentPage,
    required final bool isSnackBarOpened,
    required final bool isSnackBarExpanded,
    required final String snackBarText,
    required final SnackBarType snackBarType,
    required final Position? currentDeviceLocation,
    required final InAppWebViewController? webViewController,
    required final String webViewTitle,
    required final Uri webViewUri,
  }) = _GlobalState;

  factory GlobalState.empty() => GlobalState(
    versions: [],
    isPermissionChecked: false,
    accessToken: "",
    isLoggedIn: false,
    user: User.empty(),
    myRanking: (week: null, month: null, total: null),
    myChallengers: [],
    currentPage: PageType.map,
    isSnackBarOpened: false,
    isSnackBarExpanded: false,
    snackBarText: "",
    snackBarType: SnackBarType.complete,
    currentDeviceLocation: null,
    webViewController: null,
    webViewTitle: "",
    webViewUri: Uri.parse("https://google.com")
  );
}
