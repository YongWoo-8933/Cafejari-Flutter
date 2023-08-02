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
  List<LeaderInfo> get monthLeaderInfos => throw _privateConstructorUsedError;
  List<LeaderInfo> get weekLeaderInfos => throw _privateConstructorUsedError;
  LeaderInfo get selectedLeaderInfo => throw _privateConstructorUsedError;

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
      {List<LeaderInfo> monthLeaderInfos,
      List<LeaderInfo> weekLeaderInfos,
      LeaderInfo selectedLeaderInfo});

  $LeaderInfoCopyWith<$Res> get selectedLeaderInfo;
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
    Object? monthLeaderInfos = null,
    Object? weekLeaderInfos = null,
    Object? selectedLeaderInfo = null,
  }) {
    return _then(_value.copyWith(
      monthLeaderInfos: null == monthLeaderInfos
          ? _value.monthLeaderInfos
          : monthLeaderInfos // ignore: cast_nullable_to_non_nullable
              as List<LeaderInfo>,
      weekLeaderInfos: null == weekLeaderInfos
          ? _value.weekLeaderInfos
          : weekLeaderInfos // ignore: cast_nullable_to_non_nullable
              as List<LeaderInfo>,
      selectedLeaderInfo: null == selectedLeaderInfo
          ? _value.selectedLeaderInfo
          : selectedLeaderInfo // ignore: cast_nullable_to_non_nullable
              as LeaderInfo,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LeaderInfoCopyWith<$Res> get selectedLeaderInfo {
    return $LeaderInfoCopyWith<$Res>(_value.selectedLeaderInfo, (value) {
      return _then(_value.copyWith(selectedLeaderInfo: value) as $Val);
    });
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
      {List<LeaderInfo> monthLeaderInfos,
      List<LeaderInfo> weekLeaderInfos,
      LeaderInfo selectedLeaderInfo});

  @override
  $LeaderInfoCopyWith<$Res> get selectedLeaderInfo;
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
    Object? monthLeaderInfos = null,
    Object? weekLeaderInfos = null,
    Object? selectedLeaderInfo = null,
  }) {
    return _then(_$_LeaderState(
      monthLeaderInfos: null == monthLeaderInfos
          ? _value._monthLeaderInfos
          : monthLeaderInfos // ignore: cast_nullable_to_non_nullable
              as List<LeaderInfo>,
      weekLeaderInfos: null == weekLeaderInfos
          ? _value._weekLeaderInfos
          : weekLeaderInfos // ignore: cast_nullable_to_non_nullable
              as List<LeaderInfo>,
      selectedLeaderInfo: null == selectedLeaderInfo
          ? _value.selectedLeaderInfo
          : selectedLeaderInfo // ignore: cast_nullable_to_non_nullable
              as LeaderInfo,
    ));
  }
}

/// @nodoc

class _$_LeaderState implements _LeaderState {
  _$_LeaderState(
      {required final List<LeaderInfo> monthLeaderInfos,
      required final List<LeaderInfo> weekLeaderInfos,
      required this.selectedLeaderInfo})
      : _monthLeaderInfos = monthLeaderInfos,
        _weekLeaderInfos = weekLeaderInfos;

  final List<LeaderInfo> _monthLeaderInfos;
  @override
  List<LeaderInfo> get monthLeaderInfos {
    if (_monthLeaderInfos is EqualUnmodifiableListView)
      return _monthLeaderInfos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_monthLeaderInfos);
  }

  final List<LeaderInfo> _weekLeaderInfos;
  @override
  List<LeaderInfo> get weekLeaderInfos {
    if (_weekLeaderInfos is EqualUnmodifiableListView) return _weekLeaderInfos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weekLeaderInfos);
  }

  @override
  final LeaderInfo selectedLeaderInfo;

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
                .equals(other._monthLeaderInfos, _monthLeaderInfos) &&
            const DeepCollectionEquality()
                .equals(other._weekLeaderInfos, _weekLeaderInfos) &&
            (identical(other.selectedLeaderInfo, selectedLeaderInfo) ||
                other.selectedLeaderInfo == selectedLeaderInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_monthLeaderInfos),
      const DeepCollectionEquality().hash(_weekLeaderInfos),
      selectedLeaderInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LeaderStateCopyWith<_$_LeaderState> get copyWith =>
      __$$_LeaderStateCopyWithImpl<_$_LeaderState>(this, _$identity);
}

abstract class _LeaderState implements LeaderState {
  factory _LeaderState(
      {required final List<LeaderInfo> monthLeaderInfos,
      required final List<LeaderInfo> weekLeaderInfos,
      required final LeaderInfo selectedLeaderInfo}) = _$_LeaderState;

  @override
  List<LeaderInfo> get monthLeaderInfos;
  @override
  List<LeaderInfo> get weekLeaderInfos;
  @override
  LeaderInfo get selectedLeaderInfo;
  @override
  @JsonKey(ignore: true)
  _$$_LeaderStateCopyWith<_$_LeaderState> get copyWith =>
      throw _privateConstructorUsedError;
}
