// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MyPageState {
  List<({String imageUrl, int profileImageId})> get defaultProfileImages =>
      throw _privateConstructorUsedError;
  TextEditingController get userMigrationPhoneNumberController =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyPageStateCopyWith<MyPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyPageStateCopyWith<$Res> {
  factory $MyPageStateCopyWith(
          MyPageState value, $Res Function(MyPageState) then) =
      _$MyPageStateCopyWithImpl<$Res, MyPageState>;
  @useResult
  $Res call(
      {List<({String imageUrl, int profileImageId})> defaultProfileImages,
      TextEditingController userMigrationPhoneNumberController});
}

/// @nodoc
class _$MyPageStateCopyWithImpl<$Res, $Val extends MyPageState>
    implements $MyPageStateCopyWith<$Res> {
  _$MyPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defaultProfileImages = null,
    Object? userMigrationPhoneNumberController = null,
  }) {
    return _then(_value.copyWith(
      defaultProfileImages: null == defaultProfileImages
          ? _value.defaultProfileImages
          : defaultProfileImages // ignore: cast_nullable_to_non_nullable
              as List<({String imageUrl, int profileImageId})>,
      userMigrationPhoneNumberController: null ==
              userMigrationPhoneNumberController
          ? _value.userMigrationPhoneNumberController
          : userMigrationPhoneNumberController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MyPageStateCopyWith<$Res>
    implements $MyPageStateCopyWith<$Res> {
  factory _$$_MyPageStateCopyWith(
          _$_MyPageState value, $Res Function(_$_MyPageState) then) =
      __$$_MyPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<({String imageUrl, int profileImageId})> defaultProfileImages,
      TextEditingController userMigrationPhoneNumberController});
}

/// @nodoc
class __$$_MyPageStateCopyWithImpl<$Res>
    extends _$MyPageStateCopyWithImpl<$Res, _$_MyPageState>
    implements _$$_MyPageStateCopyWith<$Res> {
  __$$_MyPageStateCopyWithImpl(
      _$_MyPageState _value, $Res Function(_$_MyPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defaultProfileImages = null,
    Object? userMigrationPhoneNumberController = null,
  }) {
    return _then(_$_MyPageState(
      defaultProfileImages: null == defaultProfileImages
          ? _value._defaultProfileImages
          : defaultProfileImages // ignore: cast_nullable_to_non_nullable
              as List<({String imageUrl, int profileImageId})>,
      userMigrationPhoneNumberController: null ==
              userMigrationPhoneNumberController
          ? _value.userMigrationPhoneNumberController
          : userMigrationPhoneNumberController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
    ));
  }
}

/// @nodoc

class _$_MyPageState implements _MyPageState {
  _$_MyPageState(
      {required final List<({String imageUrl, int profileImageId})>
          defaultProfileImages,
      required this.userMigrationPhoneNumberController})
      : _defaultProfileImages = defaultProfileImages;

  final List<({String imageUrl, int profileImageId})> _defaultProfileImages;
  @override
  List<({String imageUrl, int profileImageId})> get defaultProfileImages {
    if (_defaultProfileImages is EqualUnmodifiableListView)
      return _defaultProfileImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_defaultProfileImages);
  }

  @override
  final TextEditingController userMigrationPhoneNumberController;

  @override
  String toString() {
    return 'MyPageState(defaultProfileImages: $defaultProfileImages, userMigrationPhoneNumberController: $userMigrationPhoneNumberController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyPageState &&
            const DeepCollectionEquality()
                .equals(other._defaultProfileImages, _defaultProfileImages) &&
            (identical(other.userMigrationPhoneNumberController,
                    userMigrationPhoneNumberController) ||
                other.userMigrationPhoneNumberController ==
                    userMigrationPhoneNumberController));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_defaultProfileImages),
      userMigrationPhoneNumberController);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MyPageStateCopyWith<_$_MyPageState> get copyWith =>
      __$$_MyPageStateCopyWithImpl<_$_MyPageState>(this, _$identity);
}

abstract class _MyPageState implements MyPageState {
  factory _MyPageState(
      {required final List<({String imageUrl, int profileImageId})>
          defaultProfileImages,
      required final TextEditingController
          userMigrationPhoneNumberController}) = _$_MyPageState;

  @override
  List<({String imageUrl, int profileImageId})> get defaultProfileImages;
  @override
  TextEditingController get userMigrationPhoneNumberController;
  @override
  @JsonKey(ignore: true)
  _$$_MyPageStateCopyWith<_$_MyPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
