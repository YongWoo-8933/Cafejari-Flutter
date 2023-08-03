// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leader_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LeaderState {
  InvalidType get monthLeaderInfos => throw _privateConstructorUsedError;
  InvalidType get weekLeaderInfos => throw _privateConstructorUsedError;
  InvalidType get selectedLeaderInfo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LeaderStateCopyWith<LeaderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaderStateCopyWith<$Res> {
  factory $LeaderStateCopyWith(
          LeaderState value, $Res Function(LeaderState) then) =
      _$LeaderStateCopyWithImpl<$Res, LeaderState>;
  @useResult
  $Res call(
      {InvalidType monthLeaderInfos,
      InvalidType weekLeaderInfos,
      InvalidType selectedLeaderInfo});
}

/// @nodoc
class _$LeaderStateCopyWithImpl<$Res, $Val extends LeaderState>
    implements $LeaderStateCopyWith<$Res> {
  _$LeaderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? monthLeaderInfos = freezed,
    Object? weekLeaderInfos = freezed,
    Object? selectedLeaderInfo = freezed,
  }) {
    return _then(_value.copyWith(
      monthLeaderInfos: freezed == monthLeaderInfos
          ? _value.monthLeaderInfos
          : monthLeaderInfos // ignore: cast_nullable_to_non_nullable
              as InvalidType,
      weekLeaderInfos: freezed == weekLeaderInfos
          ? _value.weekLeaderInfos
          : weekLeaderInfos // ignore: cast_nullable_to_non_nullable
              as InvalidType,
      selectedLeaderInfo: freezed == selectedLeaderInfo
          ? _value.selectedLeaderInfo
          : selectedLeaderInfo // ignore: cast_nullable_to_non_nullable
              as InvalidType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LeaderStateCopyWith<$Res>
    implements $LeaderStateCopyWith<$Res> {
  factory _$$_LeaderStateCopyWith(
          _$_LeaderState value, $Res Function(_$_LeaderState) then) =
      __$$_LeaderStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {InvalidType monthLeaderInfos,
      InvalidType weekLeaderInfos,
      InvalidType selectedLeaderInfo});
}

/// @nodoc
class __$$_LeaderStateCopyWithImpl<$Res>
    extends _$LeaderStateCopyWithImpl<$Res, _$_LeaderState>
    implements _$$_LeaderStateCopyWith<$Res> {
  __$$_LeaderStateCopyWithImpl(
      _$_LeaderState _value, $Res Function(_$_LeaderState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? monthLeaderInfos = freezed,
    Object? weekLeaderInfos = freezed,
    Object? selectedLeaderInfo = freezed,
  }) {
    return _then(_$_LeaderState(
      monthLeaderInfos: freezed == monthLeaderInfos
          ? _value.monthLeaderInfos
          : monthLeaderInfos // ignore: cast_nullable_to_non_nullable
              as InvalidType,
      weekLeaderInfos: freezed == weekLeaderInfos
          ? _value.weekLeaderInfos
          : weekLeaderInfos // ignore: cast_nullable_to_non_nullable
              as InvalidType,
      selectedLeaderInfo: freezed == selectedLeaderInfo
          ? _value.selectedLeaderInfo
          : selectedLeaderInfo // ignore: cast_nullable_to_non_nullable
              as InvalidType,
    ));
  }
}

/// @nodoc

class _$_LeaderState implements _LeaderState {
  _$_LeaderState(
      {required this.monthLeaderInfos,
      required this.weekLeaderInfos,
      required this.selectedLeaderInfo});

  @override
  final InvalidType monthLeaderInfos;
  @override
  final InvalidType weekLeaderInfos;
  @override
  final InvalidType selectedLeaderInfo;

  @override
  String toString() {
    return 'LeaderState(monthLeaderInfos: $monthLeaderInfos, weekLeaderInfos: $weekLeaderInfos, selectedLeaderInfo: $selectedLeaderInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LeaderState &&
            const DeepCollectionEquality()
                .equals(other.monthLeaderInfos, monthLeaderInfos) &&
            const DeepCollectionEquality()
                .equals(other.weekLeaderInfos, weekLeaderInfos) &&
            const DeepCollectionEquality()
                .equals(other.selectedLeaderInfo, selectedLeaderInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(monthLeaderInfos),
      const DeepCollectionEquality().hash(weekLeaderInfos),
      const DeepCollectionEquality().hash(selectedLeaderInfo));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LeaderStateCopyWith<_$_LeaderState> get copyWith =>
      __$$_LeaderStateCopyWithImpl<_$_LeaderState>(this, _$identity);
}

abstract class _LeaderState implements LeaderState {
  factory _LeaderState(
      {required final InvalidType monthLeaderInfos,
      required final InvalidType weekLeaderInfos,
      required final InvalidType selectedLeaderInfo}) = _$_LeaderState;

  @override
  InvalidType get monthLeaderInfos;
  @override
  InvalidType get weekLeaderInfos;
  @override
  InvalidType get selectedLeaderInfo;
  @override
  @JsonKey(ignore: true)
  _$$_LeaderStateCopyWith<_$_LeaderState> get copyWith =>
      throw _privateConstructorUsedError;
}
