// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leaderboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LeaderboardState {
  List<PartialUser> get monthRankers => throw _privateConstructorUsedError;
  List<PartialUser> get weekRankers => throw _privateConstructorUsedError;
  List<PartialUser> get totalRankers => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LeaderboardStateCopyWith<LeaderboardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaderboardStateCopyWith<$Res> {
  factory $LeaderboardStateCopyWith(
          LeaderboardState value, $Res Function(LeaderboardState) then) =
      _$LeaderboardStateCopyWithImpl<$Res, LeaderboardState>;
  @useResult
  $Res call(
      {List<PartialUser> monthRankers,
      List<PartialUser> weekRankers,
      List<PartialUser> totalRankers});
}

/// @nodoc
class _$LeaderboardStateCopyWithImpl<$Res, $Val extends LeaderboardState>
    implements $LeaderboardStateCopyWith<$Res> {
  _$LeaderboardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? monthRankers = null,
    Object? weekRankers = null,
    Object? totalRankers = null,
  }) {
    return _then(_value.copyWith(
      monthRankers: null == monthRankers
          ? _value.monthRankers
          : monthRankers // ignore: cast_nullable_to_non_nullable
              as List<PartialUser>,
      weekRankers: null == weekRankers
          ? _value.weekRankers
          : weekRankers // ignore: cast_nullable_to_non_nullable
              as List<PartialUser>,
      totalRankers: null == totalRankers
          ? _value.totalRankers
          : totalRankers // ignore: cast_nullable_to_non_nullable
              as List<PartialUser>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeaderboardStateImplCopyWith<$Res>
    implements $LeaderboardStateCopyWith<$Res> {
  factory _$$LeaderboardStateImplCopyWith(_$LeaderboardStateImpl value,
          $Res Function(_$LeaderboardStateImpl) then) =
      __$$LeaderboardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<PartialUser> monthRankers,
      List<PartialUser> weekRankers,
      List<PartialUser> totalRankers});
}

/// @nodoc
class __$$LeaderboardStateImplCopyWithImpl<$Res>
    extends _$LeaderboardStateCopyWithImpl<$Res, _$LeaderboardStateImpl>
    implements _$$LeaderboardStateImplCopyWith<$Res> {
  __$$LeaderboardStateImplCopyWithImpl(_$LeaderboardStateImpl _value,
      $Res Function(_$LeaderboardStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? monthRankers = null,
    Object? weekRankers = null,
    Object? totalRankers = null,
  }) {
    return _then(_$LeaderboardStateImpl(
      monthRankers: null == monthRankers
          ? _value._monthRankers
          : monthRankers // ignore: cast_nullable_to_non_nullable
              as List<PartialUser>,
      weekRankers: null == weekRankers
          ? _value._weekRankers
          : weekRankers // ignore: cast_nullable_to_non_nullable
              as List<PartialUser>,
      totalRankers: null == totalRankers
          ? _value._totalRankers
          : totalRankers // ignore: cast_nullable_to_non_nullable
              as List<PartialUser>,
    ));
  }
}

/// @nodoc

class _$LeaderboardStateImpl implements _LeaderboardState {
  _$LeaderboardStateImpl(
      {required final List<PartialUser> monthRankers,
      required final List<PartialUser> weekRankers,
      required final List<PartialUser> totalRankers})
      : _monthRankers = monthRankers,
        _weekRankers = weekRankers,
        _totalRankers = totalRankers;

  final List<PartialUser> _monthRankers;
  @override
  List<PartialUser> get monthRankers {
    if (_monthRankers is EqualUnmodifiableListView) return _monthRankers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_monthRankers);
  }

  final List<PartialUser> _weekRankers;
  @override
  List<PartialUser> get weekRankers {
    if (_weekRankers is EqualUnmodifiableListView) return _weekRankers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weekRankers);
  }

  final List<PartialUser> _totalRankers;
  @override
  List<PartialUser> get totalRankers {
    if (_totalRankers is EqualUnmodifiableListView) return _totalRankers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_totalRankers);
  }

  @override
  String toString() {
    return 'LeaderboardState(monthRankers: $monthRankers, weekRankers: $weekRankers, totalRankers: $totalRankers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaderboardStateImpl &&
            const DeepCollectionEquality()
                .equals(other._monthRankers, _monthRankers) &&
            const DeepCollectionEquality()
                .equals(other._weekRankers, _weekRankers) &&
            const DeepCollectionEquality()
                .equals(other._totalRankers, _totalRankers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_monthRankers),
      const DeepCollectionEquality().hash(_weekRankers),
      const DeepCollectionEquality().hash(_totalRankers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaderboardStateImplCopyWith<_$LeaderboardStateImpl> get copyWith =>
      __$$LeaderboardStateImplCopyWithImpl<_$LeaderboardStateImpl>(
          this, _$identity);
}

abstract class _LeaderboardState implements LeaderboardState {
  factory _LeaderboardState(
      {required final List<PartialUser> monthRankers,
      required final List<PartialUser> weekRankers,
      required final List<PartialUser> totalRankers}) = _$LeaderboardStateImpl;

  @override
  List<PartialUser> get monthRankers;
  @override
  List<PartialUser> get weekRankers;
  @override
  List<PartialUser> get totalRankers;
  @override
  @JsonKey(ignore: true)
  _$$LeaderboardStateImplCopyWith<_$LeaderboardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
