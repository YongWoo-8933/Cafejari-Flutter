// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'push_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PushState {
  List<Push> get pushes => throw _privateConstructorUsedError;
  List<Push> get typePushes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PushStateCopyWith<PushState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PushStateCopyWith<$Res> {
  factory $PushStateCopyWith(PushState value, $Res Function(PushState) then) =
      _$PushStateCopyWithImpl<$Res, PushState>;
  @useResult
  $Res call({List<Push> pushes, List<Push> typePushes});
}

/// @nodoc
class _$PushStateCopyWithImpl<$Res, $Val extends PushState>
    implements $PushStateCopyWith<$Res> {
  _$PushStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pushes = null,
    Object? typePushes = null,
  }) {
    return _then(_value.copyWith(
      pushes: null == pushes
          ? _value.pushes
          : pushes // ignore: cast_nullable_to_non_nullable
              as List<Push>,
      typePushes: null == typePushes
          ? _value.typePushes
          : typePushes // ignore: cast_nullable_to_non_nullable
              as List<Push>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PushStateCopyWith<$Res> implements $PushStateCopyWith<$Res> {
  factory _$$_PushStateCopyWith(
          _$_PushState value, $Res Function(_$_PushState) then) =
      __$$_PushStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Push> pushes, List<Push> typePushes});
}

/// @nodoc
class __$$_PushStateCopyWithImpl<$Res>
    extends _$PushStateCopyWithImpl<$Res, _$_PushState>
    implements _$$_PushStateCopyWith<$Res> {
  __$$_PushStateCopyWithImpl(
      _$_PushState _value, $Res Function(_$_PushState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pushes = null,
    Object? typePushes = null,
  }) {
    return _then(_$_PushState(
      pushes: null == pushes
          ? _value._pushes
          : pushes // ignore: cast_nullable_to_non_nullable
              as List<Push>,
      typePushes: null == typePushes
          ? _value._typePushes
          : typePushes // ignore: cast_nullable_to_non_nullable
              as List<Push>,
    ));
  }
}

/// @nodoc

class _$_PushState implements _PushState {
  _$_PushState(
      {required final List<Push> pushes, required final List<Push> typePushes})
      : _pushes = pushes,
        _typePushes = typePushes;

  final List<Push> _pushes;
  @override
  List<Push> get pushes {
    if (_pushes is EqualUnmodifiableListView) return _pushes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pushes);
  }

  final List<Push> _typePushes;
  @override
  List<Push> get typePushes {
    if (_typePushes is EqualUnmodifiableListView) return _typePushes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_typePushes);
  }

  @override
  String toString() {
    return 'PushState(pushes: $pushes, typePushes: $typePushes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PushState &&
            const DeepCollectionEquality().equals(other._pushes, _pushes) &&
            const DeepCollectionEquality()
                .equals(other._typePushes, _typePushes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_pushes),
      const DeepCollectionEquality().hash(_typePushes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PushStateCopyWith<_$_PushState> get copyWith =>
      __$$_PushStateCopyWithImpl<_$_PushState>(this, _$identity);
}

abstract class _PushState implements PushState {
  factory _PushState(
      {required final List<Push> pushes,
      required final List<Push> typePushes}) = _$_PushState;

  @override
  List<Push> get pushes;
  @override
  List<Push> get typePushes;
  @override
  @JsonKey(ignore: true)
  _$$_PushStateCopyWith<_$_PushState> get copyWith =>
      throw _privateConstructorUsedError;
}
