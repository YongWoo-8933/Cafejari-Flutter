// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'global_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GlobalState {
  List<Version> get versions => throw _privateConstructorUsedError;
  bool get isPermissionChecked => throw _privateConstructorUsedError;
  String get accessToken => throw _privateConstructorUsedError;
  bool get isLoggedIn => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  ({int? month, int? total, int? week}) get myRanking =>
      throw _privateConstructorUsedError;
  List<Challenger> get myChallengers => throw _privateConstructorUsedError;
  PageType get currentPage => throw _privateConstructorUsedError;
  bool get isSnackBarOpened => throw _privateConstructorUsedError;
  bool get isSnackBarExpanded => throw _privateConstructorUsedError;
  String get snackBarText => throw _privateConstructorUsedError;
  SnackBarType get snackBarType => throw _privateConstructorUsedError;
  Position? get currentDeviceLocation => throw _privateConstructorUsedError;
  InAppWebViewController? get webViewController =>
      throw _privateConstructorUsedError;
  String get webViewTitle => throw _privateConstructorUsedError;
  Uri get webViewUri => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GlobalStateCopyWith<GlobalState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalStateCopyWith<$Res> {
  factory $GlobalStateCopyWith(
          GlobalState value, $Res Function(GlobalState) then) =
      _$GlobalStateCopyWithImpl<$Res, GlobalState>;
  @useResult
  $Res call(
      {List<Version> versions,
      bool isPermissionChecked,
      String accessToken,
      bool isLoggedIn,
      User user,
      ({int? month, int? total, int? week}) myRanking,
      List<Challenger> myChallengers,
      PageType currentPage,
      bool isSnackBarOpened,
      bool isSnackBarExpanded,
      String snackBarText,
      SnackBarType snackBarType,
      Position? currentDeviceLocation,
      InAppWebViewController? webViewController,
      String webViewTitle,
      Uri webViewUri});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$GlobalStateCopyWithImpl<$Res, $Val extends GlobalState>
    implements $GlobalStateCopyWith<$Res> {
  _$GlobalStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? versions = null,
    Object? isPermissionChecked = null,
    Object? accessToken = null,
    Object? isLoggedIn = null,
    Object? user = null,
    Object? myRanking = null,
    Object? myChallengers = null,
    Object? currentPage = null,
    Object? isSnackBarOpened = null,
    Object? isSnackBarExpanded = null,
    Object? snackBarText = null,
    Object? snackBarType = null,
    Object? currentDeviceLocation = freezed,
    Object? webViewController = freezed,
    Object? webViewTitle = null,
    Object? webViewUri = null,
  }) {
    return _then(_value.copyWith(
      versions: null == versions
          ? _value.versions
          : versions // ignore: cast_nullable_to_non_nullable
              as List<Version>,
      isPermissionChecked: null == isPermissionChecked
          ? _value.isPermissionChecked
          : isPermissionChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      isLoggedIn: null == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      myRanking: null == myRanking
          ? _value.myRanking
          : myRanking // ignore: cast_nullable_to_non_nullable
              as ({int? month, int? total, int? week}),
      myChallengers: null == myChallengers
          ? _value.myChallengers
          : myChallengers // ignore: cast_nullable_to_non_nullable
              as List<Challenger>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as PageType,
      isSnackBarOpened: null == isSnackBarOpened
          ? _value.isSnackBarOpened
          : isSnackBarOpened // ignore: cast_nullable_to_non_nullable
              as bool,
      isSnackBarExpanded: null == isSnackBarExpanded
          ? _value.isSnackBarExpanded
          : isSnackBarExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      snackBarText: null == snackBarText
          ? _value.snackBarText
          : snackBarText // ignore: cast_nullable_to_non_nullable
              as String,
      snackBarType: null == snackBarType
          ? _value.snackBarType
          : snackBarType // ignore: cast_nullable_to_non_nullable
              as SnackBarType,
      currentDeviceLocation: freezed == currentDeviceLocation
          ? _value.currentDeviceLocation
          : currentDeviceLocation // ignore: cast_nullable_to_non_nullable
              as Position?,
      webViewController: freezed == webViewController
          ? _value.webViewController
          : webViewController // ignore: cast_nullable_to_non_nullable
              as InAppWebViewController?,
      webViewTitle: null == webViewTitle
          ? _value.webViewTitle
          : webViewTitle // ignore: cast_nullable_to_non_nullable
              as String,
      webViewUri: null == webViewUri
          ? _value.webViewUri
          : webViewUri // ignore: cast_nullable_to_non_nullable
              as Uri,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GlobalStateCopyWith<$Res>
    implements $GlobalStateCopyWith<$Res> {
  factory _$$_GlobalStateCopyWith(
          _$_GlobalState value, $Res Function(_$_GlobalState) then) =
      __$$_GlobalStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Version> versions,
      bool isPermissionChecked,
      String accessToken,
      bool isLoggedIn,
      User user,
      ({int? month, int? total, int? week}) myRanking,
      List<Challenger> myChallengers,
      PageType currentPage,
      bool isSnackBarOpened,
      bool isSnackBarExpanded,
      String snackBarText,
      SnackBarType snackBarType,
      Position? currentDeviceLocation,
      InAppWebViewController? webViewController,
      String webViewTitle,
      Uri webViewUri});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_GlobalStateCopyWithImpl<$Res>
    extends _$GlobalStateCopyWithImpl<$Res, _$_GlobalState>
    implements _$$_GlobalStateCopyWith<$Res> {
  __$$_GlobalStateCopyWithImpl(
      _$_GlobalState _value, $Res Function(_$_GlobalState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? versions = null,
    Object? isPermissionChecked = null,
    Object? accessToken = null,
    Object? isLoggedIn = null,
    Object? user = null,
    Object? myRanking = null,
    Object? myChallengers = null,
    Object? currentPage = null,
    Object? isSnackBarOpened = null,
    Object? isSnackBarExpanded = null,
    Object? snackBarText = null,
    Object? snackBarType = null,
    Object? currentDeviceLocation = freezed,
    Object? webViewController = freezed,
    Object? webViewTitle = null,
    Object? webViewUri = null,
  }) {
    return _then(_$_GlobalState(
      versions: null == versions
          ? _value._versions
          : versions // ignore: cast_nullable_to_non_nullable
              as List<Version>,
      isPermissionChecked: null == isPermissionChecked
          ? _value.isPermissionChecked
          : isPermissionChecked // ignore: cast_nullable_to_non_nullable
              as bool,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      isLoggedIn: null == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      myRanking: null == myRanking
          ? _value.myRanking
          : myRanking // ignore: cast_nullable_to_non_nullable
              as ({int? month, int? total, int? week}),
      myChallengers: null == myChallengers
          ? _value._myChallengers
          : myChallengers // ignore: cast_nullable_to_non_nullable
              as List<Challenger>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as PageType,
      isSnackBarOpened: null == isSnackBarOpened
          ? _value.isSnackBarOpened
          : isSnackBarOpened // ignore: cast_nullable_to_non_nullable
              as bool,
      isSnackBarExpanded: null == isSnackBarExpanded
          ? _value.isSnackBarExpanded
          : isSnackBarExpanded // ignore: cast_nullable_to_non_nullable
              as bool,
      snackBarText: null == snackBarText
          ? _value.snackBarText
          : snackBarText // ignore: cast_nullable_to_non_nullable
              as String,
      snackBarType: null == snackBarType
          ? _value.snackBarType
          : snackBarType // ignore: cast_nullable_to_non_nullable
              as SnackBarType,
      currentDeviceLocation: freezed == currentDeviceLocation
          ? _value.currentDeviceLocation
          : currentDeviceLocation // ignore: cast_nullable_to_non_nullable
              as Position?,
      webViewController: freezed == webViewController
          ? _value.webViewController
          : webViewController // ignore: cast_nullable_to_non_nullable
              as InAppWebViewController?,
      webViewTitle: null == webViewTitle
          ? _value.webViewTitle
          : webViewTitle // ignore: cast_nullable_to_non_nullable
              as String,
      webViewUri: null == webViewUri
          ? _value.webViewUri
          : webViewUri // ignore: cast_nullable_to_non_nullable
              as Uri,
    ));
  }
}

/// @nodoc

class _$_GlobalState implements _GlobalState {
  _$_GlobalState(
      {required final List<Version> versions,
      required this.isPermissionChecked,
      required this.accessToken,
      required this.isLoggedIn,
      required this.user,
      required this.myRanking,
      required final List<Challenger> myChallengers,
      required this.currentPage,
      required this.isSnackBarOpened,
      required this.isSnackBarExpanded,
      required this.snackBarText,
      required this.snackBarType,
      required this.currentDeviceLocation,
      required this.webViewController,
      required this.webViewTitle,
      required this.webViewUri})
      : _versions = versions,
        _myChallengers = myChallengers;

  final List<Version> _versions;
  @override
  List<Version> get versions {
    if (_versions is EqualUnmodifiableListView) return _versions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_versions);
  }

  @override
  final bool isPermissionChecked;
  @override
  final String accessToken;
  @override
  final bool isLoggedIn;
  @override
  final User user;
  @override
  final ({int? month, int? total, int? week}) myRanking;
  final List<Challenger> _myChallengers;
  @override
  List<Challenger> get myChallengers {
    if (_myChallengers is EqualUnmodifiableListView) return _myChallengers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_myChallengers);
  }

  @override
  final PageType currentPage;
  @override
  final bool isSnackBarOpened;
  @override
  final bool isSnackBarExpanded;
  @override
  final String snackBarText;
  @override
  final SnackBarType snackBarType;
  @override
  final Position? currentDeviceLocation;
  @override
  final InAppWebViewController? webViewController;
  @override
  final String webViewTitle;
  @override
  final Uri webViewUri;

  @override
  String toString() {
    return 'GlobalState(versions: $versions, isPermissionChecked: $isPermissionChecked, accessToken: $accessToken, isLoggedIn: $isLoggedIn, user: $user, myRanking: $myRanking, myChallengers: $myChallengers, currentPage: $currentPage, isSnackBarOpened: $isSnackBarOpened, isSnackBarExpanded: $isSnackBarExpanded, snackBarText: $snackBarText, snackBarType: $snackBarType, currentDeviceLocation: $currentDeviceLocation, webViewController: $webViewController, webViewTitle: $webViewTitle, webViewUri: $webViewUri)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GlobalState &&
            const DeepCollectionEquality().equals(other._versions, _versions) &&
            (identical(other.isPermissionChecked, isPermissionChecked) ||
                other.isPermissionChecked == isPermissionChecked) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.isLoggedIn, isLoggedIn) ||
                other.isLoggedIn == isLoggedIn) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.myRanking, myRanking) ||
                other.myRanking == myRanking) &&
            const DeepCollectionEquality()
                .equals(other._myChallengers, _myChallengers) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.isSnackBarOpened, isSnackBarOpened) ||
                other.isSnackBarOpened == isSnackBarOpened) &&
            (identical(other.isSnackBarExpanded, isSnackBarExpanded) ||
                other.isSnackBarExpanded == isSnackBarExpanded) &&
            (identical(other.snackBarText, snackBarText) ||
                other.snackBarText == snackBarText) &&
            (identical(other.snackBarType, snackBarType) ||
                other.snackBarType == snackBarType) &&
            (identical(other.currentDeviceLocation, currentDeviceLocation) ||
                other.currentDeviceLocation == currentDeviceLocation) &&
            (identical(other.webViewController, webViewController) ||
                other.webViewController == webViewController) &&
            (identical(other.webViewTitle, webViewTitle) ||
                other.webViewTitle == webViewTitle) &&
            (identical(other.webViewUri, webViewUri) ||
                other.webViewUri == webViewUri));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_versions),
      isPermissionChecked,
      accessToken,
      isLoggedIn,
      user,
      myRanking,
      const DeepCollectionEquality().hash(_myChallengers),
      currentPage,
      isSnackBarOpened,
      isSnackBarExpanded,
      snackBarText,
      snackBarType,
      currentDeviceLocation,
      webViewController,
      webViewTitle,
      webViewUri);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GlobalStateCopyWith<_$_GlobalState> get copyWith =>
      __$$_GlobalStateCopyWithImpl<_$_GlobalState>(this, _$identity);
}

