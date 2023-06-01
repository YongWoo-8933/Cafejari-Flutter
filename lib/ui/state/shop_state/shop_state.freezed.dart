// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ShopState {
  int get mapIndex => throw _privateConstructorUsedError;
  int get leaderIndex => throw _privateConstructorUsedError;
  int get profileIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShopStateCopyWith<ShopState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopStateCopyWith<$Res> {
  factory $ShopStateCopyWith(ShopState value, $Res Function(ShopState) then) =
      _$ShopStateCopyWithImpl<$Res, ShopState>;
  @useResult
  $Res call({int mapIndex, int leaderIndex, int profileIndex});
}

/// @nodoc
class _$ShopStateCopyWithImpl<$Res, $Val extends ShopState>
    implements $ShopStateCopyWith<$Res> {
  _$ShopStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mapIndex = null,
    Object? leaderIndex = null,
    Object? profileIndex = null,
  }) {
    return _then(_value.copyWith(
      mapIndex: null == mapIndex
          ? _value.mapIndex
          : mapIndex // ignore: cast_nullable_to_non_nullable
              as int,
      leaderIndex: null == leaderIndex
          ? _value.leaderIndex
          : leaderIndex // ignore: cast_nullable_to_non_nullable
              as int,
      profileIndex: null == profileIndex
          ? _value.profileIndex
          : profileIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShopStateCopyWith<$Res> implements $ShopStateCopyWith<$Res> {
  factory _$$_ShopStateCopyWith(
          _$_ShopState value, $Res Function(_$_ShopState) then) =
      __$$_ShopStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int mapIndex, int leaderIndex, int profileIndex});
}

/// @nodoc
class __$$_ShopStateCopyWithImpl<$Res>
    extends _$ShopStateCopyWithImpl<$Res, _$_ShopState>
    implements _$$_ShopStateCopyWith<$Res> {
  __$$_ShopStateCopyWithImpl(
      _$_ShopState _value, $Res Function(_$_ShopState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mapIndex = null,
    Object? leaderIndex = null,
    Object? profileIndex = null,
  }) {
    return _then(_$_ShopState(
      mapIndex: null == mapIndex
          ? _value.mapIndex
          : mapIndex // ignore: cast_nullable_to_non_nullable
              as int,
      leaderIndex: null == leaderIndex
          ? _value.leaderIndex
          : leaderIndex // ignore: cast_nullable_to_non_nullable
              as int,
      profileIndex: null == profileIndex
          ? _value.profileIndex
          : profileIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ShopState implements _ShopState {
  _$_ShopState(
      {required this.mapIndex,
      required this.leaderIndex,
      required this.profileIndex});

  @override
  final int mapIndex;
  @override
  final int leaderIndex;
  @override
  final int profileIndex;

  @override
  String toString() {
    return 'ShopState(mapIndex: $mapIndex, leaderIndex: $leaderIndex, profileIndex: $profileIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShopState &&
            (identical(other.mapIndex, mapIndex) ||
                other.mapIndex == mapIndex) &&
            (identical(other.leaderIndex, leaderIndex) ||
                other.leaderIndex == leaderIndex) &&
            (identical(other.profileIndex, profileIndex) ||
                other.profileIndex == profileIndex));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, mapIndex, leaderIndex, profileIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShopStateCopyWith<_$_ShopState> get copyWith =>
      __$$_ShopStateCopyWithImpl<_$_ShopState>(this, _$identity);
}

abstract class _ShopState implements ShopState {
  factory _ShopState(
      {required final int mapIndex,
      required final int leaderIndex,
      required final int profileIndex}) = _$_ShopState;

  @override
  int get mapIndex;
  @override
  int get leaderIndex;
  @override
  int get profileIndex;
  @override
  @JsonKey(ignore: true)
  _$$_ShopStateCopyWith<_$_ShopState> get copyWith =>
      throw _privateConstructorUsedError;
}
