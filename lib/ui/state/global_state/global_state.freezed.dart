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
  String get accessToken => throw _privateConstructorUsedError;
  bool get isLoggedIn => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  PageType get currentPage => throw _privateConstructorUsedError;
  Size get deviceSize => throw _privateConstructorUsedError;

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
      {String accessToken,
      bool isLoggedIn,
      User user,
      PageType currentPage,
      Size deviceSize});

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
    Object? accessToken = null,
    Object? isLoggedIn = null,
    Object? user = null,
    Object? currentPage = null,
    Object? deviceSize = freezed,
  }) {
    return _then(_value.copyWith(
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
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as PageType,
      deviceSize: freezed == deviceSize
          ? _value.deviceSize
          : deviceSize // ignore: cast_nullable_to_non_nullable
              as Size,
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
      {String accessToken,
      bool isLoggedIn,
      User user,
      PageType currentPage,
      Size deviceSize});

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
    Object? accessToken = null,
    Object? isLoggedIn = null,
    Object? user = null,
    Object? currentPage = null,
    Object? deviceSize = freezed,
  }) {
    return _then(_$_GlobalState(
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
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as PageType,
      deviceSize: freezed == deviceSize
          ? _value.deviceSize
          : deviceSize // ignore: cast_nullable_to_non_nullable
              as Size,
    ));
  }
}

/// @nodoc

class _$_GlobalState implements _GlobalState {
  _$_GlobalState(
      {required this.accessToken,
      required this.isLoggedIn,
      required this.user,
      required this.currentPage,
      required this.deviceSize});

  @override
  final String accessToken;
  @override
  final bool isLoggedIn;
  @override
  final User user;
  @override
  final PageType currentPage;
  @override
  final Size deviceSize;

  @override
  String toString() {
    return 'GlobalState(accessToken: $accessToken, isLoggedIn: $isLoggedIn, user: $user, currentPage: $currentPage, deviceSize: $deviceSize)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GlobalState &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.isLoggedIn, isLoggedIn) ||
                other.isLoggedIn == isLoggedIn) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            const DeepCollectionEquality()
                .equals(other.deviceSize, deviceSize));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accessToken, isLoggedIn, user,
      currentPage, const DeepCollectionEquality().hash(deviceSize));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GlobalStateCopyWith<_$_GlobalState> get copyWith =>
      __$$_GlobalStateCopyWithImpl<_$_GlobalState>(this, _$identity);
}

abstract class _GlobalState implements GlobalState {
  factory _GlobalState(
      {required final String accessToken,
      required final bool isLoggedIn,
      required final User user,
      required final PageType currentPage,
      required final Size deviceSize}) = _$_GlobalState;

  @override
  String get accessToken;
  @override
  bool get isLoggedIn;
  @override
  User get user;
  @override
  PageType get currentPage;
  @override
  Size get deviceSize;
  @override
  @JsonKey(ignore: true)
  _$$_GlobalStateCopyWith<_$_GlobalState> get copyWith =>
      throw _privateConstructorUsedError;
}
