// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginState {
  List<({int id, String imageUrl})> get profileImages =>
      throw _privateConstructorUsedError;
  TextEditingController get nicknameController =>
      throw _privateConstructorUsedError;
  PanelController get bottomSheetController =>
      throw _privateConstructorUsedError;
  String get kakaoAccessToken => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call(
      {List<({int id, String imageUrl})> profileImages,
      TextEditingController nicknameController,
      PanelController bottomSheetController,
      String kakaoAccessToken});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileImages = null,
    Object? nicknameController = null,
    Object? bottomSheetController = null,
    Object? kakaoAccessToken = null,
  }) {
    return _then(_value.copyWith(
      profileImages: null == profileImages
          ? _value.profileImages
          : profileImages // ignore: cast_nullable_to_non_nullable
              as List<({int id, String imageUrl})>,
      nicknameController: null == nicknameController
          ? _value.nicknameController
          : nicknameController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      bottomSheetController: null == bottomSheetController
          ? _value.bottomSheetController
          : bottomSheetController // ignore: cast_nullable_to_non_nullable
              as PanelController,
      kakaoAccessToken: null == kakaoAccessToken
          ? _value.kakaoAccessToken
          : kakaoAccessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginStateCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$_LoginStateCopyWith(
          _$_LoginState value, $Res Function(_$_LoginState) then) =
      __$$_LoginStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<({int id, String imageUrl})> profileImages,
      TextEditingController nicknameController,
      PanelController bottomSheetController,
      String kakaoAccessToken});
}

/// @nodoc
class __$$_LoginStateCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$_LoginState>
    implements _$$_LoginStateCopyWith<$Res> {
  __$$_LoginStateCopyWithImpl(
      _$_LoginState _value, $Res Function(_$_LoginState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileImages = null,
    Object? nicknameController = null,
    Object? bottomSheetController = null,
    Object? kakaoAccessToken = null,
  }) {
    return _then(_$_LoginState(
      profileImages: null == profileImages
          ? _value._profileImages
          : profileImages // ignore: cast_nullable_to_non_nullable
              as List<({int id, String imageUrl})>,
      nicknameController: null == nicknameController
          ? _value.nicknameController
          : nicknameController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      bottomSheetController: null == bottomSheetController
          ? _value.bottomSheetController
          : bottomSheetController // ignore: cast_nullable_to_non_nullable
              as PanelController,
      kakaoAccessToken: null == kakaoAccessToken
          ? _value.kakaoAccessToken
          : kakaoAccessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoginState implements _LoginState {
  _$_LoginState(
      {required final List<({int id, String imageUrl})> profileImages,
      required this.nicknameController,
      required this.bottomSheetController,
      required this.kakaoAccessToken})
      : _profileImages = profileImages;

  final List<({int id, String imageUrl})> _profileImages;
  @override
  List<({int id, String imageUrl})> get profileImages {
    if (_profileImages is EqualUnmodifiableListView) return _profileImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_profileImages);
  }

  @override
  final TextEditingController nicknameController;
  @override
  final PanelController bottomSheetController;
  @override
  final String kakaoAccessToken;

  @override
  String toString() {
    return 'LoginState(profileImages: $profileImages, nicknameController: $nicknameController, bottomSheetController: $bottomSheetController, kakaoAccessToken: $kakaoAccessToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginState &&
            const DeepCollectionEquality()
                .equals(other._profileImages, _profileImages) &&
            (identical(other.nicknameController, nicknameController) ||
                other.nicknameController == nicknameController) &&
            (identical(other.bottomSheetController, bottomSheetController) ||
                other.bottomSheetController == bottomSheetController) &&
            (identical(other.kakaoAccessToken, kakaoAccessToken) ||
                other.kakaoAccessToken == kakaoAccessToken));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_profileImages),
      nicknameController,
      bottomSheetController,
      kakaoAccessToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginStateCopyWith<_$_LoginState> get copyWith =>
      __$$_LoginStateCopyWithImpl<_$_LoginState>(this, _$identity);
}

abstract class _LoginState implements LoginState {
  factory _LoginState(
      {required final List<({int id, String imageUrl})> profileImages,
      required final TextEditingController nicknameController,
      required final PanelController bottomSheetController,
      required final String kakaoAccessToken}) = _$_LoginState;

  @override
  List<({int id, String imageUrl})> get profileImages;
  @override
  TextEditingController get nicknameController;
  @override
  PanelController get bottomSheetController;
  @override
  String get kakaoAccessToken;
  @override
  @JsonKey(ignore: true)
  _$$_LoginStateCopyWith<_$_LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}