abstract class _GlobalState implements GlobalState {
  factory _GlobalState(
      {required final List<Version> versions,
      required final bool isPermissionChecked,
      required final String accessToken,
      required final bool isLoggedIn,
      required final User user,
      required final ({int? month, int? total, int? week}) myRanking,
      required final List<Challenger> myChallengers,
      required final PageType currentPage,
      required final bool isSnackBarOpened,
      required final bool isSnackBarExpanded,
      required final String snackBarText,
      required final SnackBarType snackBarType,
      required final Position? currentDeviceLocation,
      required final InAppWebViewController? webViewController,
      required final String webViewTitle,
      required final Uri webViewUri}) = _$_GlobalState;

  @override
  List<Version> get versions;
  @override
  bool get isPermissionChecked;
  @override
  String get accessToken;
  @override
  bool get isLoggedIn;
  @override
  User get user;
  @override
  ({int? month, int? total, int? week}) get myRanking;
  @override
  List<Challenger> get myChallengers;
  @override
  PageType get currentPage;
  @override
  bool get isSnackBarOpened;
  @override
  bool get isSnackBarExpanded;
  @override
  String get snackBarText;
  @override
  SnackBarType get snackBarType;
  @override
  Position? get currentDeviceLocation;
  @override
  InAppWebViewController? get webViewController;
  @override
  String get webViewTitle;
  @override
  Uri get webViewUri;
  @override
  @JsonKey(ignore: true)
  _$$_GlobalStateCopyWith<_$_GlobalState> get copyWith =>
      throw _privateConstructorUsedError;
}
