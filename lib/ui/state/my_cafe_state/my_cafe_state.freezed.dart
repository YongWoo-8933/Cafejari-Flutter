// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_cafe_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MyCafeState {
  User get user => throw _privateConstructorUsedError;
  List<Cafe> get favoriteCafe => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyCafeStateCopyWith<MyCafeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyCafeStateCopyWith<$Res> {
  factory $MyCafeStateCopyWith(
          MyCafeState value, $Res Function(MyCafeState) then) =
      _$MyCafeStateCopyWithImpl<$Res, MyCafeState>;
  @useResult
  $Res call({User user, List<Cafe> favoriteCafe});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$MyCafeStateCopyWithImpl<$Res, $Val extends MyCafeState>
    implements $MyCafeStateCopyWith<$Res> {
  _$MyCafeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? favoriteCafe = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      favoriteCafe: null == favoriteCafe
          ? _value.favoriteCafe
          : favoriteCafe // ignore: cast_nullable_to_non_nullable
              as List<Cafe>,
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
abstract class _$$_MyCafeStateCopyWith<$Res>
    implements $MyCafeStateCopyWith<$Res> {
  factory _$$_MyCafeStateCopyWith(
          _$_MyCafeState value, $Res Function(_$_MyCafeState) then) =
      __$$_MyCafeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User user, List<Cafe> favoriteCafe});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_MyCafeStateCopyWithImpl<$Res>
    extends _$MyCafeStateCopyWithImpl<$Res, _$_MyCafeState>
    implements _$$_MyCafeStateCopyWith<$Res> {
  __$$_MyCafeStateCopyWithImpl(
      _$_MyCafeState _value, $Res Function(_$_MyCafeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? favoriteCafe = null,
  }) {
    return _then(_$_MyCafeState(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      favoriteCafe: null == favoriteCafe
          ? _value._favoriteCafe
          : favoriteCafe // ignore: cast_nullable_to_non_nullable
              as List<Cafe>,
    ));
  }
}

/// @nodoc

class _$_MyCafeState implements _MyCafeState {
  _$_MyCafeState({required this.user, required final List<Cafe> favoriteCafe})
      : _favoriteCafe = favoriteCafe;

  @override
  final User user;
  final List<Cafe> _favoriteCafe;
  @override
  List<Cafe> get favoriteCafe {
    if (_favoriteCafe is EqualUnmodifiableListView) return _favoriteCafe;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteCafe);
  }

  @override
  String toString() {
    return 'MyCafeState(user: $user, favoriteCafe: $favoriteCafe)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyCafeState &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality()
                .equals(other._favoriteCafe, _favoriteCafe));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, user, const DeepCollectionEquality().hash(_favoriteCafe));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MyCafeStateCopyWith<_$_MyCafeState> get copyWith =>
      __$$_MyCafeStateCopyWithImpl<_$_MyCafeState>(this, _$identity);
}

abstract class _MyCafeState implements MyCafeState {
  factory _MyCafeState(
      {required final User user,
      required final List<Cafe> favoriteCafe}) = _$_MyCafeState;

  @override
  User get user;
  @override
  List<Cafe> get favoriteCafe;
  @override
  @JsonKey(ignore: true)
  _$$_MyCafeStateCopyWith<_$_MyCafeState> get copyWith =>
      throw _privateConstructorUsedError;
}
